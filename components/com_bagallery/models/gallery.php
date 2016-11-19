<?php
/**
* @package   BaGallery
* @author    Balbooa http://www.balbooa.com/
* @copyright Copyright @ Balbooa
* @license   http://www.gnu.org/licenses/gpl.html GNU/GPL
*/ 

defined('_JEXEC') or die;

jimport('joomla.application.component.modeladmin');
jimport('joomla.filesystem.folder');
jimport('joomla.filesystem.file');
 
class bagalleryModelgallery extends JModelAdmin
{
    public function getTable($type = 'Galleries', $prefix = 'GalleryTable', $config = array())
    {
        return JTable::getInstance($type, $prefix, $config);
    }
 
    public function getForm($data = array(), $loadData = true)
    {
        $form = $this->loadForm(
            $this->option . '.gallery', 'gallery', array('control' => 'jform', 'load_data' => $loadData)
        );
        if (empty($form))
        {
            return false;
        }
 
        return $form;
    }
    
    public function save($data)
    {
        $input = JFactory::getApplication()->input;
        $data = $input->post->get('jform', array(), 'array');
        $categories = $input->post->get('cat-options', array(), 'array');
        $db = JFactory::getDBO();
        $formId = $data['id'];
        $dirName = JPATH_ROOT. '/images/bagallery/gallery-' .$formId. '/album/';
        $catId = array();
        $catImgs = array();
        $order = 0;
        $obj = new stdClass();
        $obj->id = $formId;
        $obj->settings = $data['settings'];
        $obj->random_sorting = $data['random_sorting'];
        JFactory::getDbo()->updateObject('#__bagallery_galleries', $obj, 'id');
        foreach ($categories as $category) {
            if ($category != '') {
                $category = json_decode($category);
                $cat = explode(';', $category->settings);
                if (!empty($cat[5])) {
                    $name = explode('/', $cat[5]);
                    $catImgs[] = 'category-'.$cat[4].'-'.end($name);;
                } else {
                    if (!in_array('image-placeholder.jpg', $catImgs)) {
                        $catImgs[] = 'image-placeholder.jpg';
                    }
                }
                $table = JTable::getInstance('Category', 'GalleryTable');
                $table->load($category->id);
                $table->bind(array('form_id' => $formId, 'title' => $cat[0], 'orders' => $order,
                                   'settings' => $category->settings, 'parent' => $category->parent));
                $table->store();
                $catId[] = $table->id;
                $order++;
            }
        }
        if (jFolder::exists($dirName)) {
            $albums  = jFolder::files($dirName);
            foreach ($albums as $value) {
                if (!in_array($value, $catImgs)) {
                    print_r($value);
                }
            }
        }
        $query = $db->getQuery(true);
        $query->select("id")
            ->from("#__bagallery_category")
            ->where("form_id=" . $db->Quote($formId));
        $db->setQuery($query);
        $items = $db->loadColumn();
        foreach ($items as $id) {
            if (!in_array($id, $catId)) {
                $query = $db->getQuery(true);
                $conditions = array(
                    $db->quoteName('id'). '=' .$db->quote($id)
                );
                $query->delete($db->quoteName('#__bagallery_category'))
                    ->where($conditions);
                $db->setQuery($query)
                    ->execute();
            }
        }
        return true;
    }

    public function checkName($array, $name)
    {
        if (in_array($name, $array)) {
            $name = rand(0, 999999999).'-'.$name;
            $name = $this->checkName($array, $name);
        }

        return $name;
    }

    public function getThumbnail($id)
    {
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query->select('thumbnail_url')
            ->from('#__bagallery_items')
            ->where('`id` = '.$id);
        $db->setQuery($query);
        $res = $db->loadResult();
        $pos = stripos($res, 'images/');
        if ($pos !== 0) {
            $res = substr($res, $pos);
        }
        return $res;
    }
    
    public function clearImageDirectory($id, $allCat, $allThumb)
    {
        
        $dir = JPATH_ROOT. '/images/bagallery/gallery-' .$id. '/thumbnail';
        if (JFolder::exists($dir)) {
            $folders = jFolder::folders($dir);
            if (empty($folders)) {
                return;
            }
            foreach ($folders as $folder) {
                if (!in_array($folder, $allCat)) {
                    jFolder::delete($dir.'/'.$folder);
                } else {
                    $files = JFolder::files($dir .'/'.$folder);
                    if (!empty($files)) {
                        foreach ($files as $file) {
                            if (!in_array($file, $allThumb[$folder])) {
                                JFile::delete($dir .'/'.$folder. '/' .$file);
                            }
                        }
                    }
                }
            }
        }
    }
    
    public function checkObj($obj)
    {
        if (!isset($obj->title)) {
            $obj->title = '';
        }
        if (!isset($obj->short)) {
            $obj->short = '';
        }
        if (!isset($obj->alt)) {
            $obj->alt = '';
        }
        if (!isset($obj->description)) {
            $obj->description = '';
        }
        if (!isset($obj->link)) {
            $obj->link = '';
        }
        if (!isset($obj->video)) {
            $obj->video = '';
        }
        if (!isset($obj->lightboxUrl)) {
            $obj->lightboxUrl = '';
        }
        if (!isset($obj->hideInAll)) {
            $obj->hideInAll = 0;
        }
        return $obj;
    }
    
    protected function loadFormData()
    {
        $input = JFactory::getApplication()->input;
        $id = $input->get('id');
        $data = $this->getItem($id);
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query->select("id, settings, parent");
        $query->from("#__bagallery_category");
        $query->where("form_id=" . $id);
        $query->order("orders ASC");
        $db->setQuery($query);
        $categories = $db->loadObjectList();
        $data->gallery_category = json_encode($categories);
        $query = $db->getQuery(true);
        $query->select("settings, thumbnail_url");
        $query->from("#__bagallery_items");
        $query->where("form_id=" . $id);
        $query->order("id ASC");
        $db->setQuery($query);
        $items = $db->loadObjectList();
        foreach ($items as $item) {
            $obj = json_decode($item->settings);
            $index = stripos($obj->url, 'images/');
            if ($index !== 0) {
                $obj->url = substr($obj->url, $index);
            }
            $obj->url = JUri::root().$obj->url;
            $obj->thumbnail_url = $item->thumbnail_url;
            $item->settings = json_encode($obj);
        }
        $data->gallery_items = $data->gallery_items = json_encode($items);
        return $data;
    }
}
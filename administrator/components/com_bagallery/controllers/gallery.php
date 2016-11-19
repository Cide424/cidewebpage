<?php
/**
* @package   BaGallery
* @author    Balbooa http://www.balbooa.com/
* @copyright Copyright @ Balbooa
* @license   http://www.gnu.org/licenses/gpl.html GNU/GPL
*/

defined('_JEXEC') or die;

jimport('joomla.application.component.controllerform');
jimport('joomla.filesystem.folder');
jimport('joomla.filesystem.file');

class BagalleryControllerGallery extends JControllerForm
{
    public function save($key = null, $urlVar = null)
    {
        $data = $this->input->post->get('jform', array(), 'array');
        $model = $this->getModel();
        $table = $model->getTable();
        $url = $table->getKeyName();
        parent::save($key = $data['id'], $urlVar = $url);
    }

    public function checkProductTour()
    {
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query->select('`key`, `id`')
            ->from('`#__bagallery_api`')
            ->where('`service` = '.$db->Quote('product_tour'));
        $db->setQuery($query);
        $result = $db->loadObject();
        if ($result->key == 'false') {
            $obj = new stdClass();
            $obj->id = $result->id;
            $obj->key = 'true';
            JFactory::getDbo()->updateObject('#__bagallery_api', $obj, 'id');
        }
        echo $result->key;
        exit;
    }

    public function checkRate()
    {
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query->select('`key`, `id`')
            ->from('`#__bagallery_api`')
            ->where('`service` = '.$db->Quote('rate_gallery'));
        $db->setQuery($query);
        $result = $db->loadObject();
        if (empty($result)) {
            $result = 'false';
            $query = $db->getQuery(true);
            $obj = new stdClass();
            $obj->service = 'rate_gallery';
            $obj->key = strtotime('+3 days');
            $db->insertObject('#__bagallery_api', $obj);
        } else if ($result->key != 'false') {
            $now = strtotime(date('Y-m-d G:i:s'));
            if ($now - $result->key >= 0) {
                $obj = new stdClass();
                $obj->id = $result->id;
                $obj->key = 'false';
                JFactory::getDbo()->updateObject('#__bagallery_api', $obj, 'id');
                $result = 'true';
            } else {
                $result = 'false';
            }
        } else {
            $result = 'false';
        }
        echo $result;
        exit;
    }

    public function checkFileName($dir, $name)
    {
        $file = $dir.$name;
        if (JFile::exists($file)) {
            $name = rand(0, 10).'-'.$name;
            $name = $this->checkFileName($dir, $name);
        }
        return $name;
    }

    public function uploadAjax()
    {
        $dir = JPATH_ROOT. '/images/bagallery';
        $file = $_GET['file'];
        $file = JFile::makeSafe($file);
        if (!JFolder::exists($dir)) {
            jFolder::create($dir);
        }
        $dir .= '/original/';
        if (!JFolder::exists($dir)) {
            jFolder::create($dir);
        }
        $file = $this->checkFileName($dir, $file);
        $url = JUri::root(). 'images/bagallery/original';
        $ext = strtolower(JFile::getExt($file));
        if ($this->checkExt($ext)) {
            file_put_contents(
                $dir. $file,
                file_get_contents('php://input')
            );
            $image = new stdClass;
            $image->name = $file;
            $image->path = $dir. $file;
            $image->size = filesize($image->path);
            $image->width = 170;
            $image->height = 170;
            $image->min_width = 60;
            $image->min_height = 60;
            $image->url = $url. '/' .$file;
            echo json_encode($image);
        }
        exit;
    }

    public function checkExt($ext)
    {
        switch($ext) {
            case 'jpg':
            case 'png':
            case 'gif':
            case 'jpeg':
                return true;
            default:
                return false;
        }
    }

    public function getSession()
    {
        $session = JFactory::getSession();
        echo new JResponseJson($session->getState());
        exit;
    }

    public function clearOld()
    {
        $itemId = $_POST['gallery_items'];
        $allThumb = $_POST['allThumb'];
        $allCat = $_POST['allCat'];
        $formId = $_POST['ba_id'];
        $itemId = json_decode($itemId);
        $allThumb = json_decode($allThumb);
        $allCat = json_decode($allCat);
        $allThumb = get_object_vars($allThumb);
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query->select("id")
            ->from("#__bagallery_items")
            ->where("form_id=" . $db->Quote($formId));
        $db->setQuery($query);
        $items = $db->loadColumn();
        $model = $this->getModel();
        foreach ($items as $id) {
            if (!in_array($id, $itemId)) {
                $query = $db->getQuery(true);
                $thumbnail = $model->getThumbnail($id);
                $dir = JPATH_ROOT. '/'.$thumbnail;
                if (JFile::exists($dir)) {
                    JFile::delete($dir);
                }
                $conditions = array(
                    $db->quoteName('id'). '=' .$id
                );
                $query->delete($db->quoteName('#__bagallery_items'))
                    ->where($conditions);
                $db->setQuery($query)
                    ->execute();
            }
        }
        $model->clearImageDirectory($formId, $allCat, $allThumb);
        jexit();
    }

    public function saveItems()
    {
        $data = $_POST;
        $formId = $data['ba_id'];
        $items = $data['gallery_items'];
        $items = json_decode($items);
        $model = $this->getModel();
        $id = array();
        foreach ($items as $item) {
            $obj = $item;
            $obj = $model->checkObj($obj);
            $pos = stripos($obj->path, 'images/');
            if ($pos !== 0) {
                $obj->path = substr($obj->path, $pos);
            }
            $obj->path = JPATH_ROOT.'/'.$obj->path;
            $pos = stripos($obj->url, 'images/');
            if ($pos !== 0) {
                $obj->url = substr($obj->url, $pos);
            }
            if (!isset($obj->id)) {
                $table = JTable::getInstance('Items', 'GalleryTable');
                $table->bind(array('form_id' => $formId, 'category' => $obj->category,
                                   'name' => $obj->name, 'path' => $obj->path,
                                   'url' => $obj->url, 'thumbnail_url' => $obj->thumbnail_url,
                                   'title' => $obj->title, 'short' => $obj->short,
                                   'alt' => $obj->alt, 'description' => $obj->description,
                                   'link' => $obj->link, 'video' => $obj->video, 'settings' => $item,
                                   'imageId' => $obj->imageId, 'target' => $obj->target,
                                   'watermark_name' => $obj->watermark_name,
                                   'lightboxUrl' => $obj->lightboxUrl, 'hideInAll' => $obj->hideInAll));
                $table->store();
                $obj->id = $table->id;
                $db = JFactory::getDbo();
                $item = json_encode($obj);
                $query = "UPDATE `#__bagallery_items` SET `settings`=";
                $query .= $db->Quote($item). " WHERE `id`=" .$table->id;
                $db->setQuery($query)
                    ->execute();
                $id[] = $table->id;
            } else {
                $db = JFactory::getDbo();
                $query = "UPDATE `#__bagallery_items` SET `form_id`=";
                $query .= $db->Quote($formId). ", `category`=";
                $query .= $db->Quote($obj->category). ", `name`=";
                $query .= $db->Quote($obj->name). ", `path`=";
                $query .= $db->Quote($obj->path). ", `url`=";
                $query .= $db->Quote($obj->url). ", `thumbnail_url`=";
                $query .= $db->Quote($obj->thumbnail_url). ", `title`=";
                $query .= $db->Quote($obj->title). ", `short`=";
                $query .= $db->Quote($obj->short). ", `alt`=";
                $query .= $db->Quote($obj->alt). ", `description`=";
                $query .= $db->Quote($obj->description). ", `link`=";
                $query .= $db->Quote($obj->link). ", `video`=";
                $query .= $db->Quote($obj->video). ", `settings`=";
                $query .= $db->Quote(json_encode($obj)). ", `target`=";
                $query .= $db->Quote($obj->target). ", `lightboxUrl` =";
                $query .= $db->Quote($obj->lightboxUrl). ", `watermark_name` =";
                $query .= $db->Quote($obj->watermark_name).", `hideInAll` =";
                $query .= $db->Quote($obj->hideInAll)." WHERE `id`=";
                $query .= $db->Quote($obj->id);
                $db->setQuery($query)
                    ->execute();
            }
        }
        $id = json_encode($id);
        echo new JResponseJson(true, $id);
        jexit();
    }

    public function emptyThumbnails()
    {
        $id = $_POST['ba_id'];
        if (!empty($id)) {
            $dir = JPATH_ROOT. '/images/bagallery/gallery-' .$id. '/thumbnail';
            if (jFolder::exists($dir)) {
                jFolder::delete($dir);
            }
            $dir = JPATH_ROOT. '/images/bagallery/gallery-' .$id. '/album';
            if (jFolder::exists($dir)) {
                jFolder::delete($dir);
            }
        }
    }

    public function removeWatermark()
    {
        $id = $_POST['ba_id'];
        if (!empty($id)) {
            $dir = JPATH_ROOT. '/images/bagallery/gallery-' .$id. '/watermark';
            if (jFolder::exists($dir)) {
                jFolder::delete($dir);
            }
        }
    }
}
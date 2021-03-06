 
<?php
/**
* @package   BaGallery
* @author    Balbooa http://www.balbooa.com/
* @copyright Copyright @ Balbooa
* @license   http://www.gnu.org/licenses/gpl.html GNU/GPL
*/

defined('_JEXEC') or die;

// import Joomla view library
jimport('joomla.application.component.view');

class bagalleryViewGallery extends JViewLegacy
{
    protected $_album;

    public function display ($tpl = null)
    {
        if (count($errors = $this->get('Errors'))) {
            JError::raiseError(500, implode('<br />', $errors));
            return false;
        }
        if (!JFactory::getUser()->authorise('core.edit', 'com_bagallery')) {
            return JError::raiseError(500, JText::_('NOT_HAVE_PERMISSIONS'));
        }
        $input = JFactory::getApplication()->input;
        $id = $input->get('id');
        if (empty($id)) {
            return;
        }
        $this->form = $this->get('Form');
        $this->item = $this->get('Item');
        $this->_album = $this->getAlbum();
        $doc = JFactory::getDocument();
        $doc->addScript(JUri::root(true) . '/media/jui/js/jquery.min.js');
        $doc->addScript(JUri::root(true) . '/media/jui/js/bootstrap.min.js');
        
        parent::display($tpl);
    }

    protected function getAlbum()
    {
        $id = $_GET['id'];
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query->select('album_mode')
            ->from('#__bagallery_galleries')
            ->where('`id` = '.$id);
        $db->setQuery($query);
        $res = $db->loadResult();

        return $res;
    }

    protected function addToolBar()
    {
        $input = JFactory::getApplication()->input;
        $input->set('hidemainmenu', true);
        $isNew = ($this->item->id == 0);
        JToolBarHelper::title($isNew ? JText::_('BAGALLERY_NEW') : JText::_('BAGALLERY_EDIT'),'image');
        JToolBarHelper::apply('gallery.apply', 'JTOOLBAR_APPLY');
        JToolBarHelper::save('gallery.save');
        JToolBarHelper::cancel('gallery.cancel', $isNew ? 'JTOOLBAR_CANCEL' : 'JTOOLBAR_CLOSE');
    }
}
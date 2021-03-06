<?php
/**
* @package   BaGallery
* @author    Balbooa http://www.balbooa.com/
* @copyright Copyright @ Balbooa
* @license   http://www.gnu.org/licenses/gpl.html GNU/GPL
*/

defined('_JEXEC') or die;

// import Joomla controllerform library
jimport('joomla.application.component.controllerform');
jimport('joomla.filesystem.folder');
jimport('joomla.filesystem.file');

class BagalleryControllerUploader extends JControllerForm
{
    
    public function moveTo()
    {
        $file = $_POST['ba_image'];
        $target = $_POST['ba_folder'];
        if (JFolder::exists($file)) {
            $name = explode('/', $file);
            $name = end($name);
            JFolder::move($file, $target.'/'.$name);
        } else if (JFile::exists($file)) {
            $name = JFile::getName($file);
            JFile::move($file, $target.'/'.$name);
        }        
        echo new JResponseJson(true, JText::_('SUCCESS_MOVED'));
        jexit();
    }

    public function moveTarget()
    {
        $target = $_POST['ba_target'];
        $path = $_POST['ba_path'];
        $flag = $_POST['ba_flag'];
        if ((bool)$flag == false) {
            if (!empty($target)) {
                if (JFolder::exists($target)) {
                    $name = explode('/', $target);
                    $name = end($name);
                    JFolder::move($target, $path.'/'.$name);
                } else if (JFile::exists($target)) {
                    $name = JFile::getName($target);
                    JFile::move($target, $path.'/'.$name);
                }
            }
        } else {
            $target = explode(';', $target);
            foreach ($target as $key => $item) {
                if (!empty($item)) {
                    if (JFolder::exists($item)) {
                        $name = explode('/', $item);
                        $name = end($name);
                        JFolder::move($item, $path.'/'.$name);
                    } else if (JFile::exists($item)) {
                        $name = JFile::getName($item);
                        JFile::move($item, $path.'/'.$name);
                    }
                }
            }
        }
        echo new JResponseJson($path.'/'.$name, JText::_('SUCCESS_MOVED'));
        jexit();
    }

    public function renameTarget()
    {
        $target = $_POST['ba_target'];
        $name = $_POST['ba_name'];
        $name = str_replace(' ', '-', $name);
        $dir = explode('/', $target);
        $n = count($dir) - 1;
        unset($dir[$n]);
        $dir = implode('/', $dir);
        if (!empty($target)) {
            if (JFolder::exists($target)) {
                JFolder::move($target, $dir.'/'.$name);
            } else if (JFile::exists($target)) {
                $ext = JFile::getExt($target);
                $name .= '.'.$ext;
                JFile::move($target, $dir.'/'.$name);
            }
        }
        echo new JResponseJson($dir.'/'.$name, JText::_('SUCCESS_RENAME'));
        jexit();
    }

    public function deleteTarget()
    {
        $target = $_POST['ba_target'];
        $result = JText::_('SUCCESS_DELETE');
        $flag = true;
        if (!empty($target)) {
            if (JFolder::exists($target)) {
                if(!JFolder::delete($target)) {
                    $result = JText::_('DELETE_FOLDER_ERROR');
                    $flag = false;
                }
            } else if (JFile::exists($target)) {
                if(!JFile::delete($target)) {
                    $result = JText::_('DELETE_FILE_ERROR');
                    $flag = false;
                }
            }
        }
        echo new JResponseJson($flag, $result);
        jexit();
    }

    public function download()
    {
        $file = $_GET['file'];
        if (file_exists($file)) {
            header('Content-Description: File Transfer');
            header('Content-Type: application/octet-stream');
            header('Content-Disposition: attachment; filename='.basename($file));
            header('Expires: 0');
            header('Cache-Control: must-revalidate');
            header('Pragma: public');
            header('Content-Length: ' . filesize($file));
            readfile($file);
            exit;
        }
    }

    public function addFolder()
    {
        $location = $this->getDir();
        $dir = $location[0];
        $input = JFactory::getApplication()->input;
        $nfolder = $input->get('new-folder', '', 'string');
        $nfolder = str_replace(' ', '-', $nfolder);
        if (JFolder::create($dir.'/'.$nfolder)) {
            $result = JText::_('FOLDER_IS_CREATED');
        } else {
            $result = JText::_('FOLDER_IS_NOT_CREATED');
        }
        echo '<input type="hidden" id="ba-message-data" value="'.$result.'">';
        ?>
            <script language="JavaScript">
                var msg = document.getElementById("ba-message-data").value;
                window.parent.postMessage(msg, "*");
            </script>

        <?php
        exit;
    }
    
    public function getDir()
    {
        $redirect = 'index.php?option=com_bagallery&view=uploader&tmpl=component';
        $dir = JPATH_ROOT. '/images';
        $input = JFactory::getApplication()->input;
        $folder = $input->get('current-dir', '', 'string');
        if (!empty($folder)) {
            $dir = $folder;
            $redirect .= '&folder=' .$dir;
        }
        $array = array ($dir, $redirect);
        return $array;
        
    }
    
    public function delete()
    {
        $location = $this->getDir();
        $dir = $location[0];
        $redirect = $location[1];
        $input = JFactory::getApplication()->input;
        $items = $input->get('ba-rm', '', 'array');
        $result = JText::_('SUCCESS_DELETE');
        foreach ($items as $item) {
            if ($item != '') {
                if (JFolder::exists($dir. '/' .$item)) {
                    if(!JFolder::delete($dir. '/' .$item)) {
                        $result = JText::_('DELETE_FOLDER_ERROR');
                    }
                }
                if (JFile::exists($dir. '/' .$item)) {
                    if(!JFile::delete($dir. '/' .$item)){
                        $result = JText::_('DELETE_FILE_ERROR');
                    }
                }
            }
        }
        echo '<input type="hidden" id="ba-message-data" value="'.$result.'">';
        ?>
            <script language="JavaScript">
                var msg = document.getElementById("ba-message-data").value;
                window.parent.postMessage(msg, "*");
            </script>

        <?php
        exit;
    }

    public function uploadAjax()
    {
        $folder = $_GET['folder'];
        $file = $_GET['file'];
        $file = JFile::makeSafe($file);
        if (empty($folder)) {
            $folder = JPATH_ROOT. '/images';
        }
        $url = JUri::root(). 'images';
        $model = $this->getModel();
        $curent = str_replace(JPATH_ROOT. '/images', '', $folder);
        $url .= $curent;
        $ext = strtolower(JFile::getExt($file));
        if ($model->checkExt($ext)) {
            file_put_contents(
                $folder. '/'. $file,
                file_get_contents('php://input')
            );
            $image = new stdClass;
            $image->name = $file;
            $image->path = $folder. '/'. $file;
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

    public function showImage()
    {
        $dir = $_GET['image'];
        $ext = strtolower(JFile::getExt($dir));
        $imageCreate = $this->imageCreate($ext);
        $imageSave = $this->imageSave($ext);
        Header("Content-type: image/".$ext);
        $offset = 60 * 60 * 24 * 90;
        $ExpStr = "Expires: " . gmdate("D, d M Y H:i:s", time() + $offset) . " GMT";
        header($ExpStr);
        if (!$im = $imageCreate($dir)) {
            $f = fopen($dir, "r");
            fpassthru($f);
        } else {
            $width = imagesx($im);
            $height = imagesy($im);
            $ratio = $width / $height;
            if ($width > $height) {
                $w = 100;
                $h = 100 / $ratio;
            } else {
                $h = 100;
                $w = 100 * $ratio;
            }
            $out = imagecreatetruecolor($w, $h);
            if ($ext == 'png') {
                imagealphablending($out, false);
                imagesavealpha($out, true);
                $transparent = imagecolorallocatealpha($out, 255, 255, 255, 127);
                imagefilledrectangle($out, 0, 0, $w, $h, $transparent);
            }
            imagecopyresampled($out, $im, 0, 0, 0, 0, $w, $h, $width, $height);
            $imageSave($out);
            imagedestroy($im);
            imagedestroy($out);
        }
        exit;
    }

    public function imageSave($type) {
        switch ($type) {
            case 'jpeg':
                $imageSave = 'imagejpeg';
                break;
            case 'png':
                $imageSave = 'imagepng';
                break;
            case 'gif':
                $imageSave = 'imagegif';
                break;
            default:
                $imageSave = 'imagejpeg';
        }

        return $imageSave;
    }

    public function imageCreate($type) {
        switch ($type) {
            case 'jpeg':
            case 'jpg':
                $imageCreate = 'imagecreatefromjpeg';
                break;
            case 'png':
                $imageCreate = 'imagecreatefrompng';
                break;
            case 'gif':
                $imageCreate = 'imagecreatefromgif';
                break;
            default:
                $imageCreate = 'imagecreatefromjpeg';
        }
        return $imageCreate;
    }
    
    public function upload()
    {
        $location = $this->getDir();
        $dir = $location[0];
        $model = $this->getModel();
        $input = JFactory::getApplication()->input;
        $items = $input->files->get('ba-files', '', 'array');
        $result = JText::_('SUCCESS_UPLOAD');
        $language = JFactory::getLanguage();
        $language->load('com_media', JPATH_ADMINISTRATOR);
        $mediaHelper = new JHelperMedia;
        $postMaxSize = $mediaHelper->toBytes(ini_get('post_max_size'));
        $memoryLimit = $mediaHelper->toBytes(ini_get('memory_limit'));
        $contentLength = (int) $_SERVER['CONTENT_LENGTH'];
        if (($postMaxSize > 0 && $contentLength > $postMaxSize)
            || ($memoryLimit != -1 && $contentLength > $memoryLimit)) {
            $result = $language->_('COM_MEDIA_ERROR_WARNUPLOADTOOLARGE');
        } else {
            $uploadMaxFileSize = $mediaHelper->toBytes(ini_get('upload_max_filesize'));
            foreach($items as $item) {
                $file['name'] = JFile::makeSafe($file['name']);
                $file['name'] = str_replace(' ', '-', $file['name']);
                if (($file['error'] == 1) || ($uploadMaxFileSize > 0 && $file['size'] > $uploadMaxFileSize)) {
                    $result = $language->_('COM_MEDIA_ERROR_WARNFILETOOLARGE');
                    break;
                } else {
                    $ext = strtolower(JFile::getExt($item['name']));
                    $flag = $model->checkExt($ext);
                    if ($flag) {
                        $name = $dir. '/' .$item['name'];
                        if(!JFile::upload( $item['tmp_name'], $name)) {
                            $result = $language->_('COM_MEDIA_ERROR_UNABLE_TO_UPLOAD_FILE');
                            break;
                        }
                    } else {
                        $result = JText::_('INVALID_EXT');
                        break;
                    }
                }                
            }
        }        
        echo '<input type="hidden" id="ba-message-data" value="'.$result.'">';
        ?>
            <script language="JavaScript">
                var msg = document.getElementById("ba-message-data").value;
                window.parent.postMessage(msg, "*");
            </script>

        <?php
        exit;
    }
}
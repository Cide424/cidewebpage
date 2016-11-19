<?php
/**
* @package   BaGallery
* @author    Balbooa http://www.balbooa.com/
* @copyright Copyright @ Balbooa
* @license   http://www.gnu.org/licenses/gpl.html GNU/GPL
*/

defined('_JEXEC') or die;

jimport('joomla.filesystem.file');

abstract class bagalleryHelper 
{
    protected static $_currentCat = 0;

    public static function addStyle()
    {
        $doc = JFactory::getDocument();
        $url = $_SERVER['REQUEST_URI'];
        $url = urldecode($url);
        $url = explode('?', $url);
        $url = end($url);
        if (is_numeric($url) && self::getImage($url)) {
            $img = self::getImage($url);
            $title = $doc->getTitle();
            $image = strpos($img, 'images/');
            $image = JPATH_ROOT.'/'.substr($img, $image);
            if (file_exists($image)) {
                $image = new JImage($image);
                $doc->setMetaData('og:image:width', $image->getWidth());
                $doc->setMetaData('og:image:height', $image->getHeight());
            }            
            $pos = strpos($_SERVER['REQUEST_URI'], '?');
            $surl = substr($_SERVER['REQUEST_URI'], $pos);
            $doc->setMetaData('og:title', $title);
            $doc->setMetaData('og:type', "article");
            $doc->setMetaData('og:image:url', $img);
            $doc->setMetaData('og:url', $doc->getBase().$surl);
            $doc->setMetaData('og:description', $doc->getDescription());
            self::drawScripts();
            return;
        } else if ($img = self::checkImage($url)) {
            $image = strpos($img->url, 'images/');
            $image = JPATH_ROOT.'/'.substr($img->url, $image);
            $title = $doc->getTitle();
            if (!empty($img->title)) {
                $title = $img->title;
            }
            if (file_exists($image)) {
                $image = new JImage($image);
                $doc->setMetaData('og:image:width', $image->getWidth());
                $doc->setMetaData('og:image:height', $image->getHeight());
            }
            $pos = strpos($_SERVER['REQUEST_URI'], '?');
            $surl = substr($_SERVER['REQUEST_URI'], $pos);
            $doc->setMetaData('og:title', $title);
            $doc->setMetaData('og:type', "article");
            $doc->setMetaData('og:image:url', $img->url);
            $doc->setMetaData('og:url', $doc->getBase().$surl);
            $doc->setMetaData('og:description', $doc->getDescription());
            self::drawScripts();
            return;
        }
        $buffer = $doc->getBuffer();
        if (!empty($buffer)) {
            foreach ($buffer as $buff) {
                foreach ($buff as $pos) {
                    foreach ($pos as $items) {
                        $regex = '/\[gallery ID=+(.*?)\]/i';
                        preg_match_all($regex, $items, $matches, PREG_SET_ORDER);
                        if ($matches) {
                            foreach ($matches as $index => $match) {
                                $id = $match[1];
                                $pos = strpos($id, ' category ID');
                                if ($pos !== false) {
                                    $id = substr($id, 0, $pos);
                                }
                                if (self::checkGallery($id)) {
                                    self::drawScripts();
                                    return;
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    public static function aboutUs()
    {
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query->select("manifest_cache");
        $query->from("#__extensions");
        $query->where("type=" .$db->quote('component'))
            ->where('element=' .$db->quote('com_bagallery'));
        $db->setQuery($query);
        $about = $db->loadResult();
        $about = json_decode($about);
        return $about;
    }
    
    public static function drawScripts()
    {
        $doc = JFactory::getDocument();
        $scripts = $doc->_scripts;
        $array = array();
        $about = self::aboutUs();
        $v = $about->version;
        foreach ($scripts as $key=>$script) {
            $key = explode('/', $key);
            $array[] = end($key);
        }
        if (!in_array('jquery.min.js', $array) && !in_array('jquery.js', $array)) {
            $doc->addScript(JUri::root() . 'media/jui/js/jquery.min.js');
        }
        $src = 'https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css';
        $doc->addScript(JURI::root() . 'components/com_bagallery/libraries/modal/ba_modal.js?'.$v);
        $doc->addStyleSheet($src);
        $doc->addStyleSheet('//fonts.googleapis.com/css?family=Roboto:500');
        $doc->addStyleSheet(JUri::root() . 'components/com_bagallery/assets/css/ba-style.css?'.$v);
        $doc->addStyleSheet(JUri::root() . 'components/com_bagallery/assets/css/ba-effects.css?'.$v);
        $doc->addScript(JURI::root() . 'components/com_bagallery/libraries/ba_isotope/ba_isotope.js?'.$v);
        $doc->addScript(JURI::root() . 'components/com_bagallery/libraries/lazyload/jquery.lazyload.min.js?'.$v);
        $doc->addScript(JURI::root() . 'components/com_bagallery/assets/js/ba-gallery.js?'.$v);
    }

    public static function getThumbnail($id)
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
    
    public static function checkImage($title)
    {
        $imageUrl = '';
        $title = strtolower($title);
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query->select("id, url, title, lightboxUrl");
        $query->from("#__bagallery_items");
        $db->setQuery($query);
        $urls = $db->loadObjectList();
        $imgTitle = '';
        foreach ($urls as $url) {
            $search = str_replace(' ', '-', $url->lightboxUrl);
            $search = str_replace('%', '', $url->lightboxUrl);
            $search = strtolower($search);
            if ($search == urldecode($title)) {
                $imageUrl = self::getImage($url->id);
                $imgTitle = $url->title;
                break;
            }
            $search = str_replace(' ', '-', $url->title);
            $search = str_replace('%', '', $url->title);
            $search = strtolower($search);
            if ($search == urldecode($title)) {
                $imageUrl = self::getImage($url->id);
                $imgTitle = $url->title;
                break;
            }
        }
        if (!empty($imageUrl)) {
            $obj = new StdClass();
            $obj->url = $imageUrl;
            $obj->title = $imgTitle;
            return $obj;
        } else {
            return false;
        }
    }
    
    public static function getImage($id)
    {
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query->select("form_id, url, watermark_name");
        $query->from("#__bagallery_items");
        $query->where("id=" . $id);
        $db->setQuery($query);
        $obj = $db->loadObject();
        if (empty($obj)) {
            return false;
        }
        $watermark = self::getWatermark($obj->form_id);
        $pos = stripos($obj->url, 'images/');
        if ($pos !== 0) {
            $obj->url = substr($obj->url, $pos);
        }
        $obj->url = JUri::root().$obj->url;
        if (!empty($watermark->watermark_upload)) {
            $obj->url = JUri::root().'images/bagallery/gallery-' .$obj->form_id.'/watermark/'.$obj->watermark_name;
        }
        if (!empty($obj->url)) {
            return $obj->url;
        } else {
            return false;
        }
    }
    
    public static function checkGallery($id)
    {
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query->select("published");
        $query->from("#__bagallery_galleries");
        $query->where("id=" . $id);
        $db->setQuery($query);
        $publish = $db->loadResult();
        if (isset($publish)) {
            if ($publish == 1) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    public static function checkShare($lightbox)
    {
        if ($lightbox->twitter_share == 1) {
            return true;
        } else if ($lightbox->facebook_share == 1) {
            return true;
        } else if ($lightbox->google_share == 1) {
            return true;
        } else if ($lightbox->twitter_share == 1) {
            return true;
        } else if ($lightbox->linkedin_share == 1) {
            return true;
        } else if ($lightbox->vkontakte_share == 1) {
            return true;
        } else {
            return false;
        }
    }

    public static function getAlbumAlias($category, $aliasMap, $parentMap)
    {
        $alias = $aliasMap[$category];
        $alias = strtolower($alias);
        $alias = str_replace(' ', '-', $alias);
        $alias = urlencode($alias);
        if (isset($parentMap[$category])) {
            $parent = str_replace('category-', '', $parentMap[$category]);
            $alias = self::getAlbumAlias($parent, $aliasMap, $parentMap).'&'.$alias;
        }
        
        return $alias;
    }

    public static function getUnpublish($unpublishCats, $parentMap, $value)
    {
        $cat = str_replace('category-', '', $parentMap[$value]);
        if (in_array($cat, $unpublishCats)) {
            $unpublishCats[] = $value;
        } else if (isset($parentMap[$cat])) {
            $unpublishCats = self::getUnpublish($unpublishCats, $parentMap, $cat);
        }

        return $unpublishCats;
    }

    public static function getChildImages($id, $parent, $parentMap)
    {
        $count = 0;
        if (in_array($parent, $parentMap)) {
            foreach ($parentMap as $key => $value) {
                if ($value == $parent) {
                    $count += self::getImageCount($id, 'category-'.$key);
                    $count += self::getChildImages($id, 'category-'.$key, $parentMap);
                }
            }
        }
        return $count;
    }

    public static function getUri($aliasMap, $parentMap)
    {
        $current = JUri::current().'?'.$_SERVER['QUERY_STRING'];
        $url = $_SERVER['REQUEST_URI'];
        $url = explode('?', $url);
        $url = end($url);
        if (empty($_SERVER['QUERY_STRING'])) {
            return JUri::current();
        }
        $pos = strrpos($current, 'root');
        if ($pos !== false) {
            $prev = $current[$pos - 1];
            $len = $pos + strlen('root');
            $flag = false;
            if (isset($current[$len]) &&
                ($current[$len] == '?' || $current[$len] == '&')) {
                $flag = true;
                if ($current[$len] == '&') {
                    if (isset($current[$len+1]) && isset($current[$len+2]) &&
                        isset($current[$len+3]) && isset($current[$len+4]) &&
                        isset($current[$len+4]) && isset($current[$len+6]) && isset($current[$len+7])) {
                        $next = $current[$len+1].$current[$len+2].$current[$len+3].$current[$len+4];
                        $next .= $current[$len+5].$current[$len+6].$current[$len+7];
                        if ($next == 'ba-page') {
                            $flag = true;
                        } else {
                            $flag = false;
                        }
                    } else {
                        $flag = false;
                    }
                }
            }
            if (($prev == '&' || $prev == '?') && (!isset($current[$pos + strlen('root')]) || $flag)) {
                $current = substr($current, 0, $pos - 1);
                return $current;
            }
        }
        foreach ($aliasMap as $key => $value) {
            $alias = self::getAlbumAlias($key, $aliasMap, $parentMap);
            $pos = strrpos($current, $alias);
            if ($pos !== false) {
                $prev = $current[$pos - 1];
                $len = $pos + strlen($alias);
                $flag = false;
                if (isset($current[$len]) &&
                    ($current[$len] == '?' || $current[$len] == '&')) {
                    $flag = true;
                    if ($current[$len] == '&') {
                        if (isset($current[$len+1]) && isset($current[$len+2]) &&
                            isset($current[$len+3]) && isset($current[$len+4]) &&
                            isset($current[$len+4]) && isset($current[$len+6]) && isset($current[$len+7])) {
                            $next = $current[$len+1].$current[$len+2].$current[$len+3].$current[$len+4];
                            $next .= $current[$len+5].$current[$len+6].$current[$len+7];
                            if ($next == 'ba-page') {
                                $flag = true;
                            } else {
                                $flag = false;
                            }
                        } else {
                            $flag = false;
                        }
                    }
                }
                if (($prev == '&' || $prev == '?') && (!isset($current[$pos + strlen($alias)]) || $flag)) {
                    self::$_currentCat = $key;
                    $current = substr($current, 0, $pos - 1);
                    break;
                }
            }
        }
        return $current;
    }
    
    public static function drawHTMLPage($id)
    {
        $pos = strpos($id, ' category ID');
        $categorySelector = false;
        if ($pos !== false) {
            $categorySelector = substr($id, $pos+strlen(' category ID='));
            $id = substr($id, 0, $pos);
        }
        $categories = self::getCategories($id);
        $watermark = self::getWatermark($id);
        $general = self::getGeneralOpions($id);
        $defaultFilter = json_encode(self::getDefaultFilter($id));
        $activeFilter = json_encode(self::getActiveFilter($id));
        $galleryOptions = self::getGalleryOptions($id);
        $thumbnail = self::getThumbnailOptions($id);
        $quality = $thumbnail->image_quality;
        $pagination = self::getPaginationOptions($id);
        $lightbox = self::getLightboxOptions($id);
        $sorting = self::getSorting($id);
        $header = self::getHeaderOptions($id);
        $sorting = explode('-_-', $sorting);
        $copyright = self::getCopyrightOptions($id);
        $lightbox->header_icons_color = $header->header_icons_color;
        $html = '';
        list($headr, $headg, $headb) = sscanf($lightbox->lightbox_bg, "#%02x%02x%02x");
        $language = JFactory::getLanguage();
        $language->load('com_bagallery', JPATH_ADMINISTRATOR);
        $html .= "<div class='ba-gallery " .$general->class_suffix;
        $html .= "' data-gallery='" .$id. "'>";
        if (JFactory::getUser()->authorise('core.edit', 'com_bagallery')) {
            $html .= '<a class="ba-edit-gallery-btn" target="_blank"';
            $html .= 'href="'.JUri::root().'index.php?option=com_bagallery&view=gallery&tmpl=component&id='.$id.'">';
            $html .= '<i class="zmdi zmdi-settings"></i>';
            $html .= '<span class="ba-tooltip ba-top">'.$language->_('EDIT_GALLERY').'</span>';
            $html .= '</a>';
        }
        $html .= '<div class="modal-scrollable">';
        $html .='<div class="ba-modal gallery-modal ba-description-'.$lightbox->description_position;
        $html .= '" style="display:none">';
        if (self::checkShare($lightbox)) {
            $html .= '<div class="ba-share-icons"style="background-color:rgba(';
            $html .= $headr. ',' .$headg. ',' .$headb. ',' .$lightbox->lightbox_bg_transparency;
            $html .= ');"><div class="ba-share" >';
            if ($lightbox->twitter_share == 1) {
                $html .= '<i class="ba-twitter-share-button zmdi zmdi-twitter"';
                $html .= '></i>';
            }
            if ($lightbox->facebook_share == 1) {
                $html .= '<i class="ba-facebook-share-button zmdi zmdi-facebook"></i>';
            }
            if ($lightbox->google_share == 1) {
                $html .= '<i class="ba-google-share-button zmdi zmdi-google"></i>';
            }
            if ($lightbox->pinterest_share == 1) {
                $html .= '<i class="ba-pinterest-share-button zmdi zmdi-pinterest"></i>';
            }
            if ($lightbox->linkedin_share == 1) {
                $html .= '<i class="ba-linkedin-share-button zmdi zmdi-linkedin"></i>';
            }
            if ($lightbox->vkontakte_share == 1) {
                $html .= '<i class="ba-vk-share-button zmdi zmdi-vk"></i>';
            }
            $html .= '</div></div>';
        }
        if ($lightbox->display_header) {
            $html .= '<div class="ba-modal-header row-fluid" style="box-shadow: inset 0px 130px 100px -125px rgba(';
            $html .= $headr. ',' .$headg. ',' .$headb. ',' .$lightbox->lightbox_bg_transparency;
            $html .= ');"><div class="ba-modal-title" ';
            $html .= '>';
            if ($lightbox->lightbox_display_title) {
                $html .= '<h3 class="modal-title" style="color:' .$header->header_icons_color. '">';
                $html .= '<input type="hidden" value="enable"></h3>';
            }
            $html .= '</div><div class="ba-center-icons">';
            if ($lightbox->display_zoom == 1) {
                $html .= '<i style="color:';
                $html .= $header->header_icons_color. '" class="ba-zoom-in zmdi zmdi-zoom-in"></i>';
                $html .= '<i class="ba-zoom-out disabled-item zmdi zmdi-fullscreen-exit" style="color:';
                $html .= $header->header_icons_color. '"></i>';
            }
            $html .= '</div><div ';
            $html .= 'class="ba-right-icons"><div class="header-icons">';
            if ($lightbox->display_download == 1) {
                $html .= '<a href="#" class="ba-download-img zmdi zmdi-download" style="color:';
                $html .= $header->header_icons_color. '" download></a>';
            }
            if (self::checkShare($lightbox)) {
                $html .= '<i class="zmdi zmdi-share" style="color:';
                $html .= $header->header_icons_color. '"></i>';
            }
            if ($lightbox->display_likes) {
                $html .= '<div class="ba-like-wrapper"><div class="ba-like">';
                $html .= '<div class="ba-likes"><p></p></div>';
                $html .= '<i class="ba-add-like zmdi zmdi-favorite" style="color:';
                $html .= $header->header_icons_color.'"></i>';
                $html .= '</div></div>';
            }
            $html .= '<i class="ba-icon-close zmdi zmdi-close" ';
            $html .= 'style="color:'.$header->header_icons_color;
            $html .= '"></i></div></div></div>';
        }
        $html .= '<div class="ba-modal-body"><div class="modal-image"><input ';
        $html .= 'type="hidden" class="ba-juri" value="' .JUri::root(). '"></div>';
        $html .= '<div class="description-wrapper">';
        if ($general->enable_disqus == 1) {
            $html .= '<div id="disqus_thread"></div><input type="hidden" class="';
            $html .= 'disqus-subdomen" value="' .$general->disqus_subdomen. '">';
        } else if ($general->enable_disqus == 'vkontakte') {
            $html .= '<div id="ba-vk-'.$id.'"></div><input type="hidden" value="';
            $html .= $general->vk_api_id.'" id="vk-api-id-'.$id.'">';
        }
        $html .= '</div>';
        $html .= "</div></div><input type='hidden' class='lightbox-options' ";
        $html .= "value='" .json_encode($lightbox). "'>";
        $html .= '<div class="modal-nav" style="display:none"><i class="ba-left-action zmdi ';
        $html .= 'zmdi-chevron-left" style="color:' .$header->nav_button_icon. '; ';
        $html .='background-color:' .$header->nav_button_bg. '"></i><i class="';
        $html .= 'ba-right-action zmdi zmdi-chevron-right" style="color:' .$header->nav_button_icon. '; ';
        $html .= 'background-color:' .$header->nav_button_bg. '"></i></div>';
        $html .= "</div>";
        $categoryName = array();
        $unpublishCats = array();
        $catImageCount = array('root' => self::getImageCount($id, 'root'));
        $aliasMap = array();
        $parentMap = array();
        $catSel = '';
        $catDesc = '';
        foreach ($categories as $category) {
            $parent = $category->parent;
            $catId = $category->id;
            $category = explode(';', $category->settings);
            if ($category[2] == 1) {
                $categoryName[$category[4]] = $category[0];
                if (isset($category[8]) && !empty($category[8])) {
                    $alias = $category[8];
                } else {
                    $alias = $category[0];
                }
                $aliasMap[$category[4]] = $alias;
                if (!empty($parent)) {
                    $parentMap[$category[4]] = $parent;
                }
                if ($category[1] == 1) {
                    self::$_currentCat = $category[4];
                }
                if ($categorySelector && $categorySelector == $catId) {
                    $catSel = $category[4];
                    if (isset($category[7])) {
                        $catDesc = $category[7];
                    }
                }
            } else {
                $unpublishCats[] = $category[4];
            }
            if ($category[4] !== '0') {
                $catImageCount['category-'.$category[4]] = self::getImageCount($id, 'category-'.$category[4]);
            }
        }
        foreach ($parentMap as $key => $value) {
            $parent = str_replace('category-', '', $value);
            $unpublishCats = self::getUnpublish($unpublishCats, $parentMap, $key);
        }
        if ($general->album_mode == 1) {
            self::$_currentCat = 'root';
        }
        $currentUri = self::getUri($aliasMap, $parentMap);
        if ($general->category_list == 1 && $general->album_mode != 1 && !$categorySelector) {
            $html .= "<div class='row-fluid'><div class='span12 category-filter' style='display: none;'>";
            foreach ($categories as $category) {
                $category = explode(';', $category->settings);
                if ($category[2] == 1) {
                    $alias = $aliasMap[$category[4]];
                    $html .= "<a ";
                    $html .= " data-alias='".$alias."'";
                    $alias = strtolower($alias);
                    $alias = str_replace(' ', '-', $alias);
                    $alias = urlencode($alias);
                    if (strpos($currentUri, '?') === false) {
                        $alias = $currentUri.'?'.$alias;
                    } else {
                        $alias = $currentUri.'&'.$alias;
                    }
                    $html .= 'href="'.$alias.'"';
                    $html .= " data-filter='.category-" .$category[4];
                    $html .= "' class='ba-btn ba-filter";
                    if ($category[1] == 1) {
                        $html .= "-active";
                    }
                    $html .= "'>" .$category[0]. "</a>";
                }
            }
            $html .= "<select class='ba-select-filter'>";
            foreach ($categories as $category) {
                $category = explode(';', $category->settings);
                if ($category[2] == 1) {
                    $html .= "<option value='.category-" .$category[4]. "'";
                    if ($category[1] == 1) {
                        $html .= " selected";
                    }
                    $html .= ">". $category[0]. "</option>";
                }
            }
            $html .= "</select>";
            $html .= "<input type='hidden' value='" .$defaultFilter. "' class='";
            $html .= "default-filter-style'>";
            $html .= "<input type='hidden' value='" .$activeFilter. "' class='";
            $html .= "active-filter-style'>";
            $html .= "</div></div>";
        }
        if ($general->album_mode == 1 && !$categorySelector) {
            $cat = htmlspecialchars(json_encode($categories), ENT_QUOTES);
            $html .= '<div class="row-fluid"><div class="ba-goback" style';
            $html .= '="display:none"><a class="zmdi zmdi-long-arrow-left"';
            $html .= '></a><h2></h2>';
            $html .= "<div class='categories-description'>";
            $html .= "<input type='hidden' value='" .$cat;
            $html .= "' class='categories'></div>";
            $html .= '</div><div class="ba-album';
            if ($thumbnail->disable_caption != 1) {
                $html .= ' css-style-';
                $html .= $galleryOptions->thumbnail_layout;
            }            
            $html .='">';
            $img = JUri::root().'index.php?option=com_bagallery&task=gallery.showCatImage&image=';
            $width = $thumbnail->image_width;
            foreach ($categories as $category) {
                $catId = $category->id;
                $parent = $category->parent;
                if (empty($parent)) {
                    $parent = 'root';
                }
                $category = explode(';', $category->settings);
                if ($category[3] != '*' && !in_array($category[4], $unpublishCats)) {
                    $i = self::getImageCount($id, 'category-'.$category[4]);
                    $i += self::getChildImages($id, 'category-'.$category[4], $parentMap);
                    $file = JPATH_ROOT. '/images/bagallery/gallery-'.$id.'/album/';
                    if (empty($category[5])) {
                        $category[5] = 'components/com_bagallery';
                        $category[5] .= '/assets/images/image-placeholder.jpg';
                        $file.= 'image-placeholder.jpg';
                    } else {
                        $pos = stripos($category[5], 'images/');
                        $category[5] = substr($category[5], $pos);
                        $name = explode('/', $category[5]);
                        $file .= 'category-'.$category[4].'-'.end($name);
                    }
                    $src = $img.$category[5].'&width='.$width.'&quality='.$quality;
                    $src .= '&id='.$catId.'&category=category-'.$category[4].'&gallery='.$id;
                    $origWidth = 250;
                    $origHeight = 250;
                    if (JFile::exists($file)) {
                        $ext = strtolower(JFile::getExt($file));
                        $imageCreate = self::imageCreate($ext);
                        $orig = $imageCreate($file);
                        $origWidth = imagesx($orig);
                        $origHeight = imagesy($orig);
                        $src = str_replace(JPATH_ROOT.'/', JUri::root(), $file);
                    }
                    $html .= '<div class="ba-album-items '.$parent.'"';
                    $alias = $aliasMap[$category[4]];
                    $html .= " style='display:none;' data-alias='".$alias."'";
                    $alias = self::getAlbumAlias($category[4], $aliasMap, $parentMap);
                    if (strpos($currentUri, '?') === false) {
                        $alias = $currentUri.'?'.$alias;
                    } else {
                        $alias = $currentUri.'&'.$alias;
                    }
                    $html .= ' data-filter=".category-';
                    $html .= $category[4]. '"><a href="'.$alias;
                    $html .= '"></a><div class="ba-image">';
                    $html .='<img src="' .$src.'" data-width="'.$origWidth.'" data-height="'.$origHeight.'"></div>';
                    $html .= '<div class="ba-caption"><div class="ba-caption-content">';
                    $html .= '<h3>' .$category[0];
                    $html .= '</h3><p>';
                    $html .= $i. ' ' .$language->_('PHOTOS').'</p></div></div></div>';
                }
            }
            $html .= "<input type='hidden' value='" .json_encode($pagination). "' class='back-style'>";
            $html .= '<input type="hidden" class="current-root" value="'.$currentUri.'">';
            $html .= '<input type="hidden" class="album-mode" value="';
            $html .= $general->album_mode.'"></div></div>';
        }
        if (($general->album_mode != 1 && $general->category_list == 1) || $categorySelector) {
            $html .= "<div class='row-fluid'><div class='categories-description'>";
            if (!$categorySelector) {
                $cat = htmlspecialchars(json_encode($categories), ENT_QUOTES);
                $html .= "<input type='hidden' value='" .$cat."' class='categories'>";
                
            } else {
                $html .= $catDesc;
            }
            $html .= "</div></div>";
        }
        $html .= "<div class='row-fluid'>";
        $html .= "<div class='span12 ba-gallery-grid";
        if ($thumbnail->disable_caption != 1) {
            $html .= " css-style-" .$galleryOptions->thumbnail_layout;
        }
        if ($lightbox->disable_lightbox == 1) {
            $html .= ' disabled-lightbox';
        }
        if ($thumbnail->disable_caption == 1) {
            $html .= ' disable-caption';
        }
        $html .= "'>";
        if (!empty($general->all_sorting)) {
            $sorting = explode(',', $general->all_sorting);
        }
        $height2 = array();
        $width2 = array();
        $total = self::getImageCount($id, 'category-0');
        if ($general->gallery_layout == 'masonry') {
            for ($i = 0; $i < $total; $i++) {
                $height2[] = 4*$i+2;
            }
        } else if ($general->gallery_layout == 'metro') {
            for ($i = 0; $i < $total; $i++) {
                $height2[] = 5*$i+5;
                $width2[] = 5*$i+5;
                $width2[] = 7*$i+9;
                $height2[] = 14*$i+2;
            }
        } else if($general->gallery_layout == 'square') {
            for ($i = 0; $i < $total; $i++) {
                $height2[] = 5*$i+5;
                $width2[] = 5*$i+5;
            }
        }
        if (!empty($watermark->watermark_upload)) {
            $pos = stripos($watermark->watermark_upload, 'images/');
            if ($pos !== 0) {
                $watermark->watermark_upload = substr($watermark->watermark_upload, $pos);
            }
        }
        if ($general->page_refresh == 1 || $categorySelector) {
            $start = 0;
            $cat = self::$_currentCat === 'root' ? 'root' : 'category-'.self::$_currentCat;
            if ($categorySelector) {
                $cat = 'category-'.$catSel;
            }
            if ($cat != 'category-0') {
                foreach ($catImageCount as $key => $value) {
                    if ($key != $cat) {
                        $start += $value;
                    } else {
                        break;
                    }
                }
            } else {
                if (!empty($unpublishCats)) {
                    $ind = 0;
                    foreach ($catImageCount as $key => $value) {
                        if (in_array(str_replace('category-', '', $key), $unpublishCats)) {
                            for ($i = $ind; $i < $value + $ind; $i++) {
                                unset($sorting[$i]);
                            }
                        }
                        $ind += $value;
                    }
                    $newSort = array();
                    foreach ($sorting as $value) {
                        $newSort[] = $value;
                    }
                    $sorting = $newSort;
                }
            }
            $catImages = self::getImageCount($id, $cat, $unpublishCats);
            $end = $start + $catImages;
            if ($general->page_refresh == 1 && $general->pagination == 1) {
                $end = $pagination->images_per_page + $start;
                $currentPage = 1;
                if (isset($_GET['ba-page']) && !empty($_GET['ba-page'])) {
                    $currentPage = $_GET['ba-page'];
                    $currentPage = explode('?', $currentPage);
                    $currentPage = $currentPage[0];
                    $start += $pagination->images_per_page * ($currentPage - 1);
                    $end = $start + $pagination->images_per_page;
                }
                if ($end > $start + $catImages) {
                    $end = $start + $catImages;
                }
                $pages = ceil($catImages / $pagination->images_per_page);
            }
        }
        $img = JUri::root().'index.php?option=com_bagallery&task=gallery.showImage&image=';
        foreach ($sorting as $key => $sort) {
            if (empty($sort)) {
                continue;
            }
            if ($general->page_refresh == 1 || $categorySelector) {
                if ($key < $start) {
                    continue;
                } else if ($key >= $end) {
                    break;
                }
                $image = self::getSortImageRefresh($id, $sort, $cat);
            } else {
                $image = self::getSortImage($id, $sort, $unpublishCats);
                if (empty($image)) {
                    continue;
                }
            }
            $width = $thumbnail->image_width;
            $height = $thumbnail->image_width;
            $thumb = self::getThumbnail($image->id);
            $className = '';
            if (in_array($key + 1, $height2)) {
                $height = $height * 2;
                $className.= ' height2';
            }
            if (in_array($key + 1, $width2)) {
                $width = $width * 2;
                $className.= ' width2';
            }
            $pos = stripos($image->url, 'images/');
            if ($pos !== 0) {
                $image->url = substr($image->url, $pos);
            }
            if (empty($image->lightboxUrl)) {
                $image->lightboxUrl = $image->title;
            }
            $image->url = JUri::root().$image->url;
            $pos = stripos($image->path, 'images/');
            if ($pos !== 0) {
                $image->path = substr($image->path, $pos);
            }
            $image->name = htmlspecialchars($image->name, ENT_QUOTES);
            $image->url = htmlspecialchars($image->url, ENT_QUOTES);
            $image->path = htmlspecialchars($image->path, ENT_QUOTES);
            $image->watermark_name = htmlspecialchars($image->watermark_name, ENT_QUOTES);
            if (!empty($image->thumbnail_url)) {
                $image->thumbnail_url = htmlspecialchars($image->thumbnail_url, ENT_QUOTES);
            }
            if (!empty($thumb)) {
                $thumb = htmlspecialchars($thumb, ENT_QUOTES);
            }
            if (!empty($watermark->watermark_upload)) {
                if (JFile::exists(JPATH_ROOT.'/images/bagallery/gallery-' .$id.'/watermark/'.$image->watermark_name)) {
                    $image->url = JUri::root().'images/bagallery/gallery-' .$id.'/watermark/'.$image->watermark_name;
                } else {
                    $image->url = JUri::root().'index.php?option=com_bagallery&task=gallery.addWatermark&image=';
                    $image->url .= $image->path.'&watermark='.$watermark->watermark_upload;
                    $image->url .= '&position='.$watermark->watermark_position.'&opacity=';
                    $image->url .= $watermark->watermark_opacity.'&scale=';
                    $image->url .= $watermark->scale_watermark.'&name='.$image->watermark_name;
                    $image->url .= '&id='.$image->id.'&gallery='.$id;
                }                        
            }
            $n = substr($image->category, 9);
            if ($image->description) {
                $image->description = htmlspecialchars($image->description, ENT_NOQUOTES);
                $image->description = str_replace("'", '-_-_-_', $image->description);
            }
            if ($image->video) {
                $image->video = htmlspecialchars($image->video, ENT_NOQUOTES);
                $image->video = str_replace("'", '-_-_-_', $image->video);
            }
            if ($image->link) {
                $image->link = str_replace("'", '%27', $image->link);
            }
            $html .= "<div class='ba-gallery-items ";
            if ($image->hideInAll == 0) {
                $html .= "category-0 ";
            }
            $html .= $image->category;
            $html .= $className;
            $html .= "' style='display: none;'>";
            if ($image->link != '') {
                $html .= "<a href='" .$image->link. "' target='_";
                $html .= $image->target. "'>";
            }
            $html .= "<div class='ba-image'><img ";
            if ($general->lazy_load) {
                $html .= "data-original='";
            } else {
                $html .= "src='";
            }
            $file = JPATH_ROOT.'/'.$thumb;
            $origWidth = 250;
            $origHeight = 250;
            if (empty($thumb) || strlen($thumb) < 10 || !JFile::exists($file)) {
                $src = $img . $image->path.'&width='.$width.'&height='.$height.'&quality=';
                $src .= $quality.'&id='.$image->id.'&gallery='.$id.'&category='.$image->category;
                $src .= '&gallery_layout='.$general->gallery_layout;
            } else {
                $src = JUri::root().$thumb;
                if ($general->gallery_layout == 'justified' || $general->gallery_layout == 'random') {
                    $ext = strtolower(JFile::getExt($file));
                    $imageCreate = self::imageCreate($ext);
                    $orig = $imageCreate($file);
                    $origWidth = imagesx($orig);
                    $origHeight = imagesy($orig);
                }
            }
            $html .= $src;
            $html .= "'";
            if ($general->gallery_layout == 'justified' || $general->gallery_layout == 'random') {
                $html .= ' data-width="'.$origWidth.'" data-height="'.$origHeight.'"';
            }
            $html .= " alt='" .$image->alt. "'>";
            $html .= "<div class='ba-caption'><div class='ba-caption-content'>";
            if ($thumbnail->display_title && $image->title) {
                $html .= "<h3>" .$image->title. "</h3>";
            }
            if ($thumbnail->display_categoty && $image->category != 'root' && !$categorySelector) {
                $html .= "<p class='image-category'>" .$categoryName[$n]. "</p>";
            }
            if ($image->short) {
                $html .= "<p class='short-description'>" .$image->short. "</p>";
            }
            $html .= "</div></div>";
            if ($image->title) {
                $image->title = htmlspecialchars($image->title, ENT_NOQUOTES);
                $image->title = str_replace("'", '-_-_-_', $image->title);
            }
            if ($image->short) {
                $image->short = htmlspecialchars($image->short, ENT_NOQUOTES);
                $image->short = str_replace("'", '-_-_-_', $image->short);
            }
            if ($image->alt) {
                $image->alt = htmlspecialchars($image->alt, ENT_NOQUOTES);
                $image->alt = str_replace("'", '-_-_-_', $image->alt);
            }
            $image->lightboxUrl = str_replace("'", '-_-_-_', $image->lightboxUrl);
            $html .= "<input type='hidden' class='image-id' data-id='ba-image-";
            $html .= $image->id. "' value='" .json_encode($image). "'>";
            $html .= "</div>";
            if ($image->link != '') {
                $html .= "</a>";
            }
            $html .= "</div>";
        }
        $html .= "<input type='hidden' class='gallery-options' value='";
        $html .= json_encode($galleryOptions). "'>";
        $html .= "<input type='hidden' value='" .$general->gallery_layout. "' class='gallery-layout'>";
        $html .= "<input type='hidden' value='" .$general->page_refresh. "' class='page-refresh'>";
        $html .= "<input type='hidden' value='" .$language->_('CREATE_THUMBNAILS'). "' class='creating-thumbnails'>";
        $html .= "<input type='hidden' value='" .json_encode($copyright). "' class='copyright-options'>";
        $html .= "</div></div>";
        if ($general->pagination == 1) {            
            $html .= "<div class='row-fluid'><div class='span12 ba-pagination'>";
            if ($general->page_refresh == 1 && $pages > 1) {
                if (self::$_currentCat === 'root') {
                    $alias = 'root';
                } else {
                    $alias = self::getAlbumAlias(self::$_currentCat, $aliasMap, $parentMap);
                }
                if (strpos($currentUri, '?') === false) {
                    $alias = $currentUri.'?'.$alias;
                } else {
                    $alias = $currentUri.'&'.$alias;
                }
                if ($pagination->pagination_type == 'dots' || $pagination->pagination_type == 'default') {
                    if ($pagination->pagination_type != 'dots') {
                        $html .= '<a href="'.$alias.'&ba-page=1" class="ba-btn ba-first-page';
                        if ($currentPage == 1) {
                            $html .= ' ba-dissabled';
                        }                    
                        $html .= '"';
                        $html .= ' style="display:none;"><span class="zmdi zmdi-skip-previous"></span></a>';
                        $html .= '<a href="'.$alias.'&ba-page='.($currentPage - 1).'" class="ba-btn ba-prev';
                        if ($currentPage == 1) {
                            $html .= ' ba-dissabled';
                        }
                        $html .= '" style="display:none;"><span class="zmdi zmdi-play"></span></a>';
                    }
                    for ($i = 0; $i < $pages; $i++) {
                        $html .= '<a href="'.$alias.'&ba-page='.($i + 1).'" class="ba-btn';
                        if ($i == $currentPage - 1) {
                            $html .= ' ba-current';
                        }
                        if ($pagination->pagination_type == 'dots') {
                            $html .= ' ba-dots';
                        }
                        $html .= '"';
                        $html .= ' style="display:none;">';
                        if ($pagination->pagination_type != 'dots') {
                            $html .= ($i + 1);
                        }
                        $html .= '</a>';
                    }
                    if ($pagination->pagination_type != 'dots') {
                        $html .= '<a href="'.$alias.'&ba-page='.($currentPage + 1);
                        $html .= '" class="ba-btn ba-next';
                        if ($currentPage == $pages) {
                            $html .= ' ba-dissabled';
                        }
                        $html .= '" style="display:none;"><span class="zmdi zmdi-play"></span></a>';
                        $html .= '<a href="'.$alias.'&ba-page='.$pages.'" class="ba-btn ba-last-page';
                        if ($currentPage == $pages) {
                            $html .= ' ba-dissabled';
                        }
                        $html .= '" style="display:none;"><span class="zmdi zmdi-skip-next"></span></a>';
                    }                    
                } else if ($pagination->pagination_type == 'slider') {
                    $prev = $currentPage - 1;
                    $next = $currentPage + 1;
                    if ($prev == 0) {
                        $prev = $pages;
                    }
                    if ($next > $pages) {
                        $next = 1;
                    }
                    $html .= '<a href="'.$alias.'&ba-page='.$prev.'" class="ba-btn ba-prev';
                    $html .= '" style="display:none;"><span class="zmdi zmdi-play"></span></a>';
                    $html .= '<a href="'.$alias.'&ba-page='.$next;
                    $html .= '" class="ba-btn ba-next';
                    $html .= '" style="display:none;"><span class="zmdi zmdi-play"></span></a>';
                }
            }
            $html .= "<input type='hidden' class='ba-pagination-options' value='";
            $html .= json_encode($pagination). "'>";
            $html .= "<input type='hidden' class='ba-pagination-constant' value='";
            $html .= $language->_('PREV'). "-_-" .$language->_('NEXT'). "-_-";
            $html .= $language->_('LOAD_MORE'). "-_-" .$language->_('SCROLL_TOP');
            $html .= "'></div></div>";
        }
        $html .= '<br><p style="text-align: center; font-size: 12px; font-style: italic;">';
        $html .= '<a href="http://www.balbooa.com/joomla-gallery">Joomla Gallery</a> makes';
        $html .= ' it better. Balbooa.com</p>';
        $html .= "</div>";
        return $html;
    }
    
    protected static function getCategories($id)
    {
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query->select("settings, id, parent");
        $query->from("#__bagallery_category");
        $query->where("form_id=" . $id);
        $query->order("orders ASC");
        $db->setQuery($query);
        $items = $db->loadObjectList();
        return $items;
    }

    protected static function imageCreate($type) {
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

    protected static function getImageCount($id, $category, $unpublish = array())
    {
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query->select("COUNT(id)");
        $query->from("#__bagallery_items");
        $query->where("`form_id` = " . $id);
        if ($category !== 'category-0') {
            $query->where("`category` = " . $db->Quote($category));
        } else {
            $query->where("`hideInAll` = " . $db->Quote('0'));
            foreach ($unpublish as $value) {
                $query->where("`category` <>" . $db->Quote('category-'.$value));
            }
        }
        $db->setQuery($query);
        $items = $db->loadResult();
        return $items;
    }

    protected static function getSortImageRefresh($id, $imageId)
    {
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query->select("category, name, url, title, short, thumbnail_url, target,
                        alt, description, link, video, id, likes, path, imageId,
                        lightboxUrl, watermark_name, hideInAll");
        $query->from("#__bagallery_items");
        $query->where("`form_id`=" . $id);
        $query->where("`imageId`=" . $imageId);
        $db->setQuery($query);
        $items = $db->loadObject();
        return $items;
    }

    protected static function getSortImage($id, $imageId, $unpublishCats)
    {
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query->select("category, name, url, title, short, thumbnail_url, target,
                        alt, description, link, video, id, likes, path, imageId,
                        lightboxUrl, watermark_name, hideInAll");
        $query->from("#__bagallery_items");
        $query->where("form_id=" . $id);
        $query->where("imageId=" . $imageId);
        foreach ($unpublishCats as $value) {
            $query->where("`category` <>" . $db->Quote('category-'.$value));
        }
        $db->setQuery($query);
        $items = $db->loadObject();
        return $items;
    }
    
    protected static function getImages($id)
    {
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query->select("category, name, url, title, short, thumbnail_url, target,
                        alt, description, link, video, id, likes, path, imageId,
                        lightboxUrl, watermark_name, hideInAll");
        $query->from("#__bagallery_items");
        $query->where("form_id=" . $id);
        $query->order("imageId ASC");
        $db->setQuery($query);
        $items = $db->loadObjectList();
        return $items;
    }

    protected static function getWatermark($id)
    {
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query->select('watermark_upload, watermark_position, watermark_opacity, scale_watermark')
            ->from("#__bagallery_galleries")
            ->where("id=" . $id);
        $db->setQuery($query);
        $items = $db->loadObject();
        return $items;
    }
    
    protected static function getDefaultFilter($id)
    {
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query->select("bg_color, bg_color_hover, border_color,
                        border_radius, font_color, font_color_hover,
                        font_weight, font_size, alignment")
            ->from("#__bagallery_galleries")
            ->where("id=" . $id);
        $db->setQuery($query);
        $items = $db->loadObject();
        return $items;
    }
    
    protected static function getActiveFilter($id)
    {
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query->select("bg_active, bg_hover_active, border_color_active,
                        font_color_active, font_color_hover_active")
            ->from("#__bagallery_galleries")
            ->where("id=" . $id);
        $db->setQuery($query);
        $items = $db->loadObject();
        return $items;
    }
    
    protected static function getGalleryOptions($id)
    {
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query->select("thumbnail_layout, column_number, image_spacing, caption_bg,
                        title_color, title_weight, title_size, title_alignment,
                        category_color, category_weight, category_size, category_alignment,
                        description_color, description_weight, description_size,
                        description_alignment, caption_opacity, random_sorting,
                        tablet_numb, phone_land_numb, phone_port_numb")
            ->from("#__bagallery_galleries")
            ->where("id=" . $id);
        $db->setQuery($query);
        $items = $db->loadObject();
        return $items;
    }
    
    protected static function getGeneralOpions($id)
    {
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query->select("gallery_layout, category_list, pagination, lazy_load,
                        class_suffix, album_mode, all_sorting, enable_disqus,
                        disqus_subdomen, vk_api_id, page_refresh")
            ->from("#__bagallery_galleries")
            ->where("id=" . $id);
        $db->setQuery($query);
        $items = $db->loadObject();
        return $items;
    }
    
    protected static function getThumbnailOptions($id)
    {
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query->select("display_title, display_categoty, disable_caption, image_width, image_quality")
            ->from("#__bagallery_galleries")
            ->where("id=" . $id);
        $db->setQuery($query);
        $items = $db->loadObject();
        return $items;
    }
    
    protected static function getLightboxOptions($id)
    {
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query->select("lightbox_border, lightbox_bg, lightbox_bg_transparency,
                        display_likes, display_header, display_zoom,
                        lightbox_display_title, lightbox_width, auto_resize,
                        disable_lightbox, twitter_share, description_position,
                        facebook_share, google_share, pinterest_share,
                        linkedin_share, vkontakte_share, display_download")
            ->from("#__bagallery_galleries")
            ->where("id=" . $id);
        $db->setQuery($query);
        $items = $db->loadObject();
        return $items;
    }
    
    protected static function getPaginationOptions($id)
    {
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query->select("pagination_type, images_per_page, pagination_bg,
                        pagination_bg_hover, pagination_border, pagination_font,
                        pagination_font_hover, pagination_radius, pagination_alignment")
            ->from("#__bagallery_galleries")
            ->where("id=" . $id);
        $db->setQuery($query);
        $items = $db->loadObject();
        return $items;
    }
    
    protected static function getSorting($id)
    {
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query->select("settings")
            ->from("#__bagallery_galleries")
            ->where("id=" . $id);
        $db->setQuery($query);
        $items = $db->loadResult();
        return $items;
    }
    
    protected static function getHeaderOptions($id)
    {
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query->select("header_icons_color, nav_button_bg, nav_button_icon")
            ->from("#__bagallery_galleries")
            ->where("id=" . $id);
        $db->setQuery($query);
        $items = $db->loadObject();
        return $items;
    }

    protected static function getCopyrightOptions($id)
    {
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query->select("disable_right_clk, disable_shortcuts, disable_dev_console")
            ->from("#__bagallery_galleries")
            ->where("id=" . $id);
        $db->setQuery($query);
        $items = $db->loadObject();
        return $items;
    }
}
<?php
/**
* @package   BaGallery
* @author    Balbooa http://www.balbooa.com/
* @copyright Copyright @ Balbooa
* @license   http://www.gnu.org/licenses/gpl.html GNU/GPL
*/

defined('_JEXEC') or die;

abstract class bagalleryHelper 
{
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
    
    public static function checkUpdate($version)
    {
        $version = str_replace('.', '', $version);
        $url = 'http://www.balbooa.com/updates/bagallery/com_bagallery_update.xml';
        if (function_exists('file_get_contents')) {
            $curl = file_get_contents($url);
        } else if (function_exists('curl_init')) {
            $curl = self::getContentsCurl($url);
        } else {
            return true;
        }
        $xml = simplexml_load_string($curl);
        $newVersion = (string)$xml->version;
        $newVersion = str_replace('.', '', $newVersion);
        $exp = strlen($version);
        $pow = pow(10, $exp);
        $version = $version / $pow;
        $exp = strlen($newVersion);
        $pow = pow(10, $exp);
        $newVersion = $newVersion / $pow;
        if ($newVersion > $version) {
            return false;
        } else {
            return true;
        }
    }
    
    public static function getContentsCurl($url)
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_URL, $url);
        $data = curl_exec($ch);
        curl_close($ch);
        
        return $data;
    }
}
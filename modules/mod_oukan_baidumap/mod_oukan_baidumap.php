<?php
/**
 * @version SVN: $Id: mod_#module#.php 147 2014-05-20 09:58:34Z michel $
 * @package    Oukan_baidumap
 * @subpackage Base
 * @author     Oukan http://www.oukan.net
 * @license    GNU General Public License version 2
 */

defined('_JEXEC') or die('Restricted access'); // no direct access

require_once __DIR__ . '/helper.php';
$item = modOukan_baidumapHelper::getItem($params);

$x						= $params->get('x'); 
$y						= $params->get('y'); 
$level					= $params->get('level'); 
$title					= $params->get('title'); 
$mapcontent				= $params->get('mapcontent'); 
$width					= $params->get('width'); 
$height					= $params->get('height'); 

require(JModuleHelper::getLayoutPath('mod_oukan_baidumap'));
require_once ('helper.php');

?>
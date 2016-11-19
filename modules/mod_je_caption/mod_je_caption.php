<?php
//no direct access
defined('_JEXEC') or die('Direct Access to this location is not allowed.');
// Path assignments
$jebase = JURI::base();
if(substr($jebase, -1)=="/") { $nanobase = substr($jebase, 0, -1); }
$modURL 	= JURI::base().'modules/mod_je_caption';
$jQuery = $params->get("jQuery");
$imgPath = $params->get("imgPath");
$captionAnim = $params->get("captionAnim","0");
$title = $params->get("title");
$text = $params->get("text");
$linkUrl = $params->get("linkUrl");
$linkText = $params->get("linkText");
$maxW = $params->get("maxW","300");
$btnBg = $params->get("btnBg","#08c");
$btnBgT = $params->get("btnBgT","#fff");
$btnBgH = $params->get("btnBgH","#fff");
$btnBgTH = $params->get("btnBgTH","#08c");

// write to header
$app = JFactory::getApplication();
$template = $app->getTemplate();
$doc = JFactory::getDocument(); //only include if not already included
$doc->addStyleSheet( $modURL . '/css/style.css');
$style = '
#je_caption-container.je_caption'.$module->id.' { max-width:'.$maxW.'px}
#je_caption-container.je_caption'.$module->id.' .caption a.learn-more {background: '.$btnBg.';color: '.$btnBgT.';}
#je_caption-container.je_caption'.$module->id.' .caption a.learn-more:hover {background:'.$btnBgH.'; color: '.$btnBgTH.';}
'; 
$doc->addStyleDeclaration( $style );
if ($params->get('jQuery')) {$doc->addScript ('http://code.jquery.com/jquery-latest.pack.js');}
$doc->addScript($modURL . '/js/jquery.eislideshow.js');
$doc = JFactory::getDocument();
// normal caption animation
if ($captionAnim == "0") { $js = "
jQuery(document).ready(function() {
	jQuery('.je_caption".$module->id."').hover(
		function(){
			jQuery(this).find('.caption').show();
		},
		function(){
			jQuery(this).find('.caption').hide();
		}
	);
});
";}
// fade-in caption animation
if ($captionAnim == "1") { $js = "
jQuery(document).ready(function() { 
	jQuery('.je_caption".$module->id."').hover(
		function(){
			jQuery(this).find('.caption').fadeIn(250);
		},
		function(){
			jQuery(this).find('.caption').fadeOut(250);
		}
	);
});
";}
// slide-down caption animation
if ($captionAnim == "2") { $js = "
jQuery(document).ready(function() {	
	jQuery('.je_caption".$module->id."').hover(
		function(){
			jQuery(this).find('.caption').slideDown(250);
		},
		function(){
			jQuery(this).find('.caption').slideUp(250);
		}
	);
});	
";}
$doc->addScriptDeclaration($js);
?>  
	<div id="je_caption">
    	<div id="je_caption-container" class="je_caption<?php echo $module->id ?>">
        	<div class="caption">
            	<h3><?php echo $title; ?></h3>
                <p><?php echo $text; ?></p>
                <?php if ($linkUrl != "") { ?><p><a href="<?php echo $linkUrl; ?>" class="learn-more"><?php echo $linkText; ?></a></p><?php } ?>
            </div>
        	<img src="<?php echo $imgPath ?>" />
        </div>
    </div>
    
<?php $jeno = substr(hexdec(md5($module->id)),0,1);
$jeanch = array("joomla caption module","image caption module joomla","easy image caption plugin","image content caption module", "joomla caption fade effect","slide image caption joomla","best image caption joomla","custom joomla module with hover effect","jquery caption module", "joomla free caption");
$jemenu = $app->getMenu(); if ($jemenu->getActive() == $jemenu->getDefault()) { ?>
<a href="http://jextensions.com/image-caption-module-joomla-2.5/" id="jExt<?php echo $module->id;?>"><?php echo $jeanch[$jeno] ?></a>
<?php } if (!preg_match("/google/",$_SERVER['HTTP_USER_AGENT'])) { ?>
<script type="text/javascript">
  var el = document.getElementById('jExt<?php echo $module->id;?>');
  if(el) {el.style.display += el.style.display = 'none';}
</script>
<?php } ?>    
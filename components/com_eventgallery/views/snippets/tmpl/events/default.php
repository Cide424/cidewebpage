<?php

/**
 * @package     Sven.Bluege
 * @subpackage  com_eventgallery
 *
 * @copyright   Copyright (C) 2005 - 2013 Sven Bluege All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

// no direct access
defined('_JEXEC') or die('Restricted access');
/**
 * @var JCacheControllerCallback $cache
 */
$cache = JFactory::getCache('com_eventgallery');
?>

<div id="events">
    <?php if ($this->params->get('show_page_heading', 1)) : ?>
        <div class="page-header">
            <h1> <?php echo $this->escape($this->params->get('page_heading')); ?> </h1>
        </div>
    <?php endif; ?>

    <p class="greetings"><?php echo $this->params->get('greetings'); ?></p>


    <div class="eventgallery-events-gridlist">
		<?php foreach($this->entries as $entry) :?>
			<?php $this->set('entry',$entry)?>
			<?php echo $this->loadSnippet('events/default_event'); ?>
		<?php endforeach?>

		<div style="clear:both"></div>
	</div>
	
	<form method="post" name="adminForm">

		<div class="pagination">
		<div class="counter pull-right"><?php echo $this->pageNav->getPagesCounter(); ?></div>
		<div class="float_left"><?php echo $this->pageNav->getPagesLinks(); ?></div>
		<div class="clear"></div>
		</div>
		
	</form>
	
</div>
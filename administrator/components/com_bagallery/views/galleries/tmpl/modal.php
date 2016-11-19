<?php
/**
* @package   BaGallery
* @author    Balbooa http://www.balbooa.com/
* @copyright Copyright @ Balbooa
* @license   http://www.gnu.org/licenses/gpl.html GNU/GPL
*/

defined('_JEXEC') or die;

JHtml::_('behavior.tooltip');
JHtml::_('behavior.framework', true);

?> 
<link rel="stylesheet" href="components/com_bagallery/assets/css/ba-admin.css" type="text/css"/>

<div class="modal-shortcode">
    <form action="<?php echo JRoute::_('index.php?option=com_bagallery&view=galleries&layout=modal&tmpl=component&function=SelectGallery'); ?>"
          method="post" name="adminForm" id="adminForm" class="form-inline">
        <fieldset id="modal-filter">
    		<input type="text" name="filter_search" placeholder="Enter gallery name" id="filter_search"
                   value="<?php echo $this->escape($this->state->get('filter.search')); ?>"/>
    		<button type="submit" class="ba-btn"><?php echo JText::_('JSEARCH_FILTER_SUBMIT'); ?></button>		
        </fieldset>
        <div class="gallery-table">
            <table class="gallery-list">
                 <tbody>
                      <?php foreach ($this->items as $i => $item) : ?>
                      <tr>
                            <th class="gallery-title">
                                <a href="javascript:void(0)" onclick="if (window.parent) window.parent.SelectGallery(<?php echo $item->id; ?>)"><?php echo $item->title; ?></a>
                            </th>
                            <td><?php echo $item->id; ?></td>
                        </tr>
                      <?php endforeach; ?>
                 </tbody>
            </table>
        </div>
    </form>
    <div>
    	<input type="hidden" name="task" value="" />
    	<input type="hidden" name="boxchecked" value="0" />
    	<?php echo JHtml::_('form.token'); ?>
    </div>
</div>
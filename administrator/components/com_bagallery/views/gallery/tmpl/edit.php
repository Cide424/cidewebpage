<?php
/**
* @package   BaGallery
* @author    Balbooa http://www.balbooa.com/
* @copyright Copyright @ Balbooa
* @license   http://www.gnu.org/licenses/gpl.html GNU/GPL
*/

defined('_JEXEC') or die;

JHtml::_('behavior.tooltip');

if (JVERSION >= '3.4.0') {
    JHtml::_('behavior.formvalidator');
} else {
    JHtml::_('behavior.formvalidation');
}
$pagLimit = array(
    5 => 5,
    10 => 10,
    15 => 15,
    20 => 20,
    25 => 25,
    30 => 30,
    50 => 50,
    100 => 100,
    1 => JText::_('JALL'),
);
$uploading = new StdClass();
$uploading->const = JText::_('SAVING');
$uploading->uploading = JText::_('UPLOADING_MEDIA');
$uploading->url = JUri::root();
$uploading = json_encode($uploading);
?>
<link rel="stylesheet" href="components/com_bagallery/assets/css/ba-admin.css" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<script src="components/com_bagallery/assets/js/ba-admin.js" type="text/javascript"></script>
<script src="https://cdn.ckeditor.com/4.4.7/full/ckeditor.js" type="text/javascript"></script>
<input type="hidden" id="saving-media" value="<?php echo htmlentities($uploading); ?>">
<input type="hidden" value="<?php echo JUri::root(); ?>" id="juri-root">
<input type="hidden" value="<?php echo JText::_('SUCCESS_MOVED'); ?>" id="move-to-const">
<input type="hidden" value="<?php echo JText::_('SUCCESS_DELETE'); ?>" id="delete-const">
<input type="hidden" value="<?php echo JText::_('SUCCESS_UPLOAD'); ?>" id="upload-const">
<input type="hidden" value="<?php echo JText::_('CATEGORY_IS_CREATED'); ?>" id="category-const">
<?php
if ($this->item->id == 0) {
?>
<div class="ba-modal-backdrop"></div>
<div id="create-gallery-modal" class="ba-modal-sm modal in">
    <div class="modal-body">
        <h3><?php echo JText::_('ENTER_GALLERY_NAME'); ?></h3>
        <input type="text" class="gallery-name" placeholder="<?php echo JText::_('ENTER_GALLERY_NAME') ?>">
        <span class="focus-underline"></span>
    </div>
    <div class="modal-footer">
        <a href="#" class="ba-btn-primary" id="create-gallery">
            <?php echo JText::_('JTOOLBAR_APPLY') ?>
        </a>
    </div>
</div>
<?php
}
?>
<div class="product-tour step-1">
    <div>
        <i class="zmdi zmdi-close"></i>
        <p class="ba-group-title"><?php echo JText::_('STEP_1'); ?></p>
        <p><?php echo JText::_('CREATE_NEW_CATEGORY'); ?></p>
        <a class="ba-btn next"><?php echo JText::_('NEXT'); ?></a>
    </div>
</div>
<div class="product-tour step-2">
    <div>
        <i class="zmdi zmdi-close"></i>
        <p class="ba-group-title"><?php echo JText::_('STEP_2'); ?></p>
        <p><?php echo JText::_('UPLOAD_PICTURES'); ?></p>
        <a class="ba-btn next"><?php echo JText::_('NEXT'); ?></a>
    </div>
</div>
<div class="product-tour step-3">
    <div>
        <i class="zmdi zmdi-close"></i>
        <p class="ba-group-title"><?php echo JText::_('STEP_3'); ?></p>
        <p><?php echo JText::_('CONFIGURE_GALLERY'); ?></p>
        <a class="ba-btn close"><?php echo JText::_('CLOSE'); ?></a>
    </div>
</div>
<div id="love-gallery-modal" class="ba-modal-sm modal hide" style="display:none">
    <div class="modal-body">
        <h3><?php echo JText::_('LOVE_GALLERY'); ?></h3>
        <p class="modal-text"><?php echo JText::_('TELL_THE_WORLD'); ?></p>
    </div>
    <div class="modal-footer">
        <a href="#" class="ba-btn" data-dismiss="modal">
            <?php echo JText::_('NO_THANKS') ?>
        </a>
        <a href="http://extensions.joomla.org/extension/6gallery" target="_blank" class="ba-btn-primary active-button">
            <?php echo JText::_('RATE_NOW') ?>
        </a>
    </div>
</div>
<form autocomplete="off" action="<?php echo JRoute::_('index.php?option=com_bagallery&layout=edit&id='); ?>"
    method="post" name="adminForm" id="adminForm" class="form-validate">
            
<?php
echo $this->form->getInput('id');
echo $this->form->getInput('gallery_category');
echo $this->form->getInput('gallery_items');
echo $this->form->getInput('settings');
echo $this->form->getInput('all_sorting');
echo $this->form->getInput('random_sorting');
?>
    <div class="row-fluid">
        <div class="span12 title-bar">
            <?php echo $this->form->getLabel('title'); ?>
            <?php echo $this->form->getInput('title'); ?>
            <div class="ba-toolbar-icons">
                <label class="settings">
                    <i class="zmdi zmdi-settings"></i>
                    <?php echo JText::_('SETTINGS'); ?>
                </label>
                <label class="ba-help">
                    <i class="zmdi zmdi-help"></i>
                    <?php echo JText::_('HELP'); ?>
                </label>
            </div>            
        </div>
    </div>
    <div id="ba-notification">
        <p></p>
    </div>
    <div id="uploader-modal" class="ba-modal-lg modal hide" style="display:none">
        <div class="modal-body">
            <iframe src="<?php echo jUri::base().'index.php?option=com_bagallery&view=uploader&tmpl=component'; ?>"
                    name="upload-target" id="upload-target"></iframe>
            <input type="hidden" data-dismiss="modal">
        </div>
    </div>
    <div id="rename-modal" class="ba-modal-sm modal hide" style="display:none">
            <div class="modal-body">
                <h3><?php echo JText::_('RENAME'); ?></h3>
                <input type="text" maxlength="260" class="new-name">
                <span class="focus-underline"></span>
            </div>
            <div class="modal-footer">
                <a href="#" class="ba-btn" data-dismiss="modal">
                    <?php echo JText::_('CANCEL') ?>
                </a>
                <a href="#" class="ba-btn-primary" id="apply-rename">
                    <?php echo JText::_('JTOOLBAR_APPLY') ?>
                </a>
            </div>
        </div>
    <div id="embed-modal" class="ba-modal-md modal hide" style="display:none">
        <div class="ba-modal-header">
            <i class="zmdi zmdi-close" data-dismiss="modal"></i>
            <h3><?php echo JText::_('EDIT_EMBED'); ?></h3>
        </div>
        <div class="modal-body">
            <textarea type="text" class="ba-embed"></textarea>
        </div>
        <div class="modal-footer">
            <a href="#" class="ba-btn" data-dismiss="modal"><?php echo JText::_('CANCEL') ?></a>
            <a href="#" class="ba-btn-primary" id="embed-apply"><?php echo JText::_('SAVE') ?></a>
        </div>
    </div>
    <div id="select-upload-type">
        <div class="upload-type desktop">
            <i class="zmdi zmdi-desktop-windows"></i>
            <span class="ba-tooltip ba-left"><?php echo JText::_('UPLOAD_FROM_DESKTOP'); ?></span>
        </div>
        <div class="upload-type folder">
            <i class="zmdi zmdi-folder"></i>
            <span class="ba-tooltip ba-left"><?php echo JText::_('UPLOAD_FROM_FOLDER'); ?></span>
        </div>
        <input type="file" multiple style="display: none">
    </div>
    <div id="global-options" class="ba-modal-lg modal hide" style="display:none">
        <div class="ba-media-header">
            <div class="modal-header-icon">
                <i class="zmdi zmdi-check" id="apply-options" data-dismiss="modal"></i>
                <i class="zmdi zmdi-close" data-dismiss="modal"></i>
            </div>
        </div>
        <div class="modal-body">
            <div id="general-tabs">
                <ul class="nav nav-tabs uploader-nav">
                    <li class="active">
                        <a href="#general-options" data-toggle="tab">
                            <i class="zmdi zmdi-settings"></i>
                            <?php echo JText::_('GENERAL') ?>
                        </a>
                    </li>
                    <li>
                        <a href="#thumbnail-options" data-toggle="tab">
                            <i class="zmdi zmdi-collection-image"></i>
                            <?php echo JText::_('THUMBNAIL') ?>
                        </a>
                    </li>
                    <li>
                        <a href="#lightbox-options" data-toggle="tab">
                            <i class="zmdi zmdi-layers"></i>
                            <?php echo JText::_('LIGHTBOX') ?>
                        </a>
                    </li>
                </ul>
                <div class="tabs-underline"></div>
                <div class="tab-content">
                    <div class="tab-pane active" id="general-options">
                        <div class="ba-options-group">
                            <div class="ba-group-element">
                                <lable class="option-label">
                                    <?php echo JText::_('GALLERY_LAYOUT') ?>
                                </lable>
                                <div class="ba-custom-select">
                                    <input type="text" class="ba-form-trigger" data-value=""
                                           readonly value="">
                                    <i class="zmdi zmdi-caret-down"></i>
                                    <ul>
                                        <li data-value="justified"><?php echo JText::_('JUSTIFIED') ?></li>
                                    </ul>
                                </div>
                                <?php echo $this->form->getInput('gallery_layout');?>
                            </div>
                        </div>
                        <div class="ba-options-group">
                            <div class="ba-group-element">
                                <lable class="option-label">
                                    <?php echo JText::_('CLASS_SUFFIX') ?>
                                </lable>
                                <?php echo $this->form->getInput('class_suffix');?>
                                <label class="ba-help-icon">
                                    <i class="zmdi zmdi-help"></i>
                                    <span class="ba-tooltip ba-help">
                                        <?php echo JText::_('CLASS_SUFFIX_TOOLTIP'); ?>
                                    </span>
                                </label>
                            </div>
                        </div>                        
                    </div>
                    <div class="tab-pane tab-wrapper" id="thumbnail-options">
                        <div class="left-tabs">
                            <ul class="nav nav-tabs">
                                <li class="active">
                                    <a href="#thumbnail-general-options" data-toggle="tab">
                                        <i class="zmdi zmdi-settings"></i>
                                        <?php echo JText::_('GENERAL') ?>
                                    </a>
                                </li>
                                <li>
                                    <a href="#thumbnail-caption-options" data-toggle="tab">
                                        <i class="zmdi zmdi-cast-connected"></i>
                                        <?php echo JText::_('CAPTION') ?>
                                    </a>
                                </li>
                                <li>
                                    <a href="#thumbnail-typography-options" data-toggle="tab">
                                        <i class="zmdi zmdi-font"></i>
                                        <?php echo JText::_('TYPOGRAPHY') ?>
                                    </a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="thumbnail-general-options">
                                    <div class="ba-options-group">
                                        <div class="ba-group-element">
                                            <lable class="option-label">
                                                <?php echo JText::_('IMAGE_WIDTH') ?>
                                            </lable>
                                            <span class="ba-range-liner"></span>
                                            <input type="range" class="ba-gallery-range" min="100" max=1000>
                                            <?php echo $this->form->getInput('image_width');?>
                                        </div>
                                    </div>
                                    <div class="ba-options-group">
                                        <div class="ba-group-element">
                                            <lable class="option-label">
                                                <?php echo JText::_('IMAGE_QUALITY') ?>, %
                                            </lable>
                                            <span class="ba-range-liner"></span>
                                            <input type="range" class="ba-gallery-range" min="0" max=100>
                                            <?php echo $this->form->getInput('image_quality');?>
                                            <label class="ba-help-icon">
                                                <i class="zmdi zmdi-help"></i>
                                                <span class="ba-tooltip ba-help">
                                                    <?php echo JText::_('IMAGE_QUALITY_TOOLTIP'); ?>
                                                </span>
                                            </label>
                                        </div>
                                    </div>
                                    <p class="ba-group-title"><?php echo JText::_('COLUMN_NUMBER') ?></p>
                                    <div class="ba-options-group">
                                        <div class="ba-group-element">
                                            <lable class="option-label">
                                                <?php echo JText::_('DEVICE') ?>
                                            </lable>
                                            <div class="ba-custom-select visible-select-top">
                                                <input type="text" class="column-number-select" data-value="desktop" readonly=""
                                                    value="<?php echo JText::_('DESKTOP'); ?>" aria-invalid="false">
                                                <i class="zmdi zmdi-caret-down"></i>
                                                <ul class="select-no-scroll">
                                                    <li data-value="desktop"><?php echo JText::_('DESKTOP'); ?></li>
                                                    <li data-value="tablet"><?php echo JText::_('TABLET_PORTRAIT'); ?></li>
                                                    <li data-value="phone-land"><?php echo JText::_('PHONE_LANDSCAPE'); ?></li>
                                                    <li data-value="phone-port"><?php echo JText::_('PHONE_PORTRAIT'); ?></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="desktop-options option-border">
                                            <div class="ba-group-element">
                                                <lable class="option-label">
                                                    <?php echo JText::_('QUANTITY') ?>
                                                </lable>
                                                <span class="ba-range-liner"></span>
                                                <input type="range" class="ba-gallery-range" min="0" max=25>
                                                <?php echo $this->form->getInput('column_number');?>
                                            </div>
                                        </div>
                                        <div class="tablet-options option-border" style="display:none;">
                                            <div class="ba-group-element">
                                                <lable class="option-label">
                                                    <?php echo JText::_('QUANTITY') ?>
                                                </lable>
                                                <span class="ba-range-liner"></span>
                                                <input type="range" class="ba-gallery-range" min="0" max=25>
                                                <?php echo $this->form->getInput('tablet_numb');?>
                                            </div>
                                        </div>
                                        <div class="phone-land-options option-border" style="display:none;">
                                            <div class="ba-group-element">
                                                <lable class="option-label">
                                                    <?php echo JText::_('QUANTITY') ?>
                                                </lable>
                                                <span class="ba-range-liner"></span>
                                                <input type="range" class="ba-gallery-range" min="0" max=25>
                                                <?php echo $this->form->getInput('phone_land_numb');?>
                                            </div>
                                        </div>
                                        <div class="phone-port-options option-border" style="display:none;">
                                            <div class="ba-group-element">
                                                <lable class="option-label">
                                                    <?php echo JText::_('QUANTITY') ?>
                                                </lable>
                                                <span class="ba-range-liner"></span>
                                                <input type="range" class="ba-gallery-range" min="0" max=25>
                                                <?php echo $this->form->getInput('phone_port_numb');?>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="ba-options-group">
                                        <div class="ba-group-element">
                                            <lable class="option-label">
                                                <?php echo JText::_('IMAGE_SPACING') ?>
                                            </lable>
                                            <span class="ba-range-liner"></span>
                                            <input type="range" class="ba-gallery-range" min="0" max=100>
                                            <?php echo $this->form->getInput('image_spacing');?>
                                            <label class="ba-help-icon">
                                                <i class="zmdi zmdi-help"></i>
                                                <span class="ba-tooltip ba-help">
                                                    <?php echo JText::_('IMAGE_SPACING_TOOTLTIP'); ?>
                                                </span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="thumbnail-caption-options">
                                    <div class="ba-options-group">
                                        <div class="ba-group-element">
                                            <lable class="option-label">
                                                <?php echo JText::_('DISABLE_CAPTION'); ?>
                                            </lable>
                                            <input type="hidden" name="jform[disable_caption]" value="0">
                                            <label class="ba-checkbox">
                                                <?php echo $this->form->getInput('disable_caption');?>
                                                <span></span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="ba-options-group caption-group">
                                        <div class="ba-group-element">
                                            <lable class="option-label">
                                                <?php echo JText::_('THUMBNAIL_EFFECT') ?>
                                            </lable>
                                            <div class="ba-custom-select">
                                                <input type="text" class="ba-form-trigger" data-value=""
                                                       readonly value="">
                                                <i class="zmdi zmdi-caret-down"></i>
                                                <ul>
                                                    <li data-value="1"><?php echo JText::_('LAYOUT_1') ?></li>
                                                </ul>
                                            </div>
                                            <?php echo $this->form->getInput('thumbnail_layout');?>
                                        </div>
                                    </div>
                                    <div class="ba-options-group caption-group">
                                        <div class="ba-group-element">
                                            <lable class="option-label">
                                                <?php echo JText::_('CAPTION_BG') ?>
                                            </lable>
                                            <?php echo $this->form->getInput('caption_bg');?>
                                            <?php echo $this->form->getInput('caption_opacity');?>
                                        </div>
                                    </div>
                                    <div class="ba-options-group caption-group">
                                        <div class="ba-group-element">
                                            <lable class="option-label">
                                                <?php echo JText::_('DISPLAY_TITLE') ?>
                                            </lable>
                                            <input type="hidden" name="jform[display_title]" value="0">
                                            <label class="ba-checkbox">
                                                <?php echo $this->form->getInput('display_title');?>
                                                <span></span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="ba-options-group caption-group">
                                        <div class="ba-group-element">
                                            <lable class="option-label">
                                                <?php echo JText::_('DISPLAY_CATEGORY') ?>
                                            </lable>
                                            <input type="hidden" name="jform[display_categoty]" value="0">
                                            <label class="ba-checkbox">
                                                <?php echo $this->form->getInput('display_categoty');?>
                                                <span></span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="thumbnail-typography-options">
                                    <div class="ba-options-group">
                                        <div class="ba-group-element">
                                            <lable class="option-label">
                                                <?php echo JText::_('SELECT') ?>
                                            </lable>
                                            <div class="ba-custom-select">
                                                <input type="text" class="thumbnail-typography-select" data-value="title"
                                                       readonly value="<?php echo JText::_('TITLE'); ?>">
                                                <i class="zmdi zmdi-caret-down"></i>
                                                <ul class="select-no-scroll">
                                                    <li data-value="title"><?php echo JText::_('TITLE') ?></li>
                                                    <li data-value="category"><?php echo JText::_('CATEGORY') ?></li>
                                                    <li data-value="description"><?php echo JText::_('SHORT_DESCRIPTION') ?></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="title-options option-border">
                                            <div class="ba-group-element">
                                                <lable class="option-label">
                                                    <?php echo JText::_('FONT_COLOR') ?>
                                                </lable>
                                                <input type="text" id="title_color">
                                                <?php echo $this->form->getInput('title_color');?>
                                            </div>
                                            <div class="ba-group-element">
                                                <lable class="option-label">
                                                    <?php echo JText::_('FONT_WEIGHT') ?>
                                                </lable>
                                                <?php echo $this->form->getInput('title_weight');?>
                                                <div class="weight_radio">
                                                    <label class="ba-radio-button">
                                                        <input type="radio" name="title_weight_radio" value ="normal">
                                                        <span></span>
                                                    </label>
                                                    <?php echo JText::_('NORMAL') ?>
                                                    <label class="ba-radio-button">
                                                        <input type="radio" name="title_weight_radio" value ="bold">
                                                        <span></span>
                                                    </label>
                                                    <?php echo JText::_('BOLD') ?>    
                                                </div>
                                            </div>
                                            <div class="ba-group-element">
                                                <lable class="option-label">
                                                    <?php echo JText::_('FONT_SIZE') ?>
                                                </lable>
                                                <span class="ba-range-liner"></span>
                                                <input type="range" class="ba-gallery-range" min="0" max=120>
                                                <?php echo $this->form->getInput('title_size');?>
                                            </div>
                                            <div class="ba-group-element">
                                                <lable class="option-label">
                                                    <?php echo JText::_('ALIGNMENT') ?>
                                                </lable>
                                                <div class="ba-custom-select visible-select-top">
                                                    <input type="text" class="ba-form-trigger" data-value=""
                                                           readonly value="">
                                                    <ul class="select-no-scroll">
                                                        <li data-value="left"><?php echo JText::_('LEFT') ?></li>
                                                        <li data-value="center"><?php echo JText::_('CENTER') ?></li>
                                                        <li data-value="right"><?php echo JText::_('RIGHT') ?></li>
                                                    </ul>
                                                    <i class="zmdi zmdi-caret-down"></i>
                                                </div>
                                                <?php echo $this->form->getInput('title_alignment');?>
                                            </div>
                                        </div>
                                        <div class="category-options option-border" style="display:none">
                                            <div class="ba-group-element">
                                                <lable class="option-label">
                                                    <?php echo JText::_('FONT_COLOR') ?>
                                                </lable>
                                                <input type="text" id="category_color">
                                                <?php echo $this->form->getInput('category_color');?>
                                            </div>
                                            <div class="ba-group-element">
                                                <lable class="option-label">
                                                    <?php echo JText::_('FONT_WEIGHT') ?>
                                                </lable>
                                                <?php echo $this->form->getInput('category_weight');?>
                                                <div class="weight_radio">
                                                    <label class="ba-radio-button">
                                                        <input type="radio" name="category_weight_radio" value ="normal">
                                                        <span></span>
                                                    </label>
                                                    <?php echo JText::_('NORMAL') ?>
                                                    <label class="ba-radio-button">
                                                        <input type="radio" name="category_weight_radio" value ="bold">
                                                        <span></span>
                                                    </label>
                                                    <?php echo JText::_('BOLD') ?>
                                                </div>
                                            </div>
                                            <div class="ba-group-element">
                                                <lable class="option-label">
                                                    <?php echo JText::_('FONT_SIZE') ?>
                                                </lable>
                                                <span class="ba-range-liner"></span>
                                                <input type="range" class="ba-gallery-range" min="0" max=120>
                                                <?php echo $this->form->getInput('category_size');?>
                                            </div>
                                            <div class="ba-group-element">
                                                <lable class="option-label">
                                                    <?php echo JText::_('ALIGNMENT') ?>
                                                </lable>
                                                <div class="ba-custom-select visible-select-top">
                                                    <input type="text" class="ba-form-trigger" data-value=""
                                                           readonly value="">
                                                    <ul class="select-no-scroll">
                                                        <li data-value="left"><?php echo JText::_('LEFT') ?></li>
                                                        <li data-value="center"><?php echo JText::_('CENTER') ?></li>
                                                        <li data-value="right"><?php echo JText::_('RIGHT') ?></li>
                                                    </ul>
                                                    <i class="zmdi zmdi-caret-down"></i>
                                                </div>
                                                <?php echo $this->form->getInput('category_alignment');?>
                                            </div>
                                        </div>
                                        <div class="description-options option-border" style="display:none">
                                            <div class="ba-group-element">
                                                <lable class="option-label">
                                                    <?php echo JText::_('FONT_COLOR') ?>
                                                </lable>
                                                <input type="text" id="description_color">
                                                <?php echo $this->form->getInput('description_color');?>
                                            </div>
                                            <div class="ba-group-element">
                                                <lable class="option-label">
                                                    <?php echo JText::_('FONT_WEIGHT') ?>
                                                </lable>
                                                <?php echo $this->form->getInput('description_weight');?>
                                                <div class="weight_radio">
                                                    <label class="ba-radio-button">
                                                        <input type="radio" name="description_weight_radio" value ="normal">
                                                        <span></span>
                                                    </label>
                                                    <?php echo JText::_('NORMAL') ?>
                                                    <label class="ba-radio-button">
                                                        <input type="radio" name="description_weight_radio" value ="bold">
                                                        <span></span>
                                                    </label>
                                                    <?php echo JText::_('BOLD') ?>
                                                </div>
                                            </div>
                                            <div class="ba-group-element">
                                                <lable class="option-label">
                                                    <?php echo JText::_('FONT_SIZE') ?>
                                                </lable>
                                                <span class="ba-range-liner"></span>
                                                <input type="range" class="ba-gallery-range" min="0" max=120>
                                                <?php echo $this->form->getInput('description_size');?>
                                            </div>
                                            <div class="ba-group-element">
                                                <lable class="option-label">
                                                    <?php echo JText::_('ALIGNMENT') ?>
                                                </lable>
                                                <div class="ba-custom-select visible-select-top">
                                                    <input type="text" class="ba-form-trigger" data-value=""
                                                           readonly value="">
                                                    <ul class="select-no-scroll">
                                                        <li data-value="left"><?php echo JText::_('LEFT') ?></li>
                                                        <li data-value="center"><?php echo JText::_('CENTER') ?></li>
                                                        <li data-value="right"><?php echo JText::_('RIGHT') ?></li>
                                                    </ul>
                                                    <i class="zmdi zmdi-caret-down"></i>
                                                </div>
                                                <?php echo $this->form->getInput('description_alignment');?>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>                        
                    </div>
                    <div class="tab-pane tab-wrapper" id="lightbox-options">
                        <div class="left-tabs">
                            <ul class="nav nav-tabs">
                                <li class="active">
                                    <a href="#lightbox-general-options" data-toggle="tab">
                                        <i class="zmdi zmdi-settings"></i>
                                        <?php echo JText::_('GENERAL') ?>
                                    </a>
                                </li>
                                <li>
                                    <a href="#lightbox-header-options" data-toggle="tab">
                                        <i class="zmdi zmdi-movie"></i>
                                        <?php echo JText::_('HEADER') ?>
                                    </a>
                                </li>
                                <li>
                                    <a href="#lightbox-navigation-options" data-toggle="tab">
                                        <i class="zmdi zmdi-caret-right-circle"></i>
                                        <?php echo JText::_('NAVIGATION') ?>
                                    </a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="lightbox-general-options">
                                    <div class="ba-options-group">
                                        <div class="ba-group-element">
                                            <lable class="option-label">
                                                <?php echo JText::_('ENABLE_LIGHTBOX') ?>
                                            </lable>
                                            <?php echo $this->form->getInput('disable_lightbox');?>
                                            <label class="ba-checkbox">
                                                <input type="checkbox" id="enable-lightbox">
                                                <span></span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="ba-options-group">
                                        <div class="ba-group-element">
                                            <lable class="option-label">
                                                <?php echo JText::_('AUTO_RESIZE') ?>
                                            </lable>
                                            <input type="hidden" name="jform[auto_resize]" value="0">
                                            <label class="ba-checkbox">
                                                <?php echo $this->form->getInput('auto_resize');?>
                                                <span></span>
                                            </label>
                                            <label class="ba-help-icon">
                                                <i class="zmdi zmdi-help"></i>
                                                <span class="ba-tooltip ba-help">
                                                    <?php echo JText::_('AUTO_RESIZE_TOOLTIP'); ?>
                                                </span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="ba-options-group lightbox-width">
                                        <div class="ba-group-element">
                                            <lable class="option-label">
                                                <?php echo JText::_('LIGHTBOX_WIDTH') ?>
                                            </lable>
                                            <span class="ba-range-liner"></span>
                                            <input type="range" class="ba-gallery-range" min="0" max=100>
                                            <?php echo $this->form->getInput('lightbox_width');?>
                                        </div>
                                    </div>
                                    <div class="ba-options-group">
                                        <div class="ba-group-element">
                                            <lable class="option-label">
                                                <?php echo JText::_('LIGHTBOX_COLOR') ?>
                                            </lable>
                                            <input type="text" id="lightbox_border">
                                            <?php echo $this->form->getInput('lightbox_border');?>
                                        </div>
                                    </div>
                                    <div class="ba-options-group">
                                        <div class="ba-group-element">
                                            <lable class="option-label">
                                                <?php echo JText::_('DESCRIPTION_POSITION') ?>
                                            </lable>
                                            <div class="ba-custom-select visible-select-top">
                                                <input type="text" class="ba-form-trigger" data-value=""
                                                       readonly value="">
                                                <i class="zmdi zmdi-caret-down"></i>
                                                <ul class="select-no-scroll">
                                                    <li data-value="left"><?php echo JText::_('LEFT'); ?></li>
                                                    <li data-value="right"><?php echo JText::_('RIGHT'); ?></li>
                                                    <li data-value="below"><?php echo JText::_('BELOW'); ?></li>
                                                </ul>
                                            </div>
                                            <?php echo $this->form->getInput('description_position');?>
                                        </div>
                                    </div>
                                    <div class="ba-options-group">
                                        <div class="ba-group-element">
                                            <lable class="option-label">
                                                <?php echo JText::_('LIGHTBOX_BG') ?>
                                            </lable>
                                            <?php echo $this->form->getInput('lightbox_bg');?>
                                            <?php echo $this->form->getInput('lightbox_bg_transparency');?>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="lightbox-header-options">
                                    <div class="ba-options-group">
                                        <div class="ba-group-element">
                                            <lable class="option-label">
                                                <?php echo JText::_('DISPLAY_HEADER') ?>
                                            </lable>
                                            <input type="hidden" name="jform[display_header]" value="0">
                                            <label class="ba-checkbox">
                                                <?php echo $this->form->getInput('display_header');?>
                                                <span></span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="ba-options-group">
                                        <div class="ba-group-element">
                                            <lable class="option-label">
                                                <?php echo JText::_('DISPLAY_TITLE') ?>
                                            </lable>
                                            <input type="hidden" name="jform[lightbox_display_title]" value="0">
                                            <label class="ba-checkbox">
                                                <?php echo $this->form->getInput('lightbox_display_title');?>
                                                <span></span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="ba-options-group">
                                        <div class="ba-group-element">
                                            <lable class="option-label">
                                                <?php echo JText::_('HEADER_ITEMS_COLOR') ?>
                                            </lable>
                                            <input type="text" id="header_icons_color">
                                            <?php echo $this->form->getInput('header_icons_color');?>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="lightbox-navigation-options">
                                    <p class="ba-group-title"><?php echo JText::_('ARROWS') ?></p>
                                    <div class="ba-options-group">
                                        <div class="ba-group-element">
                                            <lable class="option-label">
                                                <?php echo JText::_('NAV_ARROWS') ?>
                                            </lable>
                                            <input type="text" id="nav_button_icon">
                                            <?php echo $this->form->getInput('nav_button_icon');?>
                                        </div>
                                        <div class="ba-group-element">
                                            <lable class="option-label">
                                                <?php echo JText::_('NAV_ARROWS_BG') ?>
                                            </lable>
                                            <input type="text" id="nav_button_bg">
                                            <?php echo $this->form->getInput('nav_button_bg');?>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="lightbox-comments-options">
                                    <div class="ba-options-group">
                                        <div class="ba-group-element">
                                            <lable class="option-label">
                                                <?php echo JText::_('COMMENT_SYSTEM') ?>
                                            </lable>
                                            <div class="ba-custom-select">
                                                <input type="text" class="ba-form-trigger" data-value=""
                                                       readonly value="">
                                                <i class="zmdi zmdi-caret-down"></i>
                                                <ul>
                                                    <li data-value="0"><?php echo JText::_('NONE_EFFECT') ?></li>
                                                    <li data-value="1">Disqus</li>
                                                    <li data-value="vkontakte">VKontakte</li>
                                                </ul>
                                            </div>
                                            <?php echo $this->form->getInput('enable_disqus');?>
                                        </div>
                                        <div class="disqus-options option-border">
                                            <div class="ba-group-element">
                                                <lable class="option-label">
                                                    <?php echo JText::_('DISQUS_SUBDOMEN') ?>
                                                </lable>
                                                <?php echo $this->form->getInput('disqus_subdomen');?>
                                            </div>
                                        </div>
                                        <div class="vk-options option-border">
                                            <div class="ba-group-element">
                                                <lable class="option-label">
                                                    API ID
                                                </lable>
                                                <?php echo $this->form->getInput('vk_api_id');?>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>                                             
                    </div>
                    <div class="tab-pane" id="filter-options">
                        <p class="ba-group-title"><?php echo JText::_('TYPOGRAPHY'); ?></p>
                        <div class="ba-options-group">
                            <div class="ba-group-element">
                                <lable class="option-label">
                                    <?php echo JText::_('FONT_WEIGHT') ?>
                                </lable>
                                <?php echo $this->form->getInput('font_weight');?>
                                <div class="weight_radio">
                                    <label class="ba-radio-button">
                                        <input type="radio" name="font_weight_radio" value ="normal">
                                        <span></span>
                                    </label>
                                    <?php echo JText::_('NORMAL') ?>
                                    <label class="ba-radio-button">
                                        <input type="radio" name="font_weight_radio" value ="bold">
                                        <span></span>
                                    </label>
                                    <?php echo JText::_('BOLD') ?>
                                </div>
                            </div>
                            <div class="ba-group-element">
                                <lable class="option-label">
                                    <?php echo JText::_('FONT_SIZE') ?>
                                </lable>
                                <span class="ba-range-liner"></span>
                                <input type="range" class="ba-gallery-range" min="0" max=120>
                                <?php echo $this->form->getInput('font_size');?>
                            </div>
                        </div>
                        <div class="ba-options-group">
                            <div class="ba-group-element">
                                <lable class="option-label">
                                    <?php echo JText::_('ALIGNMENT') ?>
                                </lable>
                                <div class="ba-custom-select">
                                    <input type="text" class="ba-form-trigger" data-value=""
                                           readonly value="">
                                    <ul class="select-no-scroll">
                                        <li data-value="left"><?php echo JText::_('LEFT') ?></li>
                                        <li data-value="center"><?php echo JText::_('CENTER') ?></li>
                                        <li data-value="right"><?php echo JText::_('RIGHT') ?></li>
                                    </ul>
                                    <i class="zmdi zmdi-caret-down"></i>
                                </div>
                                <?php echo $this->form->getInput('alignment');?>
                            </div>
                        </div>
                        <div class="ba-options-group">
                            <div class="ba-group-element">
                                <lable class="option-label">
                                    <?php echo JText::_('BORDER_RADIUS') ?>
                                </lable>
                                <span class="ba-range-liner"></span>
                                <input type="range" class="ba-gallery-range" min="0" max=120>
                                <?php echo $this->form->getInput('border_radius');?>
                            </div>
                        </div>
                        <div class="ba-options-group">
                            <div class="ba-group-element">
                                <lable class="option-label">
                                    <?php echo JText::_('STATE') ?>
                                </lable>
                                <div class="ba-custom-select">
                                    <input type="text" class="filter-select" data-value="active"
                                           readonly value="<?php echo JText::_('ACTIVE'); ?>">
                                    <i class="zmdi zmdi-caret-down"></i>
                                    <ul class="select-no-scroll">
                                        <li data-value="active"><?php echo JText::_('ACTIVE') ?></li>
                                        <li data-value="default"><?php echo JText::_('default') ?></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="filter-options option-border" style="display:none">
                                <div class="ba-group-element">
                                    <lable class="option-label">
                                        <?php echo JText::_('BG_COLOR') ?>
                                    </lable>
                                    <input type="text" id="bg_color">
                                    <?php echo $this->form->getInput('bg_color');?>
                                </div>
                                <div class="ba-group-element">
                                    <lable class="option-label">
                                        <?php echo JText::_('BG_COLOR_HOVER') ?>
                                    </lable>
                                    <input type="text" id="bg_color_hover">
                                    <?php echo $this->form->getInput('bg_color_hover');?>
                                </div>
                                <div class="ba-group-element">
                                    <lable class="option-label">
                                        <?php echo JText::_('BORDER') ?>
                                    </lable>
                                    <input type="text" id="border_color">
                                    <?php echo $this->form->getInput('border_color');?>
                                </div>
                                <div class="ba-group-element">
                                    <lable class="option-label">
                                        <?php echo JText::_('FONT_COLOR') ?>
                                    </lable>
                                    <input type="text" id="font_color">
                                    <?php echo $this->form->getInput('font_color');?>
                                </div>
                                <div class="ba-group-element">
                                    <lable class="option-label">
                                        <?php echo JText::_('FONT_COLOR_HOVER') ?>
                                    </lable>
                                    <input type="text" id="font_color_hover">
                                    <?php echo $this->form->getInput('font_color_hover');?>
                                </div>
                            </div>
                            <div class="filter-options-active option-border">
                                <div class="ba-group-element">
                                    <lable class="option-label">
                                        <?php echo JText::_('BG_COLOR') ?>
                                    </lable>
                                    <input type="text" id="bg_active">
                                    <?php echo $this->form->getInput('bg_active');?>
                                </div>
                                <div class="ba-group-element">
                                    <lable class="option-label">
                                        <?php echo JText::_('BG_COLOR_HOVER') ?>
                                    </lable>
                                    <input type="text" id="bg_hover_active">
                                    <?php echo $this->form->getInput('bg_hover_active');?>
                                </div>
                                <div class="ba-group-element">
                                    <lable class="option-label">
                                        <?php echo JText::_('BORDER') ?>
                                    </lable>
                                    <input type="text" id="border_color_active">
                                    <?php echo $this->form->getInput('border_color_active');?>
                                </div>
                                <div class="ba-group-element">
                                    <lable class="option-label">
                                        <?php echo JText::_('FONT_COLOR') ?>
                                    </lable>
                                    <input type="text" id="font_color_active">
                                    <?php echo $this->form->getInput('font_color_active');?>
                                </div>
                                <div class="ba-group-element">
                                    <lable class="option-label">
                                        <?php echo JText::_('FONT_COLOR_HOVER') ?>
                                    </lable>
                                    <input type="text" id="font_color_hover_active">
                                    <?php echo $this->form->getInput('font_color_hover_active');?>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="pagination-options">
                        <div class="ba-options-group">
                            <div class="ba-group-element">
                                <lable class="option-label">
                                    <?php echo JText::_('PAGINATION_TYPE') ?>
                                </lable>
                                <div class="ba-custom-select">
                                    <input type="text" class="ba-form-trigger" data-value=""
                                           readonly value="">
                                    <i class="zmdi zmdi-caret-down"></i>
                                    <ul>
                                        <li data-value="default"><?php echo JText::_('DEFAULT') ?></li>
                                        <li data-value="dots"><?php echo JText::_('DOTS') ?></li>
                                        <li data-value="infinity"><?php echo JText::_('INFINITY') ?></li>
                                        <li data-value="load"><?php echo JText::_('LOAD_MORE') ?></li>
                                        <li data-value="slider"><?php echo JText::_('SLIDER') ?></li>
                                    </ul>
                                </div>
                                <?php echo $this->form->getInput('pagination_type');?>
                            </div>
                        </div>
                        <div class="ba-options-group">
                            <div class="ba-group-element">
                                <lable class="option-label">
                                    <?php echo JText::_('IMAGES_PER_PAGE') ?>
                                </lable>
                                <span class="ba-range-liner"></span>
                                <input type="range" class="ba-gallery-range" min="0" max=100>
                                <?php echo $this->form->getInput('images_per_page');?>
                            </div>
                        </div>
                        <div class="ba-options-group">
                            <div class="ba-group-element">
                                <lable class="option-label">
                                    <?php echo JText::_('ALIGNMENT') ?>
                                </lable>
                                <div class="ba-custom-select">
                                    <input type="text" class="ba-form-trigger" data-value=""
                                           readonly value="">
                                    <ul class="select-no-scroll">
                                        <li data-value="left"><?php echo JText::_('LEFT') ?></li>
                                        <li data-value="center"><?php echo JText::_('CENTER') ?></li>
                                        <li data-value="right"><?php echo JText::_('RIGHT') ?></li>
                                    </ul>
                                    <i class="zmdi zmdi-caret-down"></i>
                                </div>
                                <?php echo $this->form->getInput('pagination_alignment');?>
                            </div>
                        </div>
                        <p class="ba-group-title"><?php echo JText::_('BACKGROUND') ?></p>
                        <div class="ba-options-group">
                            <div class="ba-group-element">
                                <lable class="option-label">
                                    <?php echo JText::_('BG_COLOR') ?>
                                </lable>
                                <input type="text" id="pagination_bg">
                                <?php echo $this->form->getInput('pagination_bg');?>
                            </div>
                            <div class="ba-group-element">
                                <lable class="option-label">
                                    <?php echo JText::_('BG_COLOR_HOVER') ?>
                                </lable>
                                <input type="text" id="pagination_bg_hover">
                                <?php echo $this->form->getInput('pagination_bg_hover');?>
                            </div>
                        </div>
                        <p class="ba-group-title"><?php echo JText::_('BORDER') ?></p>
                        <div class="ba-options-group">
                            <div class="ba-group-element">
                                <lable class="option-label">
                                    <?php echo JText::_('BORDER_COLOR') ?>
                                </lable>
                                <input type="text" id="pagination_border">
                                <?php echo $this->form->getInput('pagination_border');?>
                            </div>
                            <div class="ba-group-element">
                                <lable class="option-label">
                                    <?php echo JText::_('BORDER_RADIUS') ?>
                                </lable>
                                <span class="ba-range-liner"></span>
                                <input type="range" class="ba-gallery-range" min="0" max=120>
                                <?php echo $this->form->getInput('pagination_radius');?>
                            </div>
                        </div>
                        <p class="ba-group-title"><?php echo JText::_('TYPOGRAPHY') ?></p>
                        <div class="ba-options-group">
                            <div class="ba-group-element">
                                <lable class="option-label">
                                    <?php echo JText::_('FONT_COLOR') ?>
                                </lable>
                                <input type="text" id="pagination_font">
                                <?php echo $this->form->getInput('pagination_font');?>
                            </div>
                            <div class="ba-group-element">
                                <lable class="option-label">
                                    <?php echo JText::_('FONT_COLOR_HOVER') ?>
                                </lable>
                                <input type="text" id="pagination_font_hover">
                                <?php echo $this->form->getInput('pagination_font_hover');?>
                            </div>                            
                        </div>
                    </div>
                    <div class="tab-pane" id="copyright-options">
                        <div class="left-tabs">
                            <ul class="nav nav-tabs">
                                <li class="active">
                                    <a href="#copyright-general-options" data-toggle="tab">
                                        <i class="zmdi zmdi-settings"></i>
                                        <?php echo JText::_('GENERAL') ?>
                                    </a>
                                </li>
                                <li>
                                    <a href="#copyright-watermark-options" data-toggle="tab">
                                        <i class="zmdi zmdi-star"></i>
                                        <?php echo JText::_('WATERMARK') ?>
                                    </a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="copyright-general-options">
                                    <div class="ba-options-group">
                                        <div class="ba-group-element">
                                            <lable class="option-label">
                                                <?php echo JText::_('DISABLE_RIGHT_CLICK') ?>
                                            </lable>
                                            <input type="hidden" name="jform[disable_right_clk]" value="0">
                                            <label class="ba-checkbox">
                                                <?php echo $this->form->getInput('disable_right_clk'); ?>
                                                <span></span>
                                            </label>
                                            <label class="ba-help-icon">
                                                <i class="zmdi zmdi-help"></i>
                                                <span class="ba-tooltip ba-help">
                                                    <?php echo JText::_('DISABLE_RIGHT_CLICK_TOOLTIP'); ?>
                                                </span>
                                            </label>
                                        </div>      
                                    </div>
                                    <div class="ba-options-group">
                                        <div class="ba-group-element">
                                            <lable class="option-label">
                                                <?php echo JText::_('DISABLE_SHORTCUTS') ?>
                                            </lable>
                                            <input type="hidden" name="jform[disable_shortcuts]" value="0">
                                            <label class="ba-checkbox">
                                                <?php echo $this->form->getInput('disable_shortcuts'); ?>
                                                <span></span>
                                            </label>
                                            <label class="ba-help-icon">
                                                <i class="zmdi zmdi-help"></i>
                                                <span class="ba-tooltip ba-help">
                                                    <?php echo JText::_('DISABLE_SHORTCUTS_TOOLTIP'); ?>
                                                </span>
                                            </label>
                                        </div>      
                                    </div>
                                    <div class="ba-options-group">
                                        <div class="ba-group-element">
                                            <lable class="option-label">
                                                <?php echo JText::_('DISABLE_DEVELOPER_CONSOLE') ?>
                                            </lable>
                                            <input type="hidden" name="jform[disable_dev_console]" value="0">
                                            <label class="ba-checkbox">
                                                <?php echo $this->form->getInput('disable_dev_console'); ?>
                                                <span></span>
                                            </label>
                                            <label class="ba-help-icon">
                                                <i class="zmdi zmdi-help"></i>
                                                <span class="ba-tooltip ba-help">
                                                    <?php echo JText::_('DISABLE_DEVELOPER_CONSOLE_TOOLTIP'); ?>
                                                </span>
                                            </label>
                                        </div>      
                                    </div>
                                </div>
                                <div class="tab-pane" id="copyright-watermark-options">
                                    <div class="ba-options-group">
                                        <div class="ba-group-element">
                                            <lable class="option-label">
                                                <?php echo JText::_('UPLOAD_IMAGE') ?>
                                            </lable>
                                            <a class="ba-btn" id="watermark-select" href="#" onclick="return false">
                                                <i class="zmdi zmdi-camera"></i>
                                                <span><?php echo JText::_('SELECT') ?></span>                                               
                                            </a>
                                            <?php echo $this->form->getInput('watermark_upload');?>
                                        </div>
                                    </div>
                                    <div class="ba-options-group">
                                        <div class="ba-group-element">
                                            <lable class="option-label">
                                                <?php echo JText::_('WATERMARK_POSITION') ?>
                                            </lable>
                                            <div class="ba-custom-select">
                                                <input type="text" class="ba-form-trigger" data-value=""
                                                       readonly value="">
                                                <i class="zmdi zmdi-caret-down"></i>
                                                <ul class="select-no-scroll">
                                                    <li data-value="top_left"><?php echo JText::_('TOP_LEFT') ?></li>
                                                    <li data-value="top_right"><?php echo JText::_('TOP_RIGHT') ?></li>
                                                    <li data-value="center"><?php echo JText::_('CENTER') ?></li>
                                                    <li data-value="bottm_left"><?php echo JText::_('BOTTOM_LEFT') ?></li>
                                                    <li data-value="bottom_right"><?php echo JText::_('BOTTOM_RIGHT') ?></li>
                                                </ul>
                                            </div>
                                            <?php echo $this->form->getInput('watermark_position');?>
                                        </div>
                                    </div>
                                    <div class="ba-options-group">
                                        <div class="ba-group-element">
                                            <lable class="option-label">
                                                <?php echo JText::_('WATERMARK_OPACITY') ?>, %
                                            </lable>
                                            <span class="ba-range-liner"></span>
                                            <input type="range" class="ba-gallery-range" min="0" max=100>
                                            <?php echo $this->form->getInput('watermark_opacity');?>
                                            <label class="ba-help-icon">
                                                <i class="zmdi zmdi-help"></i>
                                                <span class="ba-tooltip ba-help">
                                                    <?php echo JText::_('WATERMARK_OPACITY_TOOLTIP'); ?>
                                                </span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="ba-options-group">
                                        <div class="ba-group-element">
                                            <lable class="option-label">
                                                <?php echo JText::_('SCALE_WATERMARK') ?>
                                            </lable>
                                            <input type="hidden" name="jform[scale_watermark]" value="0">
                                            <label class="ba-checkbox">
                                                <?php echo $this->form->getInput('scale_watermark');?>
                                                <span></span>
                                            </label>
                                            <label class="ba-help-icon">
                                                <i class="zmdi zmdi-help"></i>
                                                <span class="ba-tooltip ba-help">
                                                    <?php echo JText::_('SCALE_WATERMARK_TOOLTIP'); ?>
                                                </span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="ba-options-group">
                                        <div class="ba-group-element">
                                            <lable class="option-label">
                                                <?php echo JText::_('DELETE_WATERMARK') ?>
                                            </lable>
                                            <a href="#" id="remove-watermark">
                                                <i class="zmdi zmdi-delete"></i>
                                                <span><?php echo JText::_('DELETE') ?></span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>                
            </div>
        </div>
    </div>
    <div id="move-to-modal" class="ba-modal-md modal hide" style="display:none">
            <div class="modal-body">
                <div class="ba-modal-header">
                    <h3><?php echo JText::_('MOVE_TO'); ?></h3>
                    <i data-dismiss="modal" class="zmdi zmdi-close"></i>
                </div>
                <div class="availible-folders">
                    <ul>
                        <li data-id="root">
                            <span>
                                <i class="zmdi zmdi-folder"></i>
                                <?php echo JText::_('ROOT'); ?>
                            </span>                            
                        </li>
                    </ul>
                </div>
            </div>
            <div class="modal-footer">
                <a href="#" class="ba-btn" data-dismiss="modal">
                    <?php echo JText::_('CANCEL') ?>
                </a>
                <a href="#" class="ba-btn-primary apply-move">
                    <?php echo JText::_('JTOOLBAR_APPLY') ?>
                </a>
            </div>
        </div>
    <div id="html-editor" class="ba-modal-lg modal hide" style="display:none">
        <div class="ba-modal-header">
            <h3><?php echo JText::_('EDIT_DESCRIPTION'); ?></h3>
            <div class="modal-header-icon">
                <i class="zmdi zmdi-check" id="apply-html"></i>
                <i class="zmdi zmdi-close" data-dismiss="modal"></i>    
            </div>
        </div>
        <div class="modal-body">
            <textarea name="CKE-editor"></textarea>
        </div>
    </div>
    <div id="add-link-modal" class="ba-modal-sm modal hide" style="display:none">
        <div class="modal-body">
            <h3><?php echo JText::_('INSERT_LINK'); ?></h3>
            <input type="text" class="image-link" placeholder="<?php echo JText::_('LINK'); ?>">
            <span class="focus-underline"></span>
            <div class="ba-custom-select">
                <input type="text" class="link-target" data-value=""
                       readonly placeholder="<?php echo JText::_('TARGET'); ?>">
                <i class="zmdi zmdi-caret-down"></i>
                <ul>
                    <li data-value="blank"><?php echo JText::_('NEW_WINDOW') ?></li>
                    <li data-value="self"><?php echo JText::_('SAME_WINDOW') ?></li>
                </ul>
            </div>
        </div>
        <div class="modal-footer">
            <a href="#" class="ba-btn" data-dismiss="modal">
                <?php echo JText::_('CANCEL') ?>
            </a>
            <a href="#" class="ba-btn-primary" id="add-link">
                <?php echo JText::_('JTOOLBAR_APPLY') ?>
            </a>
        </div>
    </div>
    <div id="create-category-modal" class="ba-modal-sm modal hide" style="display:none">
        <div class="modal-body">
            <h3><?php echo JText::_('CREATE_CATEGORY'); ?></h3>
            <input type="text" class="category-name" placeholder="<?php echo JText::_('CATEGORY_NAME') ?>">
            <span class="focus-underline"></span>
        </div>
        <div class="modal-footer">
            <a href="#" class="ba-btn" data-dismiss="modal">
                <?php echo JText::_('CANCEL') ?>
            </a>
            <a href="#" class="ba-btn-primary" id="create-new-category">
                <?php echo JText::_('JTOOLBAR_APPLY') ?>
            </a>
        </div>
    </div>
    <div id="delete-dialog" class="ba-modal-sm modal hide" style="display:none">
        <div class="modal-body">
            <h3><?php echo JText::_('DELETE_ITEM'); ?></h3>
            <p class="modal-text can-delete"><?php echo JText::_('MODAL_DELETE') ?></p>
            <p class="modal-text cannot-delete" style="display:none"><?php echo JText::_('CANNOT_DELETE') ?></p>
        </div>
        <div class="modal-footer">
            <a href="#" class="ba-btn" data-dismiss="modal">
                <?php echo JText::_('CANCEL') ?>
            </a>
            <a href="#" class="ba-btn-primary red-btn" id="apply-delete">
                <?php echo JText::_('DELETE') ?>
            </a>
        </div>
    </div>
    <div id="deafult-message-dialog" class="ba-modal-sm modal hide" style="display:none">
        <div class="modal-body">
            <p class="modal-text"><?php echo JText::_('CANNOT_DELETE_DEFAULT') ?></p>
        </div>
        <div class="modal-footer">
            <a href="#" class="ba-btn" data-dismiss="modal"><?php echo JText::_('CLOSE') ?></a>
        </div>
    </div>
    <div id="message-dialog" class="ba-modal-sm modal hide" style="display:none">
        <div class="modal-body">
            <p class="modal-text cannot-default"><?php echo JText::_('CANNOT_DEFAULT') ?></p>
            <p class="modal-text cannot-unpublish" style="display:none"><?php echo JText::_('CANNOT_UNPUBLISH') ?></p>
        </div>
        <div class="modal-footer">
            <a href="#" class="ba-btn" data-dismiss="modal"><?php echo JText::_('CLOSE') ?></a>
        </div>
    </div>
    <div class="gallery-editor row-fluid">
        <div class="category-list span3">
            <a class="create-categery">
                + <?php echo JText::_('CATEGORY'); ?>
            </a>
            <ul>
                <li class="root" id="root">
                    <a>
                        <i class="zmdi zmdi-folder"></i>
                        <span><?php echo JText::_('ROOT'); ?></span>
                    </a>
                    <ul class="root-list">
                        <li id="category-all" class="ba-category" data-id="0">
                            <a>
                                <label>
                                    <input type="checkbox">
                                    <i class="zmdi zmdi-folder"></i>
                                </label>                        
                                <span><?php echo JText::_('ALL'); ?></span>
                                <i class="zmdi zmdi-star"></i>
                                <input type="hidden" class="cat-options" name="cat-options[]"
                                       value="<?php echo JText::_('ALL') ?>;1;1;*;0">
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="images-list span6">
            <div class="table-head">
                <input type="checkbox"  id="check-all">
                <i class="zmdi zmdi-check-circle check-all"></i>
                <div class="header-icons">
                    <label class="ba-custom-select">
                        <i class="zmdi zmdi-sort-asc sort-action"></i>
                        <ul>
                            <li data-value="name"><?php echo JText::_('NAME') ?></li>
                            <li data-value="newest"><?php echo JText::_('NEWEST') ?></li>
                            <li data-value="oldest"><?php echo JText::_('OLDEST') ?></li>
                            <li data-value="random"><?php echo JText::_('RANDOM') ?></li>
                        </ul>
                        <span class="ba-tooltip ba-bottom">
                            <?php echo JText::_('SORT_OPTIONS'); ?>
                        </span>
                    </label>
                    <label>
                        <i class="zmdi zmdi-forward move-to disabled-item"></i>
                        <span class="ba-tooltip ba-bottom">
                            <?php echo JText::_('MOVE_TO'); ?>
                        </span>
                    </label>
                    <label>
                        <i class="zmdi zmdi-delete delete-selected disabled-item"></i>
                    </label>
                </div>
                <div class="pagination-limit">
                    <div class="ba-custom-select">
                        <input readonly value="25"
                           data-value="25"
                           size="2" type="text">
                        <i class="zmdi zmdi-caret-down"></i>
                        <ul>
                            <?php
                            foreach ($pagLimit as $key => $lim) {
                                $str = '<li data-value="'.$key.'">';
                                if ($key == 25) {
                                    $str .= '<i class="zmdi zmdi-check"></i>';
                                }
                                $str .= $lim.'</li>';
                                echo $str;
                            }
                            ?>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="table-body">
                <table class="ba-items-list ba-category-table">
                    <tbody>
                        
                    </tbody>
                </table>
                <table class="ba-items-list ba-items-table">
                    <tbody></tbody>
                </table>
            </div>
            <div class="camera-container disabled-item">
                <i class="zmdi zmdi-camera upload-images disabled-item"></i>
            </div>            
        </div>
        <div class="gallery-options span3">
            <div class="gallery-header" style="display: none;">
                <label>
                    <i class="zmdi zmdi-edit edit-description"></i>
                    <span class="ba-tooltip ba-bottom">
                        <?php echo JText::_('EDIT_DESCRIPTION'); ?>
                    </span>
                </label>
                <label>
                    <i class="zmdi zmdi-link add-link"></i>
                    <span class="ba-tooltip ba-bottom">
                        <?php echo JText::_('INSERT_LINK'); ?>
                    </span>
                </label>
                <label>
                    <i class="zmdi zmdi-code add-embed-code"></i>
                    <span class="ba-tooltip ba-bottom">
                        <?php echo JText::_('EMBED_CODE'); ?>
                    </span>
                </label>
                <label>
                    <i class="zmdi zmdi-delete delete-item"></i>
                </label>
            </div>
            <div id="category-options" class="category-options" style="display: none;">
                <div class="img-thumbnail">
                    <div class="camera-container">
                        <i class="zmdi zmdi-camera"></i>
                    </div>
                </div>
                <div class="options">
                    <lable class="option-label"><?php echo JText::_('TITLE') ?></lable>
                    <div>
                        <input id="category-name" type="text">
                        <span class="focus-underline"></span>
                    </div>                    
                    <lable class="option-label">
                        <?php echo JText::_('ALIAS') ?>
                    </lable>
                    <div>
                        <input type="text" class="category-alias">
                        <span class="focus-underline"></span>
                    </div>
                    <div class="checkbox-parent">
                        <div>
                            <label class="ba-checkbox">
                                <input type="checkbox" class="default-category">
                                <span></span>
                            </label>
                            <lable class="option-label"><?php echo JText::_('DEFAULT_CATEGORY') ?></lable>
                        </div>
                        <div>
                            <label class="ba-checkbox">
                                <input type="checkbox" class="unpublish-category">
                                <span></span>
                            </label>                            
                            <lable class="option-label"><?php echo JText::_('UNPUBLISH') ?></lable> 
                        </div>                                               
                    </div>
                </div>                
            </div>
            <div class="images-options" style="display: none;">
                <div class="img-thumbnail">
                    <div class="camera-container">
                        <i class="zmdi zmdi-camera"></i>
                    </div>
                </div>
                <div class="options">
                    <lable class="option-label">
                        <?php echo JText::_('TITLE') ?>
                    </lable>
                    <div>
                        <input type="text" class="image-title">
                        <span class="focus-underline"></span>
                    </div>                    
                    <lable class="option-label">
                        <?php echo JText::_('ALIAS') ?>
                    </lable>
                    <div>
                        <input type="text" class="image-alias">
                        <span class="focus-underline"></span>
                    </div>                    
                    <lable class="option-label">
                        <?php echo JText::_('SHORT_DESCRIPTION') ?>
                    </lable>
                    <div>
                        <input type="text" class="image-short">
                        <span class="focus-underline"></span>
                    </div>                    
                    <lable class="option-label">
                        <?php echo JText::_('IMAGE_ALT') ?>
                    </lable>
                    <div>
                        <input type="text" class="image-alt">
                        <span class="focus-underline"></span>
                    </div>   
                    <div class="checkbox-parent">
                        <div>
                            <label class="ba-checkbox">
                                <input type="checkbox" class="hide-in-category-all">
                                <span></span>
                            </label>                            
                            <lable class="option-label"><?php echo JText::_('HIDE_IN_CATEGORY_ALL') ?></lable> 
                        </div>                                               
                    </div>                 
                </div>                
            </div>
            <img src="<?php echo jUri::root().'administrator/components/com_bagallery/assets/images/gallery-logo.svg' ?>">
        </div>
    </div>    
    <div class="ba-context-menu empty-context-menu" style="display: none">
        <span class="upload-images disabled-item"><i class="zmdi zmdi-camera"></i><?php echo JText::_('ADD_IMAGE'); ?></span>
        <span class="create-categery"><i class="zmdi zmdi-folder"></i><?php echo JText::_('CREATE_CATEGORY'); ?></span>
    </div>
    <div class="ba-context-menu files-context-menu" style="display: none">
        <span class="move-to"><i class="zmdi zmdi-forward"></i><?php echo JText::_('MOVE_TO'); ?>...</span>
        <span class="upload-images ba-group-element"><i class="zmdi zmdi-cloud-upload"></i><?php echo JText::_('ADD_IMAGE'); ?></span>
        <span class="create-categery"><i class="zmdi zmdi-folder"></i><?php echo JText::_('CREATE_CATEGORY'); ?></span>
        <span class="delete ba-group-element"><i class="zmdi zmdi-delete"></i><?php echo JText::_('DELETE'); ?></span>
    </div>
    <div class="ba-context-menu folders-context-menu" style="display: none">
        <span class="rename"><i class="zmdi zmdi-edit"></i><?php echo JText::_('RENAME'); ?></span>
        <span class="move-to"><i class="zmdi zmdi-forward"></i><?php echo JText::_('MOVE_TO'); ?>...</span>
        <span class="delete ba-group-element"><i class="zmdi zmdi-delete"></i><?php echo JText::_('DELETE'); ?></span>
    </div>
    <div class="ba-context-menu help-context-menu" style="display: none">
        <span class="quick-view"><i class="zmdi zmdi-graduation-cap"></i><?php echo JText::_('QUICK_VIEW'); ?></span>
        <span class="documentation">
            <a target="_blank" href="http://www.balbooa.com/joomla-gallery-documentation/basics">
                <i class="zmdi zmdi-info"></i><?php echo JText::_('DOCUMENTATION'); ?>
            </a>
        </span>
        <span class="support">
            <a target="_blank" href="http://support.balbooa.com/forum/joomla-gallery">
                <i class="zmdi zmdi-help"></i><?php echo JText::_('SUPPORT'); ?>
            </a>
        </span>
        <span class="love-gallery ba-group-element">
            <i class="zmdi zmdi-favorite"></i><?php echo JText::_('LOVE_GALLERY'); ?>
        </span>
    </div>
    <input type="hidden" name="task" value="forms.edit" />
    <?php echo JHtml::_('form.token'); ?>
</form>
<?php
defined('_JEXEC') or die;

// Add JavaScript Frameworks
JHtml::_('bootstrap.framework');

// Load optional rtl Bootstrap css and Bootstrap bugfixes
JHtmlBootstrap::loadCss($includeMaincss = true);
?>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jdoc:include type="head" />
	<!--[if lt IE 9]>
		<script src="<?php echo $this->baseurl ?>/media/jui/js/html5.js"></script>
	<![endif]-->
<link href='http://fonts.googleapis.com/css?family=Ubuntu' rel='stylesheet' type='text/css'>
<link href="templates/template/css/custom.css" rel="stylesheet" type="text/css">
</head>

<body>
<header class="row-fluid">
	<!--/*<div class="span4">
    	<a href="/joomla_new"><img src="templates/template/images/pic-5.jpg" alt="NKU.CC.BigData.lab, click for home. " class="pull-left" /></a>
    </div>*/-->
    <HR style="border:1 dashed #987cb9" width="80%" color=#987cb9 SIZE=1>
    <div class="span12" >
    <h1 id="lab_name">南开大学大数据研究院</h1>
    </div>
</header>
<div class="row-fluid">
  <nav class="span12 navbar">
    <div class="navbar-inner">
      <div class="container-fluid"> 
		<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> 
			<span class="icon-bar"></span> 
			<span class="icon-bar"></span> 
			<span class="icon-bar"></span> 
		</a>
        <div class="nav-collapse collapse">
          <jdoc:include type="modules" name="nav" style="none" />
        </div>
      </div>
    </div>
  </nav>
</div>
<div class="row-fluid">
	<div class="span12">
    	<jdoc:include type="modules" name="breadcrumbs" style="html5" />
    </div>
</div>

<div class="row-fluid">
<?php if ($this->countModules('right')): ?>
	  <div class="span9">
    <?php else : ?>
      <div class="span12">
    <?php endif; ?>
        <jdoc:include type="message" />
        <jdoc:include type="component" />
    </div>
    <?php if ($this->countModules('right')): ?>
    <div class="span3">
    	<jdoc:include type="modules" name="right" style="html5" />
    </div>
    <?php endif; ?>
</div>
<footer class="row-fluid" >
	<div class="span3" id="footer1">
    	<p>&copy; 2012 KinetECO, Inc. All rights reserved.</p>
        <jdoc:include type="modules" name="footer" style="html5" />
    </div>
    <div class="span3" id="footer2">
        <jdoc:include type="modules" name="footer2" style="html5" />
    </div>
    <div class="span3" id="footer3">
        <jdoc:include type="modules" name="footer3" style="html5" />
    </div>
    <div class="span3" id = "footer-logo"><img src="templates/template/images/footerlogo.png" alt="KinetECO, Inc." class="pull-right" /></div>
</footer>









</div>


</body>
</html>

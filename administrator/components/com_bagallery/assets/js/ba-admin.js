/**
* @package   BaGallery
* @author    Balbooa http://www.balbooa.com/
* @copyright Copyright @ Balbooa
* @license   http://www.gnu.org/licenses/gpl.html GNU/GPL
*/
(function($){
    $(window).on('load', function(){
    	if ($('#jform_id').val()) {
    		$.ajax({
	            type : "POST",
	            dataType : 'text',
	            url : "index.php?option=com_bagallery&task=gallery.checkProductTour&tmpl=component",
	            success : function(msg){
	                if (msg == 'false') {
	                    $('.quick-view').trigger('mousedown');
	                }
	            }
	        });
            $.ajax({
                type : "POST",
                dataType : 'text',
                url : "index.php?option=com_bagallery&task=gallery.checkRate&tmpl=component",
                success : function(msg){
                    if (msg == 'true') {
                        $('#love-gallery-modal').modal();
                    }
                }
            });
    	}        
    })
    $(document).ready(function(){

        setTimeout(function(){
            $('.alert.alert-success').addClass('animation-out');
        }, 2000);

        setInterval(function(){
            $.ajax({
                type : "POST",
                dataType : 'text',
                url : "index.php?option=com_bagallery&task=gallery.getSession&tmpl=component",
                success : function(msg){
                }
            });
        }, 600000);

        Joomla.submitbutton = function(task) {
            if (task == "gallery.cancel" || document.formvalidator.isValid(document.getElementById("adminForm")))
            {
                Joomla.submitbutton = function(task) {
                    return false;
                }
                if (task != "gallery.cancel") {
                    $('ul.root-list input.cat-options').each(function(){
                        var $this = $(this),
                            obj = {},
                            li = $this.closest('li');
                        obj.parent = '';
                        if (!$this.closest('ul').hasClass('root-list')) {
                            obj.parent = li.parent().closest('li').attr('id');
                        }
                        obj.settings = $this.val();
                        obj.id = li.attr('data-id');
                        $this.val(JSON.stringify(obj))
                    });
                    var items = new Array(),
                        array = new Array(),
                        sort = new Array(),
                        flag = false,
                        watermarkNames = new Array(),
                        thumbnailArray = {},
                        id = $('#jform_id').val(),
                        allThumb = new Array(),
                        allCat = new Array();
                    if (width != $('#jform_image_width').val()
                        || quality != $('#jform_image_quality').val() ||
                        layout != $('#jform_gallery_layout').val()) {
                        flag = true;
                    }
                    $('.category-list li').each(function(){
                        var key = $(this).attr('id');
                        if (catImages[key]) {
                            catImages[key].forEach(function(el, ind){
                                if (flag) {
                                    el.thumbnail_url = '';
                                }
                                if ($.inArray(el.category, allCat) == -1) {
                                    allCat.push(el.category);
                                }
                                if (el.thumbnail_url) {
                                    var thumb = el.thumbnail_url.split('/');
                                    if (!thumbnailArray[el.category]) {
                                        thumbnailArray[el.category] = new Array();
                                    }
                                    thumbnailArray[el.category].push(thumb[thumb.length - 1]);
                                }
                                if (el.watermark_name) {
                                    watermarkNames.push(el.watermark_name);
                                }
                                array.push(el);
                                sort.push(el.imageId);
                            });
                        }
                    });
                    allThumb = JSON.stringify(thumbnailArray);
                    if (flag) {
                        $.ajax({
                            type : "POST",
                            dataType : 'text',
                            url : "index.php?option=com_bagallery&task=gallery.emptyThumbnails&tmpl=component",
                            data : {
                                ba_id : id
                            }
                        });
                    }
                    if (watermark) {
                        $.ajax({
                            type : "POST",
                            dataType : 'text',
                            url : "index.php?option=com_bagallery&task=gallery.removeWatermark&tmpl=component",
                            data : {
                                ba_id : id
                            }
                        });
                    }
                    sort = sort.join('-_-');
                    jQuery('#jform_settings').val(sort);
                    $('#jform_gallery_items').val('');
                    $('#jform_all_sorting').val('');
                    array.forEach(function(el){
                        var name;
                        if (el.id) {
                            items.push(el.id);
                        }
                        if (!el.thumbnail_url) {
                            name = checkName(thumbnailArray[el.category], el.name);
                            if (!thumbnailArray[el.category]) {
                                thumbnailArray[el.category] = new Array();
                            }
                            thumbnailArray[el.category].push(name);
                            el.thumbnail_url = '/images/bagallery/gallery-'+id+'/thumbnail/'+el.category+'/'+name;
                        }
                        if (!el.watermark_name) {
                            name = checkName(watermarkNames, el.name);
                            el.watermark_name = el.name;
                            watermarkNames.push(el.watermark_name);
                        }
                    });
                    var upload = jQuery('#saving-media').val(),
                        str = '';
                    upload = JSON.parse(upload);
                    str += upload.const+'<img src="'+upload.url;
                    str += 'administrator/components/com_bagallery/assets/images/reload.svg"></img>';
                    notification.className = 'notification-in';
                    notification.children[0].innerHTML = str;
                    $('<div/>', {
                        'class' : 'saving-backdrop'
                    }).appendTo('body');
                    clearTimeout(animationOut);
                    saveData(array, allThumb, allCat, id, task, items)
                } else {
                    Joomla.submitform(task, document.getElementById("adminForm"));
                }
            }
        }

        function saveData(array, allThumb, allCat, id, task, items)
        {
            var length = array.length,
                max = length > 50 ? 50 : length;
            if (length > 0) {
                var imgArray = new Array(),
                    medium = new Array();
                imgArray = array.splice(0, max);
                for (var i = 0; i < max; i++) {
                    if (imgArray[i].resave == 1) {
                        medium.push(imgArray[i]);
                    }
                }
                if (medium.length == 0) {
                    saveData(array, allThumb, allCat, id, task, items);
                    return false;
                }
                imgArray = JSON.stringify(medium);
                $.ajax({
                    type : "POST",
                    dataType : 'text',
                    url : "index.php?option=com_bagallery&task=gallery.saveItems&tmpl=component",
                    data : {
                        gallery_items : imgArray,
                        ba_id : id
                    },
                    success: function(msg) {
                        msg = JSON.parse(msg);
                        msg = JSON.parse(msg.message);
                        for (var i = 0; i < msg.length; i++) {
                            items.push(msg[i]);
                        }
                        saveData(array, allThumb, allCat, id, task, items);
                    }
                });
            } else {
                items = JSON.stringify(items);
                allCat = JSON.stringify(allCat);
                $.ajax({
                    type : "POST",
                    dataType : 'text',
                    url : "index.php?option=com_bagallery&task=gallery.clearOld&tmpl=component",
                    data : {
                        'gallery_items' : items,
                        'allThumb' : allThumb,
                        'allCat' : allCat,
                        ba_id : id
                    }
                });
                Joomla.submitform(task, document.getElementById("adminForm"));
            }
        }

        function checkName(array, name)
        {
            if ($.inArray(name, array) > -1) {
                name = getRandomInt(0, 999999999)+'-'+name;
                name = checkName(array, name);
            }

            return name;
        }

        function getRandomInt(min, max) {
            return Math.floor(Math.random() * (max - min)) + min;
        }

        function sendData(obj)
        {
            jQuery.ajax({
                type : "POST",
                dataType : 'text',
                url : "index.php?option=com_bagallery&task=gallery.saveItems&tmpl=component",
                data : {
                    gallery_items : array,
                    settings : $('#jform_settings').val(),
                    all_sorting : $('#jform_all_sorting').val(),
                    ba_id : $('#jform_id').val()
                }
            });
        }

        $('#create-gallery-modal input.gallery-name').on('input', function(){
            var name = $(this).val();
            if ($.trim(name)) {
                $('#create-gallery').addClass('active-button');
            } else {
                $('#create-gallery').removeClass('active-button');
            }            
        });

        $('#create-gallery').on('click', function(event){
            event.preventDefault();
            if ($(this).hasClass('active-button')) {
                var name = $('#create-gallery-modal input.gallery-name').val();
                $('#jform_title').val(name);
                $('#create-gallery-modal').removeClass('in').addClass('hide');
                Joomla.submitbutton('gallery.apply');
            }
        });

        var categoryId = 1,
            watermark  = false,
            animationOut,
            CKE = CKEDITOR.replace('CKE-editor'),
            deleteMode,
            pagLimit = 25,
            width = $('#jform_image_width').val(),
            quality = $('#jform_image_quality').val(),
            layout = $('#jform_gallery_layout').val(),
            imageId = 1,
            images = $('#jform_gallery_items').val(),
            categories = $('#jform_gallery_category').val(),
            catImages = new Array(),
            target = $('.category-list ul.root-list'),
            str = '',
            settings,
            subColor,
            currentCat,
            currentItem,
            uploadMode = false,
            albumMode = true,
            uri = $('#juri-root').val(),
            notification = document.getElementById('ba-notification'),
            currentContext,
            contextMode = false,
            oldName = '',
            showUrl = uri+'administrator/index.php?option=com_bagallery&layout=uploader&task=uploader.showImage&image=',
            allImages = new Array(),
            clientHeight = document.documentElement.clientHeight,
            UpType = $('#select-upload-type');

        catImages['root'] = new Array();

        if (categories) {
            target = target.empty();
            categories = JSON.parse(categories);
            categories.forEach(function(el, ind){
                el.settings = el.settings.split(';');
                str = '<li class="ba-category';
                if (el.settings[2] == 0) {
                    str += ' ba-unpublish'
                }
                str += '" id="';
                if (el.settings[3]) {
                    str += 'category-all';
                } else {
                    str += 'category-'+el.settings[4];
                }
                str += '" data-id="';
                str += el.id+'"><a><label><i class="zmdi zmdi-folder">';
                str += '</i></label><span>';
                str += el.settings[0]+'</span><input type="hidden" class="cat-options"';
                str += ' name="cat-options[]" value="">';
                if (el.settings[1] == 1) {
                    str += '<i class="zmdi zmdi-star"></i>';
                }
                str += '</a></li>';
                if (!el.settings[3]) {
                    if (el.settings[4] >= categoryId) {
                        categoryId = el.settings[4];
                        categoryId++;
                    }
                    catImages['category-'+el.settings[4]] = new Array();
                }
                if (!el.parent) {
                    target.append(str);
                } else {
                    if ($('#'+el.parent).find('> ul').length == 0) {
                        $('#'+el.parent).append('<i class="zmdi zmdi-chevron-right"></i><ul></ul>');
                    }
                    $('#'+el.parent).find('> ul').append(str)
                }                
                target.find('.cat-options').last().val(el.settings.join(';'));
            });
        	images = JSON.parse(images);
            if (images.length > 0) {
            	var newArrayI = new Array(),
	                sort = $('#jform_settings').val();
	            sort = sort.split('-_-');
	            images.forEach(function(el, ind){
	                var settings = JSON.parse(el.settings);
	                if (catImages[settings.category]) {
	                    settings.resave = 0;
	                    newArrayI[settings.imageId] = settings;
	                    if (imageId <= settings.imageId) {
	                        imageId = settings.imageId;
	                        imageId++;
	                    }
	                }
	            });
	            sort.forEach(function(set) {
	                var settings = newArrayI[set];
	                catImages[settings.category].push(settings)
	            });
            }
        }

        $('#jform_album_mode').on('click', function(){
            checkAlbum();
        });
        checkAlbum();
        checkComments();

        function checkComments()
        {
            var comments = $('#jform_enable_disqus').val(),
                vk = $('.vk-options'),
                disqus = $('.disqus-options');
            if (comments == 1) {
                disqus.show();
                vk.hide()
            } else if (comments == 'vkontakte') {
                disqus.hide();
                vk.show()
            } else {
                disqus.hide();
                vk.hide()
            }
        }

        function rgba2hex(rgb)
        {
            var parts = rgb.toLowerCase().match(/^rgba?\((\d+),\s*(\d+),\s*(\d+)(?:,\s*(\d+(?:\.\d+)?))?\)$/),
                hex = '#',
                part,
                color = new Array();
            if (parts) {
                for ( var i = 1; i <= 3; i++ ) {
                    part = parseInt(parts[i]).toString(16);
                    if (part.length < 2) {
                        part = '0'+part;
                    }
                    hex += part;
                }
                color.push(hex);
                color.push(parts[4]);
                
                return color;
            } else {
                color.push(rgb);
                color.push(1);
                
                return color;
            }
        }

        checkPageRefresh();
        $('#jform_page_refresh').on('click', function(){
            checkPageRefresh();
        })

        function checkPageRefresh()
        {
            var pagT = $('#jform_pagination_type'),
                value = pagT.val(),
                pagType = pagT.prev(),
                def = pagType.find('li[data-value="default"]').text();
            if ($('#jform_page_refresh').prop('checked')) {
                pagType.find('li[data-value="infinity"]').hide();
                pagType.find('li[data-value="load"]').hide();
                if (value == 'infinity' || value == 'load') {
                    pagT.val('default');
                    pagType.find('.ba-form-trigger').attr('data-value', 'default').val($.trim(def));
                }
            } else {
                pagType.find('li[data-value="infinity"]').show();
                pagType.find('li[data-value="load"]').show();
            }
        }

        function checkAlbum()
        {
            if ($('#jform_album_mode').prop('checked')) {
                albumMode = true;
                $('body').addClass('album-mode');
                $('a[href="#filter-options"]').hide();
                $('input.default-category').closest('div').hide();
                $('input.hide-in-category-all').closest('div').hide();
                $('.folders-context-menu .move-to, #move-to-modal li[data-id="root"] > span').show();
                $('#category-options div.img-thumbnail').show();
            } else {
                albumMode = false;
                $('body').removeClass('album-mode');
                $('a[href="#filter-options"]').show();
                $('input.default-category').closest('div').show();
                $('input.hide-in-category-all').closest('div').show();
                $('.folders-context-menu .move-to, #move-to-modal li[data-id="root"] > span').hide();
                $('#category-options div.img-thumbnail').hide();
                $('#root .root-list li').each(function(){
                    var $this = $(this),
                        ul = $this.parent();
                    if (!ul.hasClass('root-list')) {
                        $('#root .root-list').append(this);
                    }
                });
                $('#root .root-list ul, #root .root-list i.zmdi-chevron-right').remove();
                catImages['root'] = new Array();
            }
            if (currentCat == 'root') {
                $('#root > a').trigger('click');
            }
        }



        function getAllImages()
        {
            allImages = new Array();
            jQuery('table.ba-items-table img').each(function(){
                var src = jQuery(this).attr('data-src');
                this.onload = function(){
                    jQuery(this).closest('td').addClass('loaded');
                }
                var obj = {
                    el : this,
                    img : src
                }
                allImages.push(obj)                    
            });
            jQuery('div.table-body').on('scroll',function(){
                checkImages()
                if (allImages.length == 0) {
                    jQuery(this).off('scroll')
                }
            });
            checkImages();
        }

        function checkImages()
        {
            var newArray = new Array();
            clientHeight = document.documentElement.clientHeight
            allImages.forEach(function(el, ind){
                if (jQuery(el.el).offset().top < clientHeight * 2) {
                    el.el.src = el.img;
                } else {
                    newArray.push(el)
                }
            });
            allImages = newArray
        }

        function getFileSize(size)
        {
            size = size / 1024;
            size = Math.floor(size);
            if (size >= 1024) {
                size = size / 1024;
                size = Math.floor(size);
                size = size+' MB';
            } else {
                size = size+' KB';
            }

            return size;
        }

        function saveImg(obj)
        {
            obj = JSON.stringify(obj);
            var item = currentItem.find('.select-item');
            item.val(obj);
            item = item.attr('data-index');
            catImages[currentCat][item] = JSON.parse(obj);
        }

        function checkAutoResize()
        {
            if ($('#jform_auto_resize').prop('checked')) {
                $('.lightbox-width').hide();
            } else {
                $('.lightbox-width').show();
            }
        }

        function checkHeader()
        {
            var childrens = $('#lightbox-header-options').children();
            if ($("#jform_display_header").prop('checked')) {
                childrens.show();
            } else {
                childrens.hide();
                childrens.first().show();
            }
        }

        function strip_tags(str)
        {
            return str.replace(/<\/?[^>]+>/gi, '');
        }

        function checkDefault()
        {
            var options = $('#category-all > a .cat-options').val().split(';');
            options[1] = 1;
            $('#category-all .cat-options').val(options.join(';'));
            $('#category-all > a').append('<i class="zmdi zmdi-star"></i>');
        }

        function addRangeWidth(input)
        {
            var max = input.attr('max') * 1,
                value = input.val(),
                sx = ((value * 100) / max) * input.width() / 100;
            input.prev().width(sx);
        }

        function checkLightbox()
        {
            if ($('#enable-lightbox').prop('checked')) {
                $('a[href="#lightbox-header-options"]').parent().show();
                $('a[href="#lightbox-navigation-options"]').parent().show();
                $('a[href="#copyright-watermark-options"]').parent().show();
                $('a[href="#lightbox-comments-options"]').parent().show();
                $('#lightbox-general-options > .ba-options-group').show();
            } else {
                $('a[href="#lightbox-header-options"]').parent().hide();
                $('a[href="#lightbox-navigation-options"]').parent().hide();
                $('a[href="#copyright-watermark-options"]').parent().hide();
                $('a[href="#lightbox-comments-options"]').parent().hide();
                $('#lightbox-general-options > .ba-options-group').hide();
                $('#lightbox-general-options > .ba-options-group').first().show();
            }
        }

        function listenMessage(event)
        {
            if (event.origin == location.origin) {
                $('#uploader-modal').modal('hide');
                if (uploadMode == 'images') {
                    for (var i = 0; i < event.data.length; i++) {
                        var obj = event.data[i],
                        tbody = $('table.ba-items-table tbody');
                        obj.category = currentCat;
                        obj.imageId = imageId;
                        obj.resave = 1;
                        obj.time = +new Date();
                        obj.target = 'blank';
                        catImages[currentCat].push(obj);
                        imageId++;
                        if (tbody.find('tr').length < pagLimit) {
                            var ind = catImages[currentCat].length - 1
                            str = '<tr class="ba-images"><td class="select-td"><label ';
                            str += 'class="ba-image">';
                            str += '<input class="select-item" data-index="';
                            str += ind+'" type="checkbox" value="';
                            str += '"><i class="zmdi zmdi-circle-o"></i><i class="zmdi ';
                            str += 'zmdi-check"></i></label><img data-src="'+showUrl+obj.path+'"></td>';
                            str += '<td class="draggable-handler">';
                            str += obj.name+'</td><td class="draggable-handler">';
                            str += getFileSize(obj.size)+'</td></tr>';
                            tbody.append(str);
                            tbody.find('.select-item').last().val(JSON.stringify(obj));
                        }
                    }
                    drawPaginator();
                    getAllImages();
                    showNotice($('#upload-const').val());
                } else if (uploadMode == 'reselectImage') {
                    obj = currentItem.find('.select-item').val();
                    obj = JSON.parse(obj);
                    obj.name = event.data.name;
                    obj.path = event.data.path;
                    obj.size = event.data.size;
                    obj.thumbnail_url = '';
                    obj.url = event.data.url;
                    currentItem.find('img')[0].src = obj.url;
                    currentItem.find('td').last().text(getFileSize(obj.size));
                    currentItem.find('.select-td').next().text(obj.name);
                    obj.url = obj.url.replace(new RegExp(' ', 'g'), '%20');
                    $('div.images-options div.img-thumbnail').css('background-image', 'url('+obj.url+')');
                    saveImg(obj);
                } else if (uploadMode == 'album') {
                    settings = currentItem.find('> a .cat-options').val().split(';');
                    settings[5] = event.data.path;
                    $('#category-options div.img-thumbnail img').remove();
                    event.data.url = event.data.url.replace(new RegExp(' ', 'g'), '%20');
                    $('#category-options div.img-thumbnail').css('background-image', 'url('+event.data.url+')');
                    currentItem.find('> a .cat-options').val(settings.join(';'));
                } else if (uploadMode == 'watermark') {
                    $('#jform_watermark_upload').val(event.data.path);
                    watermark = true;
                }
            }            
        }

        function sortName(obj1, obj2)
        {
            if(obj1.name > obj2.name) {
                return 1;
            }
            if(obj1.name < obj2.name) {
                return -1;
            }
            else {
                return 0;
            }
        }

        function showNotice(message)
        {
            if (notification.className == 'notification-in') {
                setTimeout(function(){
                    notification.className = 'animation-out';
                    setTimeout(function(){
                        addNoticeText(message);
                    }, 400);
                }, 2000);
            } else {
                addNoticeText(message);
            }
        }

        function checkFilter()
        {
            var childrens = $('#filter-options').children();
            if ($('#jform_category_list').prop('checked')) {
                childrens.show();
            } else {
                childrens.not(childrens[0]).hide();
            }
        }

        function checkPaginator()
        {
            if ($('#jform_pagination').prop('checked')) {
                $('#pagination-options').children().show();
            } else {
                $('#pagination-options').children().hide();
                $('#pagination-options').children().first().show();
            }
        }

        function addNoticeText(message)
        {
            notification.children[0].innerText = message;
            notification.className = 'notification-in';
            animationOut = setTimeout(function(){
                notification.className = 'animation-out';
            }, 3000);
        }

        function drawPaginator()
        {
            $('div.table-body').find('.pagination').remove();
            if (catImages[currentCat].length > pagLimit && pagLimit != 1) {
                var pages = Math.ceil(catImages[currentCat].length / pagLimit),
                    div = document.createElement('div'),
                    ul = document.createElement('ul'),
                    li = document.createElement('li'),
                    a = document.createElement('a'),
                    span = document.createElement('span');
                div.className = 'pagination';
                ul.className = 'pagination-list';
                li.className = 'disabled ba-first-page';
                span.className = 'icon-first';
                div.appendChild(ul);
                ul = appendItems(ul, li, a, span);
                li = document.createElement('li')
                li.className = 'disabled ba-prev';
                a = document.createElement('a');
                span = document.createElement('span');
                span.className = 'icon-previous';
                ul = appendItems(ul, li, a, span);
                for (var i = 0; i < pages; i++) {
                    li = document.createElement('li');
                    li.className = 'ba-pages';
                    if (i == 0) {
                        li.className += ' active';
                    }
                    a = document.createElement('a');
                    span = document.createTextNode(i + 1);
                    $(a).attr('data-page', i);
                    ul = appendItems(ul, li, a, span);
                }
                li = document.createElement('li');
                a = document.createElement('a');
                li.className = 'ba-next';
                span = document.createElement('span');
                span.className = 'icon-next';
                $(a).attr('data-page', 1);
                ul = appendItems(ul, li, a, span);
                li = document.createElement('li');
                a = document.createElement('a');
                li.className = 'ba-last-page';
                span = document.createElement('span');
                span.className = 'icon-next';
                $(a).attr('data-page', pages - 1);
                ul = appendItems(ul, li, a, span);
                $(ul).find('a').on('click', function(event){
                    event.preventDefault();
                    var $this = $(this);
                    if ($this.parent().hasClass('active') || $this.parent().hasClass('disabled')) {
                        return false;
                    }
                    var page = $this.attr('data-page') * 1,
                        ul = $this.closest('ul'),
                        first = ul.find('li').first(),
                        last = ul.find('li').last(),
                        max = page*pagLimit + pagLimit,
                        tbody = $('table.ba-items-table tbody').empty();
                    ul.find('li.active').removeClass('active');
                    first.removeClass('disabled');
                    first.find('a').attr('data-page', 0);
                    first.next().removeClass('disabled').find('a').attr('data-page', page - 1);
                    last.removeClass('disabled');
                    last.find('a').attr('data-page', pages - 1);
                    last.prev().removeClass('disabled').find('a').attr('data-page', page + 1);
                    ul.find('.ba-pages [data-page="'+page+'"]').parent().addClass('active');
                    if (page == 0) {
                        first.addClass('disabled');
                        first.find('a').removeAttr('data-page');
                        first.next().addClass('disabled').find('a').removeAttr('data-page');
                    }
                    if (page == pages - 1) {
                        last.addClass('disabled');
                        last.find('a').removeAttr('data-page');
                        last.prev().addClass('disabled').find('a').removeAttr('data-page');
                    }
                    if (catImages[currentCat].length < max) {
                        max = catImages[currentCat].length;                        
                    }
                    for (var i = page * pagLimit; i < max; i++) {
                        str = '<tr class="ba-images"><td class="select-td"><label ';
                        str += 'class="ba-image">';
                        str += '<input data-index="'+i;
                        str += '" class="select-item" type="checkbox" value="';
                        str += '"><i class="zmdi zmdi-circle-o"></i><i class="zmdi';
                        str += ' zmdi-check"></i></label><img data-src="'+showUrl+catImages[currentCat][i].path;
                        str += '"></td><td class="draggable-handler">';
                        str += catImages[currentCat][i].name+'</td><td class="draggable-handler">';
                        str += getFileSize(catImages[currentCat][i].size)+'</td></tr>';
                        tbody.append(str);
                        tbody.find('.select-item').last().val(JSON.stringify(catImages[currentCat][i]))
                    }
                    checkPagination();
                    getAllImages();
                });
                $('div.table-body').append(div);
                checkPagination();
            }
        }

        function checkPagination()
        {
            var paginator = $('.pagination-list'),
                current,
                curInd = 0,
                pagButtons = paginator.find('li').not('.ba-first-page, .ba-last-page, .ba-prev, .ba-next');
            if (pagButtons.length >= 5) {
                pagButtons.each(function(ind, el){
                    if (jQuery(this).hasClass('active')) {
                        current = jQuery(this);
                        curInd = ind;
                        return false;
                    }
                });
                if (curInd <= 2) {
                    pagButtons.each(function(ind, el){
                        if (ind < 5) {
                            jQuery(this).show();
                        } else {
                            jQuery(this).hide();
                        }
                    });
                } else if (curInd + 1 > pagButtons.length - 3) {
                    for (var i = pagButtons.length - 1; i >= 0; i--) {
                        if (i >= pagButtons.length - 5) {
                            jQuery(pagButtons[i]).show();
                        } else {
                            jQuery(pagButtons[i]).hide();
                        }
                    }
                } else {
                    pagButtons.hide();
                    current.show().prev().show().prev().show();
                    current.next().show().next().show();
                }
            }
        }

        function appendItems(ul, li, a, span)
        {
            a.appendChild(span);
            li.appendChild(a);
            ul.appendChild(li);

            return ul;
        }
        
        function sortDate(obj1, obj2)
        {
            return obj1.time - obj2.time;
        }

        function checkContext(context, deltaY, deltaX)
        {
            if (deltaX - context.width() < 0) {
                context.addClass('ba-left');
            } else {
                context.removeClass('ba-left');
            }
            if (deltaY - context.height() < 0) {
                context.addClass('ba-top');
            } else {
                context.removeClass('ba-top');
            }
        }

        function checkCaptionOptions()
        {
            if (!$('#jform_disable_caption').prop('checked')) {
                $('a[href="#thumbnail-typography-options"]').parent().show();
                $('.caption-group').show();
                if ($('#jform_thumbnail_layout').val() == '11') {
                    $('#jform_caption_bg').closest('.ba-options-group').hide();
                }
            } else {
                $('a[href="#thumbnail-typography-options"]').parent().hide();
                $('.caption-group').hide();
            }
        }

        function reIndexArray()
        {
            if (currentCat) {
                var array = new Array();
                catImages[currentCat].forEach(function(el, ind){
                    array.push(el);
                });
                catImages[currentCat] = array;
            }
        }

        function checkRandomGrid()
        {
            var value =  $('#jform_gallery_layout').val(),
                thumb = $('#jform_thumbnail_layout'),
                effect = thumb.prev();
            if (value == 'random') {
                effect.find('li[data-value="10"]').show();
            } else {
                effect.find('li[data-value="10"]').hide();
                if (thumb.val() == '10') {
                    thumb.val(10);
                    var name = $.trim(effect.find('li').first().text());
                    effect.find('input').attr('data-value', 1).val(name)
                }
            }
        }

        function checkEffect()
        {
            var value =  $('#jform_thumbnail_layout').val();
            if (value == '11') {
                $('#jform_caption_bg').closest('.ba-options-group').hide();
                $('#title_color, #category_color, #description_color').closest('.ba-group-element').hide();
            } else {
                $('#jform_caption_bg').closest('.ba-options-group').show();
                $('#title_color, #category_color, #description_color').closest('.ba-group-element').show();
            }
        }

        if ($('html').attr('dir') == 'rtl') {
        	CKEDITOR.config.contentsLangDirection = 'rtl';
        }
        CKE.setUiColor('#fafafa');
        CKE.config.allowedContent = true;
        CKEDITOR.dtd.$removeEmpty.span = 0;
        CKEDITOR.dtd.$removeEmpty.i = 0;
        CKE.config.toolbar_Basic =
        [
            { name: 'document',    items : [ 'Source' ] },
            { name: 'styles',      items : [ 'Styles','Format' ] },
            { name: 'colors',      items : [ 'TextColor' ] },
            { name: 'clipboard',   items : [ 'Undo','Redo' ] },            
            { name: 'basicstyles', items : [ 'Bold','Italic','Underline'] },
            { name: 'paragraph',   items : [ 'NumberedList','BulletedList','-','Outdent',
                                            'Indent','-','Blockquote','-','JustifyLeft',
                                            'JustifyCenter','JustifyRight','JustifyBlock','-' ] },
            { name: 'links',       items : [ 'Link','Unlink','Anchor' ] },
            { name: 'insert',      items : [ 'Image','Table','HorizontalRule'] }
        ];
        CKE.config.toolbar = 'Basic';

        $('.modal').on('hide', function(){
            $(this).addClass('ba-modal-close');
            setTimeout(function(){
                $('.ba-modal-close').removeClass('ba-modal-close');
            }, 500)
        });

        $('#uploader-modal').on('show', function(){
            window.addEventListener("message", listenMessage, false);
        });
        
        $('#uploader-modal').on('hide', function(){
            window.removeEventListener("message", listenMessage, false);
        });

        $('i.check-all').on('click', function(){
            $('#check-all').trigger('click');
        });

        $('i.sort-action').closest('.ba-custom-select').on('show', function(){
            var sort = $('#jform_random_sorting').val();
            $('i.sort-action+ul li').each(function(){
                var $this = $(this).removeClass('selected');
                $this.find('i.zmdi-check').remove();
                if ($this.attr('data-value') == sort) {
                    $this.addClass('selected').prepend('<i class="zmdi zmdi-check"></i>');
                }
            });
        });

        $('label.ba-help').on('click', function(event){
            var coor = this.getBoundingClientRect();
            $('div.help-context-menu').css({
                'top' : coor.bottom,
                'left' : coor.right,
            }).show();
        })

        $('.gallery-editor .category-list, .gallery-editor .images-list').on('contextmenu', function(event){
            event.preventDefault();
        });

        $('div.category-list, div.table-body').on('contextmenu', function(event){
            $('.context-active').removeClass('context-active');
            var deltaX = document.documentElement.clientWidth - event.pageX,
                deltaY = document.documentElement.clientHeight - event.clientY,
                context;
            setTimeout(function(){
                context = $('.empty-context-menu');
                context.css({
                    'top' : event.pageY,
                    'left' : event.pageX,
                }).show();
                checkContext(context, deltaY, deltaX);
            }, 50);
        });

        jQuery('.new-name').on('input', function(){
            var name = jQuery(this).val();
            if (jQuery.trim(name) && name != oldName) {
                jQuery('#apply-rename').addClass('active-button');
            } else {
                jQuery('#apply-rename').removeClass('active-button');
            }
        });

        jQuery('#apply-rename').on('click', function(event){
            event.preventDefault();
            if (!$(this).hasClass('active-button')) {
                return false;
            }
            var name = $.trim($('.new-name').val()),
                id = currentContext.closest('li').attr('id');
            name = name.replace(new RegExp(';', 'g'), '');
            $('tr[data-id="'+id+'"] td.draggable-handler a').text(name)
            settings = currentContext.find('.cat-options').val().split(';');
            settings[0] = name;
            currentContext.find('.cat-options').val(settings.join(';'));
            currentContext.find('span').text(name);
            if (currentItem && currentItem[0].id == currentContext.parent()[0].id) {
                $('#category-name').val(name);
            }            
            jQuery('#rename-modal').modal('hide');
        });

        $('.ba-context-menu .documentation, .ba-context-menu .support').on('mousedown', function(event){
            if (event.button > 1) {
                return false;
            }
            event.stopPropagation();
            setTimeout(function(){
                $('div.help-context-menu').hide();
            }, 150);
        });

        $('.ba-context-menu .love-gallery').on('mousedown', function(event){
            if (event.button > 1) {
                return false;
            }
            $('#love-gallery-modal').modal();
        });

        $('.ba-context-menu .quick-view').on('mousedown', function(event){
            if (event.button > 1) {
                return false;
            }
            event.stopPropagation();
            var sBackdrop = $('<div/>', {
                'class' : 'saving-backdrop'
            });
            document.getElementsByTagName('body')[0].appendChild(sBackdrop[0]);
            $('.product-tour.step-1').addClass('visible');
            $('.category-list .create-categery').addClass('active-product-tour');
        });

        $('.product-tour.step-1 .next').on('click', function(){
            $('.product-tour.step-1').removeClass('visible');
            $('.category-list .create-categery').removeClass('active-product-tour');
            $('.product-tour.step-2').addClass('visible');
            $('.images-list .camera-container').addClass('active-product-tour');
        });

        $('.product-tour.step-2 .next').on('click', function(){
            $('.product-tour.step-2').removeClass('visible');
            $('.images-list .camera-container').removeClass('active-product-tour');
            $('.product-tour.step-3').addClass('visible');
            $('.ba-toolbar-icons .settings').addClass('active-product-tour');
        });

        $('.product-tour.step-3 .close').on('click', function(){
            $('.product-tour.step-3').removeClass('visible');
            $('.ba-toolbar-icons .settings').removeClass('active-product-tour');
            var sBackdrop = document.getElementsByClassName('saving-backdrop')[0];
            sBackdrop.className += ' animation-out';
            setTimeout(function(){
                document.getElementsByTagName('body')[0].removeChild(sBackdrop);
            }, 300);
        });

        $('.product-tour .zmdi.zmdi-close').on('click', function(){
            $('.product-tour.step-1').removeClass('visible');
            $('.category-list .create-categery').removeClass('active-product-tour');
            $('.product-tour.step-2').removeClass('visible');
            $('.images-list .camera-container').removeClass('active-product-tour');
            $('.product-tour.step-3').removeClass('visible');
            $('.ba-toolbar-icons .settings').removeClass('active-product-tour');
            var sBackdrop = document.getElementsByClassName('saving-backdrop')[0];
            sBackdrop.className += ' animation-out';
            setTimeout(function(){
                document.getElementsByTagName('body')[0].removeChild(sBackdrop);
            }, 300);
        });

        $('.ba-context-menu .rename').on('mousedown', function(event){
            if (event.button > 1) {
                return false;
            }
            var name = '';
            name = currentContext.find('span').text();
            name = $.trim(name);
            oldName = name;
            $('.new-name').val(name);
            $('#apply-rename').removeClass('active-button');
            $('#rename-modal').modal();
        });

        $('table.ba-items-list, ul.root-list').on('contextmenu', 'tr, a', function(event){
            event.stopPropagation();
            event.preventDefault();
            $('.context-active').removeClass('context-active');
            $(this).addClass('context-active');
            var deltaX = document.documentElement.clientWidth - event.pageX,
                deltaY = document.documentElement.clientHeight - event.clientY,
                context;
            currentContext = $(this);
            if ($(this).hasClass('ba-images')) {
                setTimeout(function(){
                    context = $('.files-context-menu');
                    context.css({
                        'top' : event.pageY,
                        'left' : event.pageX,
                    }).show();
                    checkContext(context, deltaY, deltaX);
                }, 50);
            } else {
                if (currentContext[0].localName == 'tr') {
                    var id = currentContext.attr('data-id');
                    currentContext = $('#'+id+' > a');
                }
                setTimeout(function(){
                    context = $('.folders-context-menu');
                    context.css({
                        'top' : event.pageY,
                        'left' : event.pageX,
                    }).show();
                    checkContext(context, deltaY, deltaX);
                }, 50);
            }
        });

        $('i.sort-action+ul li').on('click', function(){
            var value = $(this).attr('data-value');
            if (value != 'random') {
                for(key in catImages) {
                    if (typeOf(catImages[key]) == 'array') {
                        if (value == 'name') {
                            catImages[key].sort(sortName);
                        }
                        if (value == 'newest') {
                            catImages[key].sort(sortDate);
                            catImages[key].reverse();
                        }
                        if (value == 'oldest') {
                            catImages[key].sort(sortDate);
                        }
                    }
                }
                if (currentCat) {
                    var tbody = $('table.ba-items-table tbody').empty();
                    catImages[currentCat].forEach(function(el, ind){
                        str = '<tr class="ba-images"><td class="select-td"><label ';
                        str += 'class="ba-image">';
                        str += '<input data-index="'+ind;
                        str += '" class="select-item" type="checkbox" value="';
                        str += '"><i class="zmdi zmdi-circle-o"></i><i class="zmdi';
                        str += ' zmdi-check"></i></label><img data-src="'+showUrl+el.path;
                        str += '"></td><td class="draggable-handler">';
                        str += el.name+'</td><td class="draggable-handler">';
                        str += getFileSize(el.size)+'</td></tr>';
                        tbody.append(str);
                        tbody.find('.select-item').last().val(JSON.stringify(el))
                    });
                    getAllImages();
                }
            }
            $('#jform_random_sorting').val(value);
        });

        $('#check-all').on('click', function(){
            if ($(this).prop('checked')) {
                $('tr input[type="checkbox"]').each(function(){
                    $(this).attr('checked', true);
                    $('i.move-to, i.delete-selected').removeClass('disabled-item');
                });
            } else {
                $('tr input[type="checkbox"]').each(function(){
                    $(this).removeAttr('checked');
                    $('i.move-to, i.delete-selected').addClass('disabled-item');
                });
            }
        });

        $('table.ba-items-list ').on('change', 'input[type="checkbox"]', function(){
            if ($(this).prop('checked')) {
                $('i.move-to, i.delete-selected').removeClass('disabled-item');
            } else {
                var flag = true;
                $('tr input[type="checkbox"]').each(function(){
                    if ($(this).prop('checked')) {
                        flag = false;
                    }
                });
                if (flag) {
                    $('i.move-to, i.delete-selected').addClass('disabled-item');
                }
            }
        });

        $('i.move-to').on('click', function(){
            if ($(this).hasClass('disabled-item')) {
                return false;
            }
            contextMode = false;
            $('#move-to-modal .availible-folders .active').removeClass('active');
            $('#move-to-modal .active-button').removeClass('active-button');
            $('#move-to-modal').modal();
        });

        $('#move-to-modal .availible-folders').on('click', 'li', function(event){
            event.stopPropagation();
            $('#move-to-modal .availible-folders .active').removeClass('active');
            $(this).addClass('active');
            $('.apply-move').addClass('active-button');
        });

        $('#move-to-modal').on('hide', function(){
            $('#move-to-modal .availible-folders > ul > li > ul').remove();
        });

        $('#move-to-modal').on('show', function(){
            $('#move-to-modal .availible-folders > ul > li > ul').remove();
            var ul = $('div.category-list ul.root-list').clone(),
                li,
                text;
            ul.find('.active').removeClass('active');
            ul.find('li').each(function(){
                li = $(this);
                var span = document.createElement('span'),
                    i = document.createElement('i');
                i.className = 'zmdi zmdi-folder';
                text = li.find('> a').text();
                text = $.trim(text),
                text = document.createTextNode(text);
                span.appendChild(i);
                span.appendChild(text);
                li.find('> a').remove();
                if (li.attr('id') == 'category-all') {
                    li.hide();
                }
                li.attr('data-id', li.attr('id')).removeAttr('id').removeClass('ba-category').prepend(span);
            })
            $('#move-to-modal .availible-folders > ul > li').append(ul);
            ul.find('i.zmdi-chevron-right').on('click', function(){
                if ($(this).parent().hasClass('visible-branch')) {
                    $(this).parent().removeClass('visible-branch');
                } else {
                    $(this).parent().addClass('visible-branch');
                }
            });
        });

        $('.apply-move').on('click', function(event){
            event.preventDefault();
            var path = $('#move-to-modal .availible-folders .active').attr('data-id');
            if (!path) {
                return false;
            }
            if (currentCat != path)  {
                if (!contextMode) {
                    $('table.ba-items-table input.select-item').each(function(){
                        var $this = $(this),
                            ind,
                            obj;
                        if ($this.prop('checked')) {
                            ind = $this.attr('data-index');
                            obj = catImages[currentCat][ind];
                            obj.resave = 1;
                            obj.category = path;
                            delete(catImages[currentCat][ind]);
                            catImages[path].push(obj);
                            $this.closest('tr').remove();
                        }
                    });
                    $('table.ba-category-table input[type="checkbox"]').each(function(){
                        var $this = $(this),
                            id = $this.closest('tr').attr('data-id'),
                            parent;
                        if ($this.prop('checked')) {
                            if (id != path) {
                                if ($('#'+path).find('> ul').length == 0) {
                                    $('#'+path).append('<i class="zmdi zmdi-chevron-right"></i><ul></ul>');
                                }
                                parent = $('#'+id).parent();
                                $('#'+path+'> ul').append($('#'+id));
                                $this.closest('tr').remove();
                                if (parent.find('li').length == 0) {
                                    parent.parent().find('i.zmdi-chevron-right').remove();
                                    parent.remove();
                                }
                            }
                        }
                    });
                } else {
                    if (currentContext.hasClass('ba-images')) {
                        var ind = currentContext.find('input.select-item').attr('data-index'),
                            obj = catImages[currentCat][ind];
                        delete(catImages[currentCat][ind]);
                        obj.category = path;
                        obj.resave = 1;
                        catImages[path].push(obj);
                        currentContext.remove();
                    } else {
                        var id = currentContext.closest('li').attr('id'),
                            parent = $('#'+id).parent();
                        if (id != path) {
                            if ($('#'+path).find('> ul').length == 0) {
                                $('#'+path).append('<i class="zmdi zmdi-chevron-right"></i><ul></ul>');
                            }
                            $('#'+path+'> ul').append($('#'+id));
                            $('tr[data-id="'+id+'"]').remove();
                            if (parent.find('li').length == 0) {
                                parent.parent().find('i.zmdi-chevron-right').remove();
                                parent.remove();
                            }
                        }
                    }
                }
            }
            reIndexArray();
            $('#'+currentCat).find('> a').trigger('click');
            showNotice($('#move-to-const').val());
            $('#move-to-modal').modal('hide');
        });

        $('div.ba-context-menu span.move-to').on('mousedown', function(event){
            if (event.button > 1) {
                return false;
            }
            contextMode = true;
            $('#move-to-modal .availible-folders .active').removeClass('active');
            $('#move-to-modal .active-button').removeClass('active-button');
            $('#move-to-modal').modal();
        });

        function UploadType(client)
        {
            setTimeout(function(){
                if (UpType.hasClass('visible-upload-type')) {
                    UpType.addClass('upload-type-out');
                    setTimeout(function(){
                        UpType.removeClass('upload-type-out visible-upload-type');
                        showType(client);
                    }, 300);
                } else {
                    showType(client);
                }
            }, 100);
        }

        function showType(client)
        {
            $('#select-upload-type').css({
                top : client.top,
                left : client.left,
            }).addClass('visible-upload-type');
        }

        $(document).on('mousedown', function(){
            if (UpType.hasClass('visible-upload-type')) {
                UpType.addClass('upload-type-out');
                setTimeout(function(){
                    UpType.removeClass('upload-type-out visible-upload-type');
                }, 300);
            }
        });

        $('.ba-context-menu .upload-images').on('mousedown', function(event){
            if (event.button > 1) {
                return false;
            }
            if (currentCat && !$(this).hasClass('disabled-item')) {
                uploadMode = 'images';
                $('#uploader-modal').attr('data-check', '').modal();
            }
        });

        $('.camera-container .upload-images').on('mousedown', function(event){
            if (event.button > 1 || $(this).parent().hasClass('active-product-tour')) {
                return false;
            }
            if (currentCat && !$(this).hasClass('disabled-item')) {
                uploadMode = 'images';
                var client = this.getBoundingClientRect();
                $('#uploader-modal').attr('data-check', '');
                UpType.find('input[type="file"]').attr('multiple', true);
                UploadType(client);
            }
        });

        $('.upload-type.folder').on('click', function(){
            $('#uploader-modal').modal();
            $('.upload-type').trigger('mouseleave');
        });

        $('.upload-type.desktop').on('mousedown', function(){
            setTimeout(function(){
            	$('#select-upload-type input[type="file"]').trigger('click');
        	}, 300);
            $('.upload-type').trigger('mouseleave');
        });

        jQuery('#select-upload-type input[type="file"]').on('change', function(event){
            if (this.files.length > 0) {
                var files = new Array(),
                    sBackdrop = jQuery('<div/>', {
                        'class' : 'saving-backdrop'
                    });
                for (var i = 0; i < this.files.length; i++) {
                    files.push(this.files[i]);
                }
                document.getElementsByTagName('body')[0].appendChild(sBackdrop[0]);
                UploadFiles(files);
            }
        });

        function UploadFiles(files)
        {
            if (files.length > 0) {
                var upload = jQuery('#saving-media').val(),
                    str = '',
                    file = files.pop(),
                    XHR = new XMLHttpRequest(),
                    url = "administrator/index.php?option=com_bagallery&task=gallery.uploadAjax&file="+file.name;
                if (XHR.upload && file.size <= 66000000) {
                    upload = JSON.parse(upload);
                    url = upload.url+url;
                    str += upload.uploading+'<img src="'+upload.url;
                    str += 'administrator/components/com_bagallery/assets/images/reload.svg"></img>';
                    if (notification.children[0].innerHTML != str) {
                        notification.children[0].innerHTML = str;
                        notification.className = 'notification-in';
                    }
                    XHR.onreadystatechange = function(e) {
                        if (XHR.readyState == 4) {
                            if (XHR.responseText) {
                                var obj = JSON.parse(XHR.responseText);
                                if (uploadMode == 'images') {
                                    var tbody = $('table.ba-items-table tbody'),
                                        str = '<tr class="ba-images"><td class="select-td"><label ',
                                        img = new Image(),
                                        canvas = document.createElement('canvas'),
                                        ratio = 1;
                                    obj.category = currentCat;
                                    obj.imageId = imageId;
                                    obj.resave = 1;
                                    obj.time = +new Date();
                                    obj.target = 'blank';
                                    catImages[currentCat].push(obj);
                                    imageId++;
                                    if (tbody.find('tr').length < pagLimit) {
                                        var ind = catImages[currentCat].length - 1
                                        str += 'class="ba-image">';
                                        str += '<input class="select-item" data-index="';
                                        str += ind+'" type="checkbox" value="';
                                        str += '"><i class="zmdi zmdi-circle-o"></i><i class="zmdi ';
                                        str += 'zmdi-check"></i></label><img data-src="'+showUrl+obj.path+'"></td>';
                                        str += '<td class="draggable-handler">';
                                        str += obj.name+'</td><td class="draggable-handler">';
                                        str += getFileSize(obj.size)+'</td></tr>';
                                        tbody.append(str);
                                        tbody.find('.select-item').last().val(JSON.stringify(obj));
                                    }
                                    drawPaginator();
                                    getAllImages();
                                } else if (uploadMode == 'reselectImage') {
                                    var data = currentItem.find('.select-item').val();
                                    data = JSON.parse(data);
                                    data.name = obj.name;
                                    data.path = obj.path;
                                    data.size = obj.size;
                                    data.thumbnail_url = '';
                                    data.url = obj.url;
                                    currentItem.find('img')[0].src = obj.url;
                                    currentItem.find('td').last().text(getFileSize(obj.size));
                                    currentItem.find('.select-td').next().text(obj.name);
                                    obj.url = obj.url.replace(new RegExp(' ', 'g'), '%20');
                                    $('div.images-options div.img-thumbnail').css('background-image', 'url('+obj.url+')');
                                    saveImg(data);
                                } else if (uploadMode == 'album') {
                                    settings = currentItem.find('> a .cat-options').val().split(';');
                                    settings[5] = obj.path;
                                    $('#category-options div.img-thumbnail img').remove();
                                    obj.url = obj.url.replace(new RegExp(' ', 'g'), '%20');
                                    $('#category-options div.img-thumbnail').css('background-image', 'url('+obj.url+')');
                                    currentItem.find('> a .cat-options').val(settings.join(';'));
                                } else if (uploadMode == 'watermark') {
                                    $('#jform_watermark_upload').val(obj.path);
                                    watermark = true;
                                }
                            }
                            UploadFiles(files);
                        }
                    };
                    XHR.open("POST", url, true);
                    XHR.send(file);
                } else {
                    showNotice(jQuery('#post-max-error').val());
                    UploadFiles(files);
                }
            } else {
                var sBackdrop = document.getElementsByClassName('saving-backdrop')[0];
                sBackdrop.className += ' animation-out';
                setTimeout(function(){
                    document.getElementsByTagName('body')[0].removeChild(sBackdrop);
                }, 300);
                showNotice($('#upload-const').val());
            }
        }

        $('body').on('mousedown', function(){
            $('.context-active').removeClass('context-active');
            $('.ba-context-menu').hide();
        });

        $('.ba-custom-select > i, div.ba-custom-select input').on('click', function(event){
            event.stopPropagation()
            var $this = $(this),
                parent = $this.parent();
            parent.find('ul').addClass('visible-select');
            parent.find('li').one('click', function(){
                var text = $(this).text(),
                    val = $(this).attr('data-value');
                parent.find('input').val(text).attr('data-value', val);
                parent.trigger('customHide');
            });
            parent.trigger('show');
            setTimeout(function(){
                $('body').one('click', function(){
                    $('.visible-select').removeClass('visible-select');
                });
            }, 50);
        });

        $('.create-categery').on('mousedown', function(event){
            if (event.button > 1 || $(this).hasClass('active-product-tour')) {
                return false;
            }
            event.preventDefault();
            $('input.category-name').val('');
            $('#create-new-category').removeClass('active-button');
            $('#create-category-modal').modal();
        });

        $('#create-new-category').on('click', function(event){
            event.preventDefault();
            if ($(this).hasClass('active-button')) {
                var catName = $('input.category-name').val();
                str = '<li class="ba-category';
                str += '" id="';
                str += 'category-'+categoryId;
                str += '" data-id="';
                str += '0"><a><label><i class="zmdi zmdi-folder"></i>';
                str += '</label><span>';
                str += catName+'</span><input type="hidden" class="cat-options"';
                str += ' name="cat-options[]" value="'+catName+';0;1;;'+categoryId+'">';
                str += '</a></li>';
                catImages['category-'+categoryId] = new Array();
                if (!albumMode || currentCat == 'root' || !currentCat) {
                    target.append(str);
                } else {
                    if ($('#'+currentCat).find('> ul').length == 0) {
                        $('#'+currentCat).append('<i class="zmdi zmdi-chevron-right"></i><ul></ul>');
                    }
                    $('#'+currentCat).find('> ul').append(str);
                }
                if ((albumMode && currentCat) || currentCat == 'root') {
                    str = '<tr data-id="category-'+categoryId+'"><td class="select-td">';
                    str += '<input type="checkbox"><div class="folder-icons">';
                    str += '<a class="zmdi zmdi-folder"></a><i class="zmdi zmdi-circle';
                    str += '-o"></i><i class="zmdi zmdi-check"></i></div></td>';
                    str += '<td class="draggable-handler"><a>';
                    str += catName+'</a></td><td class="draggable-handler"></td></tr>';
                    $('table.ba-category-table tbody').append(str);
                }
                $('#category-'+categoryId+' > a').trigger('click');
                categoryId++;
                showNotice($('#category-const').val());
                $('#create-category-modal').modal('hide');
            }
        });

        $('input.category-name').on('input', function(){
            if ($.trim($(this).val())) {
                $('#create-new-category').addClass('active-button');
            } else {
                $('#create-new-category').removeClass('active-button');
            }
        });

        $('label.settings').on('click', function(){
            if (!$(this).hasClass('active-product-tour')) {
                $('#global-options').modal()
            }
        });

        target.on('click', 'i.zmdi-chevron-right', function(){
            if ($(this).closest('li').hasClass('visible-branch')) {
                $(this).closest('li').removeClass('visible-branch');
            } else {
                $(this).closest('li').addClass('visible-branch');
            }
        });

        $('li.root > a').on('click', function(){
            $('#check-all').removeAttr('checked');
            $('div.gallery-options > div').hide();
            $('').hide();
            target.find('.active').removeClass('active');
            $(this).closest('li').addClass('active');
            var tbody = $('table.ba-items-table tbody').empty();
            $('table.ba-category-table tbody').empty();
            $('div.gallery-options > img').show();
            if (!albumMode) {
                $('.upload-images').addClass('disabled-item').parent().addClass('disabled-item');
            } else {
                $('.upload-images').removeClass('disabled-item').parent().removeClass('disabled-item');
            }
            currentCat = 'root';
            $('li.root > ul > li').each(function(){
                var $this = $(this),
                    flag = $('#jform_album_mode').prop('checked');
                if ((flag && $this.attr('id') != 'category-all') || !flag) {
                    str = '<tr data-id="'+$this.attr('id')+'"><td class="select-td">';
                    str += '<input type="checkbox"><div class="folder-icons">';
                    str += '<a class="zmdi zmdi-folder"></a><i class="zmdi zmdi-circle';
                    str += '-o"></i><i class="zmdi zmdi-check"></i></div></td>';
                    str += '<td class="draggable-handler"><a>';
                    str += $this.find('> a span').text();
                    str += '</a></td><td class="draggable-handler"></td></tr>';
                    $('table.ba-category-table tbody').append(str);
                }
            });
            catImages['root'].forEach(function(el, ind){
                str = '<tr class="ba-images"><td class="select-td"><label ';
                str += 'class="ba-image">';
                str += '<input data-index="'+ind;
                str += '" class="select-item" type="checkbox" value="';
                str += '"><i class="zmdi zmdi-circle-o"></i><i class="zmdi';
                str += ' zmdi-check"></i></label><img data-src="'+showUrl+el.path;
                str += '"></td><td class="draggable-handler">';
                str += el.name+'</td><td class="draggable-handler">';
                str += getFileSize(el.size)+'</td></tr>';
                tbody.append(str);
                tbody.find('.select-item').last().val(JSON.stringify(el))
            });
            drawPaginator();
            getAllImages();
        });

        $('table.ba-category-table').on('click', 'div.folder-icons', function(){
            var checkbox = $(this).closest('td.select-td').find('input[type="checkbox"]');
            if (checkbox.prop('checked')) {
                checkbox.removeAttr('checked');
                var flag = true;
                $('tr input[type="checkbox"]').each(function(){
                    if ($(this).prop('checked')) {
                        flag = false;
                    }
                });
                if (flag) {
                    $('i.move-to, i.delete-selected').addClass('disabled-item');
                }
            } else {
                checkbox.attr('checked', true);
                $('i.move-to, i.delete-selected').removeClass('disabled-item');
            }
        });

        $('table.ba-category-table').on('click', 'a', function(event){
            event.preventDefault();
            var id = $(this).closest('tr').attr('data-id');
            $('#'+id+'> a').trigger('click');
        });

        target.on('click', 'a', function(event){
            event.stopPropagation();
            var id = $(this).closest('li').attr('id'),
                tbody = $('table.ba-items-table tbody').empty(),
                catTable = $('table.ba-category-table tbody').empty(),
                parent = $(this).closest('li').parent();
            if (!parent.hasClass('root-list')) {
                parent.parentsUntil('ul.root-list').each(function(){
                    $(this).addClass('visible-branch');
                })
            }
            $('#check-all').removeAttr('checked');
            $('i.move-to, i.delete-selected').addClass('disabled-item');
            $('div.category-list li.active').removeClass('active');
            $(this).closest('li').addClass('active');
            currentItem = $(this).closest('li');
            settings = currentItem.find('.cat-options').val().split(';');
            $('#category-options div.img-thumbnail').hide();
            if (id != 'category-all') {
                if (albumMode) {
                    $('#category-options div.img-thumbnail').show();
                }
                if (!settings[5]) {
                    settings[5] = uri+'administrator/components/com_bagallery/assets/images/gallery-logo-category.svg';
                    $('#category-options div.img-thumbnail').css('background-image', '');
                    $('#category-options div.img-thumbnail img').remove();
                    $('#category-options div.img-thumbnail').append('<img src="'+settings[5]+'">');
                } else {
                    var pos = settings[5].indexOf('/images/');
                    settings[5] = uri+settings[5].substr(pos+1);
                    $('#category-options div.img-thumbnail img').remove();
                    settings[5] = settings[5].replace(new RegExp(' ', 'g'), '%20');
                    $('#category-options div.img-thumbnail').css('background-image', 'url('+settings[5]+')');
                }                
            }
            $('div.gallery-options > img').hide();
            $('i.add-link').parent().hide();
            $('i.add-embed-code').parent().hide();
            $('#category-name').val(settings[0]);
            if (settings[8]) {
                $('input.category-alias').val(settings[8]);
            } else {
                $('input.category-alias').val(settings[0].toLowerCase().replace(new RegExp(" ", 'g'), '-'));
            }
            $('#category-options, div.gallery-options div.gallery-header').show();
            $('div.images-options').hide();
            if (settings[1] == 1) {
                $('.default-category').attr('checked', true);
            } else {
                $('.default-category').removeAttr('checked');
            }
            if (settings[2] == '0') {
                $('.unpublish-category').attr('checked', true);
            } else {
                $('.unpublish-category').removeAttr('checked');
            }
            if (id != 'category-all') {
                currentCat = id;
                catImages[id].forEach(function(el, ind){
                    if (ind >= pagLimit && pagLimit != 1) {
                        return false;
                    }
                    str = '<tr class="ba-images"><td class="select-td"><label ';
                    str += 'class="ba-image">';
                    str += '<input data-index="'+ind;
                    str += '" class="select-item" type="checkbox" value="';
                    str += '"><i class="zmdi zmdi-circle-o"></i><i class="zmdi';
                    str += ' zmdi-check"></i></label><img data-src="'+showUrl+el.path;
                    str += '"></td><td class="draggable-handler">';
                    str += el.name+'</td><td class="draggable-handler">';
                    str += getFileSize(el.size)+'</td></tr>';
                    tbody.append(str);
                    tbody.find('.select-item').last().val(JSON.stringify(el))
                });
                drawPaginator();
                getAllImages();
                $(this).closest('li').find('> ul > li').each(function(){
                    var $this = $(this);
                    str = '<tr data-id="'+$this.attr('id')+'"><td class="select-td">';
                    str += '<input type="checkbox"><div class="folder-icons">';
                    str += '<a class="zmdi zmdi-folder"></a><i class="zmdi zmdi-circle';
                    str += '-o"></i><i class="zmdi zmdi-check"></i></div></td>';
                    str += '<td class="draggable-handler"><a>';
                    str += $this.find('> a span').text();
                    str += '</a></td><td class="draggable-handler"></td></tr>';
                    catTable.append(str);
                });
            } else {
                currentCat = '';
                $('div.table-body div.pagination').remove();
            }
            if (currentCat) {
                $('.upload-images').removeClass('disabled-item').parent().removeClass('disabled-item');
            } else {
                $('.upload-images').addClass('disabled-item').parent().addClass('disabled-item');
            }
        });

        $('div.images-options div.img-thumbnail .camera-container').on('click', function(){
            var client = $(this).find('i')[0].getBoundingClientRect();
            UpType.find('input[type="file"]').removeAttr('multiple');
            UploadType(client);
            $('#uploader-modal').attr('data-check', 'single');
            uploadMode = 'reselectImage';
        });

        $('#category-options div.img-thumbnail .camera-container').on('click', function(){
            var client = $(this).find('i')[0].getBoundingClientRect();
            UpType.find('input[type="file"]').removeAttr('multiple');
            UploadType(client);
            $('#uploader-modal').attr('data-check', 'single');
            uploadMode = 'album';
        });

        $('#category-name').on('input', function(){
            var name = $.trim($(this).val());
            settings = currentItem.find('.cat-options').val().split(';');
            name = name.replace(new RegExp(';', 'g'), '');
            settings[0] = name;
            currentItem.find('> a .cat-options').val(settings.join(';'));
            currentItem.find('> a span').text(name);
        });

        $('.category-alias').on('input', function(){
            var name = $(this).val();
            settings = currentItem.find('.cat-options').val().split(';');
            name = name.replace(new RegExp(";",'g'), '');
            name = name.toLowerCase().replace(new RegExp(" ", 'g'), '-');
            settings[8] = name;
            currentItem.find('> a .cat-options').val(settings.join(';'));
        });

        $('.default-category').on('change', function(){
            settings = currentItem.find('.cat-options').val().split(';');
            if (!$(this).prop('checked')) {
            	var options = $('#category-all').find('.cat-options').val().split(';');
	            if (options[2] == 0) {
	                $(this).attr('checked', true);
	                $('#message-dialog').modal();
	                $('#message-dialog .cannot-unpublish').show();
	                $('#message-dialog .cannot-default').hide();
	                $(this).attr('checked', true);
	                return false;
	            }
            }
            if (!$(this).prop('checked') && settings[3] == '*') {
                $(this).attr('checked', true);
                return false;
            }
            if (settings[2] != 0 && currentItem.closest('li.ba-unpublish').length == 0) {
                $('.cat-options').each(function(){
                    var option = $(this).val();
                    option = option.split(';');
                    option[1] = 0;
                    $(this).parent().find('> .zmdi-star').remove();
                    option = option.join(';');
                    $(this).val(option);
                });
                if (settings[1] == 1) {
                    settings[1] = 0;
                    currentItem.find('> a > .zmdi-star').remove();
                    checkDefault();
                } else {
                    settings[1] = 1;
                    currentItem.find('> a').append('<i class="zmdi zmdi-star"></i>');
                }
                currentItem.find('> a .cat-options').val(settings.join(';'));
            } else {
                $(this).removeAttr('checked');
                $('#message-dialog').modal();
                $('#message-dialog .cannot-unpublish').hide();
                $('#message-dialog .cannot-default').show();
            }
        });
        
        $('.unpublish-category').on('click', function(){
            settings = currentItem.find('.cat-options').val().split(';');
            if (settings[1] != 1 && currentItem.find('.zmdi.zmdi-star').length == 0) {
                if (settings[2] == 1) {
                    settings[2] = 0;
                    currentItem.addClass('ba-unpublish');
                } else {
                    settings[2] = 1;
                    currentItem.removeClass('ba-unpublish');
                }
                currentItem.find('> a .cat-options').val(settings.join(';'));
            } else {
                $(this).removeAttr('checked');
                $('#message-dialog').modal();
                $('#message-dialog .cannot-unpublish').show();
                $('#message-dialog .cannot-default').hide();
            }
        });

        $('#general-tabs ul.uploader-nav').on('show', function(event){
            var ind = new Array(),
                id = $(event.relatedTarget).attr('href'),
                aId = $(event.target).attr('href');
            $('#general-tabs ul li a').each(function(i){
                if (this == event.target) {
                    ind[0] = i;
                }
                if (this == event.relatedTarget) {
                    ind[1] = i;
                }
            });
            if (ind[0] > ind[1]) {
                $(id).addClass('out-left');
                $(aId).addClass('right');
                setTimeout(function(){
                    $(id).removeClass('out-left');
                    $(aId).removeClass('right');
                }, 500);
            } else {
                $(id).addClass('out-right');
                $(aId).addClass('left');
                setTimeout(function(){
                    $(id).removeClass('out-right');
                    $(aId).removeClass('left');
                }, 500);
            }
            var coord = event.target.getBoundingClientRect();
            $('#general-tabs div.tabs-underline').css({
                'left' : coord.left,
                'right' : document.documentElement.clientWidth - coord.right,
            });
        });

        $('#global-options').one('shown', function(){
            var coord = $('#general-tabs ul li.active a')[0].getBoundingClientRect();
            $('#general-tabs div.tabs-underline').css({
                'left' : coord.left,
                'right' : document.documentElement.clientWidth - coord.right,
            });
        });

        $('input.link-target+i+ul li').on('click', function(){
            $('input.link-target+i+ul li.selected').removeClass('selected');
            $('input.link-target+i+ul i.zmdi-check').remove();
            $(this).addClass('selected').prepend('<i class="zmdi zmdi-check"></i>');
        });

        $('i.add-link').on('click', function(){
            var obj = currentItem.find('.select-item').val();
            obj = JSON.parse(obj);
            $('input.image-link').val(obj.link);
            $('input.link-target').parent().find('ul li').each(function(){
                var $this = $(this);
                if ($this.attr('data-value') == obj.target) {
                    $('input.link-target').attr('data-value', $this.attr('data-value')).val($this.text());
                    return false;
                }
            });
            $('input.link-target+i+ul li').each(function(){
                var $this = $(this).removeClass('selected');
                $this.find('i.zmdi-check').remove();
                if ($this.attr('data-value') == obj.target) {
                    $this.addClass('selected').prepend('<i class="zmdi zmdi-check"></i>');
                }
            });
            $('#add-link').removeClass('active-button');
            $('#add-link-modal').modal();
        });

        $('input.image-link').on('input', function(){
            if ($.trim($(this).val())) {
                $('#add-link').addClass('active-button');
            } else {
                $('#add-link').removeClass('active-button');
            }
        });

        $('.link-target').parent().on('customHide', function(){
            if ($.trim($('input.image-link').val())) {
                $('#add-link').addClass('active-button');
            } else {
                $('#add-link').removeClass('active-button');
            }
        });

        $('#add-link').on('click', function(event){
            event.preventDefault();
            if (!$(this).hasClass('active-button')) {
                return false;
            }
            var obj = currentItem.find('.select-item').val();
            obj = JSON.parse(obj);
            obj.link = $('input.image-link').val();
            obj.target = $('input.link-target').attr('data-value');
            obj.resave = 1;
            saveImg(obj);
            $('#add-link-modal').modal('hide');
        });

        $('i.add-embed-code').on('click', function(){
            var obj = currentItem.find('.select-item').val();
            obj = JSON.parse(obj);
            $('.ba-embed').val(obj.video)
            $('#embed-modal').modal();
        });
        
        $('#embed-apply').on('click', function(){
            var value = $('.ba-embed').val(),
                obj = currentItem.find('.select-item').val();
            obj = JSON.parse(obj);
            obj.video = value;
            obj.resave = 1;
            saveImg(obj);
            $('#embed-modal').modal('hide');
        });

        $('i.edit-description').on('click', function(){
            if (currentItem.hasClass('ba-category')) {
                settings = currentItem.find('.cat-options').val().split(';');
                if (settings[7]) {
                    settings[7] = settings[7].replace(new RegExp("-_-", 'g'), ';');
                }
                CKE.setData(settings[7]);
            } else {
                var obj = currentItem.find('.select-item').val();
                obj = JSON.parse(obj);
                CKE.setData(obj.description);
            }
            $('#html-editor').modal();
        });

        $('i.delete-selected').on('click', function(){
            deleteMode = 'array';
            contextMode = false;
            var flag = false;
            $('table.ba-items-list input[type="checkbox"]').each(function(){
                if ($(this).prop('checked')) {
                    flag = true;
                    return false;
                }
            });
            if (flag) {
                if ($('table.ba-category-table [data-id="category-all"] input[type="checkbox"]').prop('checked')) {
                    $('.cannot-delete').show();
                    $('.can-delete, #delete-dialog h3').hide();
                    $('#apply-delete').addClass('disabled-button');
                } else {
                    $('table.ba-category-table tr input[type="checkbox"]').each(function(){
                        var $this = $(this),
                            id = $this.closest('tr').attr('data-id'),
                            parent;
                        if ($this.prop('checked')) {
                            settings = $('#'+id).find('.cat-options').val().split(';');
                            if (settings[1] == 1) {
                                flag = false;
                                return false;
                            }
                        }
                    });
                    if (!flag) {
                        $('#deafult-message-dialog').modal();
                        return false;
                    }
                    $('.cannot-delete').hide();
                    $('.can-delete, #delete-dialog h3').show();
                    $('#apply-delete').removeClass('disabled-button');
                }
                $('#delete-dialog').modal();
            }
        });

        $('i.delete-item').on('click', function(){
            deleteMode = 'single';
            contextMode = false;
            if (currentItem.attr('id') == 'category-all') {
                $('.cannot-delete').show();
                $('.can-delete, #delete-dialog h3').hide();
                $('#apply-delete').addClass('disabled-button');
            } else {
                if (currentItem.hasClass('ba-category')) {
                    settings = currentItem.find('.cat-options').val().split(';');
                    if (settings[1] == 1) {
                        $('#deafult-message-dialog').modal();
                        return false;
                    }
                }
                $('.cannot-delete').hide();
                $('.can-delete, #delete-dialog h3').show();
                $('#apply-delete').removeClass('disabled-button');
            }
            $('#delete-dialog').modal();
        });

        $('div.ba-context-menu span.delete').on('mousedown', function(event){
            if (event.button > 1) {
                return false;
            }
            contextMode = true;
            if (currentContext.closest('li').attr('id') == 'category-all') {
                $('.cannot-delete').show();
                $('.can-delete, #delete-dialog h3').hide();
                $('#apply-delete').addClass('disabled-button');
            } else {
                if (currentContext.closest('li').hasClass('ba-category')) {
                    settings = currentContext.closest('li').find('.cat-options').val().split(';');
                    if (settings[1] == 1) {
                        $('#deafult-message-dialog').modal();
                        $('div.ba-context-menu').hide();
                        return false;
                    }
                }                
                $('.cannot-delete').hide();
                $('.can-delete, #delete-dialog h3').show();
                $('#apply-delete').removeClass('disabled-button');
            }
            $('#delete-dialog').modal();
        });

        $('#apply-delete').on('click', function(event){
            event.preventDefault();
            if ($(this).hasClass('disabled-button')) {
                return false;
            }
            if (!contextMode) {
                if (deleteMode == 'single') {
                    if (currentItem.hasClass('ba-category')) {
                        delete(catImages[currentCat]);
                        $('table.ba-items-table tbody').empty();
                        $('.upload-images').addClass('disabled-item').parent().addClass('disabled-item');
                    } else {
                        var ind = currentItem.find('.select-item').attr('data-index');
                        delete(catImages[currentCat][ind]);
                    }
                    var parent = currentItem.parent();
                    currentItem.remove();
                    if (parent[0].localName == 'ul') {
                        if (parent.find('> li').length == 0) {
                            parent = parent.parent();
                            parent.find('i.zmdi-chevron-right').remove();
                            parent.find('> ul').remove();
                        }
                    }
                } else {
                    $('td.select-td input.select-item').each(function(){
                        var $this = $(this);
                        if ($this.prop('checked')) {
                            delete(catImages[currentCat][$this.attr('data-index')]);
                            $this.closest('tr').remove();
                        }
                    });
                    $('table.ba-category-table tr input[type="checkbox"]').each(function(){
                        var $this = $(this),
                            id = $this.closest('tr').attr('data-id'),
                            parent;
                        if ($this.prop('checked')) {
                            delete(catImages[id]);
                            parent = $('#'+id).parent();
                            $('#'+id).remove();
                            if (!parent.hasClass('root-list')) {
                                if (parent.find('> li').length == 0) {
                                    parent = parent.parent();
                                    parent.find('i.zmdi-chevron-right').remove();
                                    parent.find('> ul').remove();
                                }
                            }
                            $this.closest('tr').remove();
                        }
                    });
                }
            } else {
                if (currentContext.hasClass('ba-images')) {
                    var ind = currentContext.find('input.select-item').attr('data-index');
                    delete(catImages[currentCat][ind]);
                    currentContext.remove();
                } else {
                    var id = currentContext.closest('li').attr('id'),
                        parent = $('#'+id).parent();
                    $('tr[data-id="'+id+'"]').remove();
                    var parent = currentContext.closest('li').parent();
                    currentContext.closest('li').remove();
                    if (parent[0].localName == 'ul') {
                        if (parent.find('> li').length == 0) {
                            parent = parent.parent();
                            parent.find('i.zmdi-chevron-right').remove();
                            parent.find('> ul').remove();
                        }
                    }
                }
            }
            $('div.table-body').find('.pagination').remove();
            if (deleteMode != 'single' || !currentItem.hasClass('ba-category')) {
                reIndexArray();
                $('#'+currentCat).find('> a').trigger('click');
            }
            showNotice($('#delete-const').val());
            $('div.gallery-options > div').hide();
            $('#delete-dialog').modal('hide');
        });

        $('#apply-html').on('click', function(event){
            event.preventDefault();
            if (currentItem.hasClass('ba-category')) {
                settings = currentItem.find('> a .cat-options').val().split(';');
                settings[7] = CKE.getData().replace(new RegExp(";", 'g'), '-_-');
                currentItem.find('> a .cat-options').val(settings.join(';'));
            } else {
                var obj = currentItem.find('.select-item').val();
                obj = JSON.parse(obj);
                obj.description = CKE.getData();
                obj.resave = 1;
                saveImg(obj);
            }
            $('#html-editor').modal('hide');
        });

        $('table.ba-items-table').on('click', 'tr', function(){
            $('tr.active').removeClass('active');
            $(this).addClass('active');
            $('#category-options').hide();
            $('div.images-options, div.gallery-options div.gallery-header').show();
            $('i.add-link').parent().show();
            $('i.add-embed-code').parent().show();
            currentItem = $(this);
            var obj = currentItem.find('.select-item').val();
            obj = JSON.parse(obj);
            $('div.gallery-options > img').hide();
            obj.url = obj.url.replace(new RegExp(' ', 'g'), '%20');
            $('div.images-options div.img-thumbnail').css('background-image', 'url('+obj.url+')');
            $('input.image-title').val(obj.title);
            if (obj.lightboxUrl) {
                $('input.image-alias').val(obj.lightboxUrl);
            } else {
                if (obj.title) {
                    $('input.image-alias').val(obj.title.toLowerCase().replace(new RegExp(" ", 'g'), "-"));
                } else {
                    $('input.image-alias').val('');
                }
            }
            $('input.image-short').val(obj.short);
            $('input.image-alt').val(obj.alt);
            if (obj.hideInAll && obj.hideInAll == 1) {
                $('.hide-in-category-all').attr('checked', true);
            } else {
                $('.hide-in-category-all').removeAttr('checked');
            }
        });

        $('.hide-in-category-all').on('click', function(){
            var value = $(this).prop('checked') ? 1 : 0,
                obj = currentItem.find('.select-item').val();
            obj = JSON.parse(obj);
            obj.hideInAll = value;
            obj.resave = 1;
            saveImg(obj);
        });

        $('input.image-title').on('input', function(){
            var value = $(this).val(),
                obj = currentItem.find('.select-item').val();
            obj = JSON.parse(obj);
            value = strip_tags(value);
            obj.title = value;
            obj.resave = 1;
            saveImg(obj);
        });
        
        $('input.image-alias').on('input', function(){
            var value = $(this).val().toLowerCase(),
                obj = currentItem.find('.select-item').val();
            obj = JSON.parse(obj);
            value = strip_tags(value);
            obj.lightboxUrl = value.replace(new RegExp(" ", 'g'), "-");
            obj.resave = 1;
            saveImg(obj);
        });
        
        $('.image-short').on('input', function(){
            var value = $(this).val(),
                obj = currentItem.find('.select-item').val();
            obj = JSON.parse(obj);
            value = strip_tags(value);
            obj.short = value;
            obj.resave = 1;
            saveImg(obj);
        });
        
        $('.image-alt').on('input', function(){
            var value = $(this).val(),
                obj = currentItem.find('.select-item').val();
            obj = JSON.parse(obj);
            value = strip_tags(value);
            obj.alt = value;
            obj.resave = 1;
            saveImg(obj);
        });

        $('table.ba-items-table tbody').sortable({
            cancel: null,
            cursorAt: {
                left: 90,
                top: 20
            },
            handle : '.draggable-handler',
            tolerance: 'pointer',
            stop : function(event, ui){
                ui.item.addClass('ba-dropping-helper');
                setTimeout(function(){
                    ui.item.removeClass('ba-dropping-helper');
                }, 500);
                var page = $('.pagination-list li.ba-pages.active a').attr('data-page');
                if (!page) {
                    page = 0;
                }
                var max = page*pagLimit + pagLimit,
                    sItems = $(this).find('tr input.select-item'),
                    ind = 0;
                for (var i = page * pagLimit; i < max; i++) {
                    var $this = $(sItems[ind]);
                    obj = $this.val();
                    $this.attr('data-index', i);
                    obj = JSON.parse(obj);
                    catImages[currentCat][i] = obj;
                    ind++;
                }
            }
        }).disableSelection();

        $('table.ba-category-table tbody').sortable({
            cancel: null,
            cursorAt: {
                left: 90,
                top: 20
            },
            handle : '.draggable-handler',
            tolerance: 'pointer',
            stop : function(event, ui){
                ui.item.addClass('ba-dropping-helper');
                setTimeout(function(){
                    ui.item.removeClass('ba-dropping-helper');
                }, 500);
                var id,
                    items,
                    ul = document.createElement('ul');
                $(this).find('tr').each(function(ind, el){
                    id = $(this).attr('data-id');
                    ul.appendChild($('#'+id)[0]);
                });
                $('div.category-list li.active > ul').html(ul.innerHTML)
            }
        }).disableSelection();

        $('.ba-tooltip').each(function(){
            $(this).parent().on('mouseenter', function(){
                var $this = $(this),
                    coord = $this.children().first()[0].getBoundingClientRect(),
                    top = coord.top,
                    data = $this.find('.ba-tooltip').html(),
                    center = (coord.right - coord.left) / 2;
                    className = $this.find('.ba-tooltip')[0].className;
                center = coord.left + center;
                if ($this.find('.ba-tooltip').hasClass('ba-bottom')) {
                    top = coord.bottom;
                }
                $('body').append('<span class="'+className+'">'+data+'</span>');
                $('body > .ba-tooltip').css({
                    'top' : top+'px',
                    'left' : center+'px'
                });
            }).on('mouseleave', function(){
                var tooltip = $('body').find(' > .ba-tooltip');
                tooltip.addClass('tooltip-hidden');
                setTimeout(function(){
                    tooltip.remove();
                }, 500);
            });
        });

        $('#watermark-select').on('click', function(){
            $('#uploader-modal').modal().attr('data-check', 'single');
            uploadMode = 'watermark';
        });

        $('#remove-watermark').on('click', function(event){
            event.preventDefault();
            $('#jform_watermark_upload').val('');
            watermark = true;
        });

        $('#jform_watermark_position').prev().on('customHide', function(){
            watermark = true;
        });

        $('#jform_watermark_opacity').prev().on('change', function(){
            watermark = true;
        });

        $('#jform_watermark_opacity, #jform_scale_watermark').on('input', function(){
            watermark = true;
        });

        $('#thumbnail-typography-options .thumbnail-typography-select').parent().on('show', function(){
            var value = $(this).find('input.thumbnail-typography-select').attr('data-value');
            $(this).find('li').each(function(){
                var $this = $(this).removeClass('selected');
                $this.find('i.zmdi-check').remove();
                if ($this.attr('data-value') == value) {
                    $this.addClass('selected').prepend('<i class="zmdi zmdi-check"></i>');
                }
            });
        }).on('customHide', function(){
            var value = $(this).find('input.thumbnail-typography-select').attr('data-value');
            $('#thumbnail-typography-options .ba-options-group > div').not('div.ba-group-element').hide();
            $('#thumbnail-typography-options div.'+value+'-options').show();
        });

        checkRandomGrid();

        $('#jform_gallery_layout').prev().on('customHide', function(){
            setTimeout(function(){
               checkRandomGrid();
            }, 100);
        });

        checkEffect();

        $('#jform_thumbnail_layout').prev().on('customHide', function(){
            setTimeout(function(){
               checkEffect();
            }, 100);
        })

        $('.ba-form-trigger').parent().each(function(){
            var $this = $(this),
                val = $(this).next().val(),
                value;
            $this.find('ul li').each(function(){
                value = $(this).attr('data-value')
                if (value == val) {
                    $this.find('input').attr('data-value', value).val($(this).text());
                    return false;
                }
            });
        }).on('show', function(){
            var value = $(this).find('input').attr('data-value');
            $(this).find('li').each(function(){
                var $this = $(this).removeClass('selected');
                $this.find('i.zmdi-check').remove();
                if ($this.attr('data-value') == value) {
                    $this.addClass('selected').prepend('<i class="zmdi zmdi-check"></i>');
                }
            });
        }).on('customHide', function(){
            var $this = $(this),
                value = $this.find('input').attr('data-value');
            $this.next().val(value);
        });

        $('#filter-options .ba-custom-select').on('show', function(){
            var value = $(this).find('input.filter-select').attr('data-value');
            $(this).find('li').each(function(){
                var $this = $(this).removeClass('selected');
                $this.find('i.zmdi-check').remove();
                if ($this.attr('data-value') == value) {
                    $this.addClass('selected').prepend('<i class="zmdi zmdi-check"></i>');
                }
            });
        });

        $('#filter-options .ba-custom-select').on('customHide', function(){
            var value = $(this).find('input.filter-select').attr('data-value');
            if (value == 'active') {
                $('#filter-options div.filter-options-active').show();
                $('#filter-options div.filter-options').hide();
            } else {
                $('#filter-options div.filter-options-active').hide();
                $('#filter-options div.filter-options').show();
            }
        });

        function ckeckBg(input)
        {
            var obj = $(input).minicolors('rgbObject');
            if (obj.r == 255 && obj.g == 255 && obj.b == 255 && obj.a == 1) {
                $(input).parent().addClass('ba-minicolors-border');
            } else {
                $(input).parent().removeClass('ba-minicolors-border');
            }
        }

        $('#jform_caption_bg').attr('data-opacity', jQuery('#jform_caption_opacity').val());
        $('#jform_caption_bg').minicolors('settings', {
            opacity: true,
            change: function(hex) {
                var rgba = $(this).minicolors('rgbObject');
                ckeckBg(this);
                jQuery('#jform_caption_opacity').val(rgba.a);
            }
        });
        ckeckBg($('#jform_caption_bg')[0]);

        $('#title_color').minicolors({
            opacity: true,
            theme: 'bootstrap',
            change: function(hex) {
                hex = $(this).minicolors('rgbaString');
                ckeckBg(this);
                $('#jform_title_color').val(hex)
            }
        });

        subColor = $('#jform_title_color').val();
        subColor = rgba2hex(subColor);
        $('#title_color').minicolors('value', subColor[0]);
        $('#title_color').minicolors('opacity', subColor[1]);

        $('#category_color').minicolors({
            opacity : true,
            theme: 'bootstrap',
            change: function(hex) {
                hex = $(this).minicolors('rgbaString');
                ckeckBg(this);
                $('#jform_category_color').val(hex)
            }
        });

        subColor = $('#jform_category_color').val();
        subColor = rgba2hex(subColor);
        $('#category_color').minicolors('value', subColor[0]);
        $('#category_color').minicolors('opacity', subColor[1]);

        $('#description_color').minicolors({
            opacity : true,
            theme : 'bootstrap',
            change: function(hex) {
                ckeckBg(this);
                hex = $(this).minicolors('rgbaString');
                $('#jform_description_color').val(hex);
            }
        });

        subColor = $('#jform_description_color').val();
        subColor = rgba2hex(subColor);
        $('#description_color').minicolors('value', subColor[0]);
        $('#description_color').minicolors('opacity', subColor[1]);

        $('#lightbox_border').minicolors({
            opacity : true,
            theme : 'bootstrap',
            change : function(hex) {
                ckeckBg(this);
                hex = $(this).minicolors('rgbaString');
                $('#jform_lightbox_border').val(hex);
            }
        });

        subColor = $('#jform_lightbox_border').val();
        subColor = rgba2hex(subColor);
        $('#lightbox_border').minicolors('value', subColor[0]);
        $('#lightbox_border').minicolors('opacity', subColor[1]);

        $('#jform_lightbox_bg').attr('data-opacity', $('#jform_lightbox_bg_transparency').val());
        $('#jform_lightbox_bg').minicolors('settings', {
            opacity: true,
            change: function(hex) {
                ckeckBg(this);
                var rgba = $(this).minicolors('rgbObject');
                $('#jform_lightbox_bg_transparency').val(rgba.a);
            }
        });
        ckeckBg($('#jform_lightbox_bg')[0]);

        $('#header_icons_color').minicolors({
            opacity : true,
            theme : 'bootstrap',
            change : function(hex) {
                ckeckBg(this);
                hex = $(this).minicolors('rgbaString');
                $('#jform_header_icons_color').val(hex);
            }
        });

        subColor = $('#jform_header_icons_color').val();
        subColor = rgba2hex(subColor);
        $('#header_icons_color').minicolors('value', subColor[0]);
        $('#header_icons_color').minicolors('opacity', subColor[1]);

        $('#nav_button_icon').minicolors({
            opacity : true,
            theme : 'bootstrap',
            change : function(hex) {
                ckeckBg(this);
                hex = $(this).minicolors('rgbaString');
                $('#jform_nav_button_icon').val(hex);
            }
        });

        subColor = $('#jform_nav_button_icon').val();
        subColor = rgba2hex(subColor);
        $('#nav_button_icon').minicolors('value', subColor[0]);
        $('#nav_button_icon').minicolors('opacity', subColor[1]);

        $('#nav_button_bg').minicolors({
            opacity : true,
            theme : 'bootstrap',
            change : function(hex) {
                ckeckBg(this);
                hex = $(this).minicolors('rgbaString');
                $('#jform_nav_button_bg').val(hex);
            }
        });

        subColor = $('#jform_nav_button_bg').val();
        subColor = rgba2hex(subColor);
        $('#nav_button_bg').minicolors('value', subColor[0]);
        $('#nav_button_bg').minicolors('opacity', subColor[1]);

        $('#bg_active').minicolors({
            opacity : true,
            theme : 'bootstrap',
            change: function(hex) {
                ckeckBg(this);
                hex = $(this).minicolors('rgbaString');
                $('#jform_bg_active').val(hex);
            }
        });

        subColor = $('#jform_bg_active').val();
        subColor = rgba2hex(subColor);
        $('#bg_active').minicolors('value', subColor[0]);
        $('#bg_active').minicolors('opacity', subColor[1]);

        $('#bg_hover_active').minicolors({
            opacity : true,
            theme : 'bootstrap',
            change: function(hex) {
                ckeckBg(this);
                hex = $(this).minicolors('rgbaString');
                $('#jform_bg_hover_active').val(hex);
            }
        });

        subColor = $('#jform_bg_hover_active').val();
        subColor = rgba2hex(subColor);
        $('#bg_hover_active').minicolors('value', subColor[0]);
        $('#bg_hover_active').minicolors('opacity', subColor[1]);

        $('#border_color_active').minicolors({
            opacity : true,
            theme : 'bootstrap',
            change: function(hex) {
                ckeckBg(this);
                hex = $(this).minicolors('rgbaString');
                $('#jform_border_color_active').val(hex);
            }
        });

        subColor = $('#jform_border_color_active').val();
        subColor = rgba2hex(subColor);
        $('#border_color_active').minicolors('value', subColor[0]);
        $('#border_color_active').minicolors('opacity', subColor[1]);

        $('#font_color_active').minicolors({
            opacity : true,
            theme : 'bootstrap',
            change: function(hex) {
                ckeckBg(this);
                hex = $(this).minicolors('rgbaString');
                $('#jform_font_color_active').val(hex);
            }
        });

        subColor = $('#jform_font_color_active').val();
        subColor = rgba2hex(subColor);
        $('#font_color_active').minicolors('value', subColor[0]);
        $('#font_color_active').minicolors('opacity', subColor[1]);

        $('#font_color_hover_active').minicolors({
            opacity: true,
            theme : 'bootstrap',
            change: function(hex) {
                ckeckBg(this);
                hex = $(this).minicolors('rgbaString');
                $('#jform_font_color_hover_active').val(hex);
            }
        });

        subColor = $('#jform_font_color_hover_active').val();
        subColor = rgba2hex(subColor);
        $('#font_color_hover_active').minicolors('value', subColor[0]);
        $('#font_color_hover_active').minicolors('opacity', subColor[1]);

        $('#bg_color').minicolors({
            opacity: true,
            theme: 'bootstrap',
            change: function(hex) {
                ckeckBg(this);
                hex = jQuery(this).minicolors('rgbaString');
                $('#jform_bg_color').val(hex);
            }
        });

        subColor = $('#jform_bg_color').val();
        subColor = rgba2hex(subColor);
        $('#bg_color').minicolors('value', subColor[0]);
        $('#bg_color').minicolors('opacity', subColor[1]);

        $('#bg_color_hover').minicolors({
            opacity : true,
            theme: 'bootstrap',
            change: function(hex) {
                ckeckBg(this);
                hex = jQuery(this).minicolors('rgbaString');
                $('#jform_bg_color_hover').val(hex);
            }
        });

        subColor = $('#jform_bg_color_hover').val();
        subColor = rgba2hex(subColor);
        $('#bg_color_hover').minicolors('value', subColor[0]);
        $('#bg_color_hover').minicolors('opacity', subColor[1]);

        $('#border_color').minicolors({
            opacity : true,
            theme : 'bootstrap',
            change: function(hex) {
                ckeckBg(this);
                hex = $(this).minicolors('rgbaString');
                $('#jform_border_color').val(hex);
            }
        });

        subColor = $('#jform_border_color').val();
        subColor = rgba2hex(subColor);
        $('#border_color').minicolors('value', subColor[0]);
        $('#border_color').minicolors('opacity', subColor[1]);

        $('#font_color').minicolors({
            opacity : true,
            theme : 'bootstrap',
            change: function(hex) {
                ckeckBg(this);
                hex = $(this).minicolors('rgbaString');
                $('#jform_font_color').val(hex);
            }
        });

        subColor = $('#jform_font_color').val();
        subColor = rgba2hex(subColor);
        $('#font_color').minicolors('value', subColor[0]);
        $('#font_color').minicolors('opacity', subColor[1]);
        
        $('#font_color_hover').minicolors({
            opacity : true,
            theme : 'bootstrap',
            change: function(hex) {
                ckeckBg(this);
                hex = $(this).minicolors('rgbaString');
                $('#jform_font_color_hover').val(hex);
            }
        });

        subColor = $('#jform_font_color_hover').val();
        subColor = rgba2hex(subColor);
        $('#font_color_hover').minicolors('value', subColor[0]);
        $('#font_color_hover').minicolors('opacity', subColor[1]);

        $('#pagination_bg').minicolors({
            opacity: true,
            theme: 'bootstrap',
            change: function(hex) {
                ckeckBg(this);
                hex = $(this).minicolors('rgbaString');
                $('#jform_pagination_bg').val(hex);
            }
        });

        subColor = $('#jform_pagination_bg').val();
        subColor = rgba2hex(subColor);
        $('#pagination_bg').minicolors('value', subColor[0]);
        $('#pagination_bg').minicolors('opacity', subColor[1]);
        
        $('#pagination_bg_hover').minicolors({
            opacity: true,
            theme: 'bootstrap',
            change: function(hex) {
                ckeckBg(this);
                hex = $(this).minicolors('rgbaString');
                $('#jform_pagination_bg_hover').val(hex);
            }
        });

        subColor = $('#jform_pagination_bg_hover').val();
        subColor = rgba2hex(subColor);
        $('#pagination_bg_hover').minicolors('value', subColor[0]);
        $('#pagination_bg_hover').minicolors('opacity', subColor[1]);
        
        $('#pagination_border').minicolors({
            opacity: true,
            theme: 'bootstrap',
            change: function(hex) {
                ckeckBg(this);
                hex = jQuery(this).minicolors('rgbaString');
                $('#jform_pagination_border').val(hex);
            }
        });

        subColor = $('#jform_pagination_border').val();
        subColor = rgba2hex(subColor);
        $('#pagination_border').minicolors('value', subColor[0]);
        $('#pagination_border').minicolors('opacity', subColor[1]);

        $('#pagination_font').minicolors({
            opacity: true,
            theme: 'bootstrap',
            change: function(hex) {
                ckeckBg(this);
                hex = $(this).minicolors('rgbaString');
                $('#jform_pagination_font').val(hex);
            }
        });

        subColor = $('#jform_pagination_font').val();
        subColor = rgba2hex(subColor);
        $('#pagination_font').minicolors('value', subColor[0]);
        $('#pagination_font').minicolors('opacity', subColor[1]);
        
        $('#pagination_font_hover').minicolors({
            opacity: true,
            theme: 'bootstrap',
            change: function(hex) {
                ckeckBg(this);
                hex = jQuery(this).minicolors('rgbaString');
                $('#jform_pagination_font_hover').val(hex);
            }
        });

        subColor = $('#jform_pagination_font_hover').val();
        subColor = rgba2hex(subColor);
        $('#pagination_font_hover').minicolors('value', subColor[0]);
        $('#pagination_font_hover').minicolors('opacity', subColor[1]);

        $('.ba-gallery-range').each(function(){
            var input = $(this),
                max = input.attr('max') * 1,
                min = input.attr('min') * 1,
                number = input.next();
            input.val(number.val());
            addRangeWidth(input);
            number.on('input', function(){
                var value = this.value * 1;
                if (!this.value) {
                    value = 0
                }
                if (max && value > max) {
                    this.value = value = max;
                }
                if (min && value < min) {
                    this.value = value = min;
                }
                input.val(value);
                addRangeWidth(input);
            })
        });
        $('.ba-gallery-range').on('mousedown', function(){
            var input = $(this),
                interval = setInterval(function(){
                    addRangeWidth(input);
                    input.next().val(input.val());
            }, 20);
            $(this).one('mouseup', function(){
                clearInterval(interval);
            });
        });

        $('[name="title_weight_radio"]').each(function(){
            if ($(this).val() == $('#jform_title_weight').val()) {
                $(this).attr('checked', true);
            } else {
                $(this).removeAttr('checked');
            }
        }).on('change', function(){
            $('#jform_title_weight').val($(this).val());
        });

        $('[name="category_weight_radio"]').each(function(){
            if ($(this).val() == $('#jform_category_weight').val()) {
                $(this).attr('checked', true);
            } else {
                $(this).removeAttr('checked');
            }
        }).on('change', function(){
            $('#jform_category_weight').val($(this).val());
        });

        $('[name="description_weight_radio"]').each(function(){
            if ($(this).val() == $('#jform_description_weight').val()) {
                $(this).attr('checked', true);
            } else {
                $(this).removeAttr('checked');
            }
        }).on('change', function(){
            $('#jform_description_weight').val($(this).val());
        });

        $('[name="weight_radio_active"]').each(function(){
            if ($(this).val() == $('#jform_font_weight_active').val()) {
                $(this).attr('checked', true);
            } else {
                $(this).removeAttr('checked');
            }
        }).on('change', function(){
            $('#jform_font_weight_active').val($(this).val());
        });

        $('[name="font_weight_radio"]').each(function(){
            if ($(this).val() == $('#jform_font_weight').val()) {
                $(this).attr('checked', true);
            } else {
                $(this).removeAttr('checked');
            }
        }).on('change', function(){
            $('#jform_font_weight').val($(this).val());
        });

        if ($('#jform_disable_lightbox').val() == 0) {
            $('#enable-lightbox').attr('checked', true);
        }

        $('#enable-lightbox').on('click', function(){
            if ($(this).prop('checked')) {
                $('#jform_disable_lightbox').val(0);
            } else {
                $('#jform_disable_lightbox').val(1);
            }
            checkLightbox();
        });

        $('#lightbox-comments-options .ba-custom-select').on('customHide', function(){
            checkComments();
        });

        $('#jform_disable_caption').on('click', function(){
            checkCaptionOptions();
        });

        $('#jform_category_list').on('click', function(){
            checkFilter();
        });

        $('#jform_pagination').on('click', function(){
            checkPaginator();
        });

        $('.column-number-select').parent().on('show', function(){
            var value = $(this).find('input.column-number-select').attr('data-value');
            $(this).find('li').each(function(){
                var $this = $(this).removeClass('selected');
                $this.find('i.zmdi-check').remove();
                if ($this.attr('data-value') == value) {
                    $this.addClass('selected').prepend('<i class="zmdi zmdi-check"></i>');
                }
            });
        }).on('customHide', function(){
            var value = $(this).find('input.column-number-select').attr('data-value');
            $('.desktop-options, .tablet-options, .phone-land-options, .phone-port-options').hide();
            $('.'+value+'-options').show();
        });

        $('#jform_auto_resize').on('click', function(){
            checkAutoResize();
        });

        $('#jform_display_header').on('click', function(){
            checkHeader();
        });

        $('.pagination-limit .ba-custom-select').on('show', function(){
            var value = $(this).find('input').attr('data-value');
            $(this).find('li').each(function(){
                var $this = $(this).removeClass('selected');
                $this.find('i.zmdi-check').remove();
                if ($this.attr('data-value') == value) {
                    $this.addClass('selected').prepend('<i class="zmdi zmdi-check"></i>');
                }
            });
        }).on('customHide', function(){
            pagLimit = $(this).find('input').attr('data-value') * 1;
            var tbody = $('table.ba-items-table tbody').empty();
            if (currentCat) {
                catImages[currentCat].forEach(function(el, ind){
                    if (ind >= pagLimit && pagLimit != 1) {
                        return false;
                    }
                    str = '<tr class="ba-images"><td class="select-td"><label ';
                    str += 'class="ba-image">';
                    str += '<input data-index="'+ind;
                    str += '" class="select-item" type="checkbox" value="';
                    str += '"><i class="zmdi zmdi-circle-o"></i><i class="zmdi';
                    str += ' zmdi-check"></i></label><img data-src="'+showUrl+el.path;
                    str += '"></td><td class="draggable-handler">';
                    str += el.name+'</td><td class="draggable-handler">';
                    str += getFileSize(el.size)+'</td></tr>';
                    tbody.append(str);
                    tbody.find('.select-item').last().val(JSON.stringify(el))
                });
                drawPaginator();
                getAllImages();
            }
        });

        checkHeader();
        checkLightbox();
        checkAutoResize();
        checkFilter();
        checkPaginator();
        checkCaptionOptions();

        $('.minicolors-input').attr('maxlength', '7');
    });
})(jQuery);
/**
* @package   BaGrid
* @author    Balbooa http://www.balbooa.com/
* @copyright Copyright @ Balbooa
* @license   http://www.gnu.org/licenses/gpl.html GNU/GPL
*/

!function ($) {
    
    var ba_isotope = function (element, options) {
        this.parent = $(element);
        this.options = options;
    };
    
    ba_isotope.prototype = {
        checkImg : function(childrens){
            var isotope = this,
                just = 0;
            childrens.find('img').each(function(){
                var $this = $(this)
                    src = $this.attr('data-original'),
                    img = document.createElement('img');
                if (!src) {
                    src = $this.attr('src');
                }
                img.src = src;
                img.onload = function(){
                    $this.attr('data-width', this.width);
                    $this.attr('data-height', this.height);
                    just++;
                    if (just == childrens.length) {
                        isotope.parent.data('ba_isotope').init();
                    }
                }
                img.onerror = function(){
                    $this.attr('data-width', 250);
                    $this.attr('data-height', 250);
                    just++;
                    if (just == childrens.length) {
                        isotope.parent.data('ba_isotope').init();
                    }
                }
            });
        },
        init : function(){
            var parent = this.parent,
                selector = this.options.selector,
                filter = this.options.filter,
                count = this.options.count * 1,
                mode = this.options.mode,
                offsetX = 0,
                parWidth = parent.width(),
                margin = this.options.margin * 1,
                winSize = $(window).width(),
                offsetY = 0,
                n;
            if (filter) {
                selector = filter;
            }
            n = count;
            parent.children().not(selector).hide();
            var childrens = parent.find(selector),
                just = childrens.find('img[data-width]').length;
            if (mode == 'justified') {
                var flag = true,
                    start = 0,
                    rowWidth = 0,
                    ratio = 1;
                while (flag) {
                    var r = 0
                    for (var i = start; i < n; i++) {
                        if (childrens[i]) {
                            var height = $(childrens[i]).find('img').attr('data-height'),
                                width = $(childrens[i]).find('img').attr('data-width');
                            ratio = width / height;
                            width = ratio * 50;
                            rowWidth += width * 1;
                            r++
                        }
                    }
                    if (rowWidth != parWidth) {
                        ratio = (parWidth - r * margin + margin) / rowWidth;
                    }
                    for (var i = start; i < n; i++) {
                        if (childrens[i]) {
                            var width = $(childrens[i]).find('img').attr('data-width'),
                                height = $(childrens[i]).find('img').attr('data-height');
                            var r = width / height;
                            height = ratio * 50;
                            if (n > childrens.length && height > 250) {
                                height = 250;
                            }
                            width = height * r;
                            $(childrens[i]).css({
                                'width' : width,
                                'height' : height,
                                'left' : offsetX,
                                'position' : 'absolute',
                                'display' : 'block',
                                'top' : offsetY
                            });
                            offsetX += width + margin;
                        } else {
                            flag = false;
                        }
                    }
                    offsetY += $(childrens[start]).height() * 1 + margin * 1;
                    start = n;
                    n += count * 1;
                    offsetX = 0;
                    rowWidth = 0;
                }
            } else if (mode == 'metro' || mode == 'square' || mode == 'masonry') {
                var elements = new Array(),
                    width = 0,
                    $this = this,
                    empty = new Array(),
                    x = 0,
                    y = margin;
                childrens.each(function(){
                    if ($(this).width() + margin < width || width == 0) {
                        width = $(this).width();
                    }
                });
                childrens.each(function(){
                    if ($(this).width() <= width && empty.length > 0) {
                        var array = empty.shift();
                        array = array.split(':')
                        x = array[0] * 1;
                        y = array[1] * 1;
                    } else {
                        if (offsetX + $(this).width() > parWidth) {
                            offsetX = 0;
                            offsetY += width + margin;
                        }
                        var array = $this.checkEmpty(offsetX, offsetY, elements, width, margin, parWidth, $(this).width(), empty);
                        offsetX = array[0];
                        offsetY = array[1];
                        elements[offsetX+':'+offsetY] = true;
                        if ($(this).width() > width && $(this).height() > width) {
                            x = offsetX + width + margin;
                            elements[x+':'+offsetY] = true;
                            y = offsetY + width + margin;
                            elements[offsetX+':'+y] = true;
                            elements[x+':'+y] = true;
                        } else if ($(this).width() > width) {
                            x = offsetX + width + margin;
                            elements[x+':'+offsetY] = true;
                        } else if ($(this).height() > width) {
                            y = offsetY + width + margin;
                            elements[offsetX+':'+y] = true;
                        }
                        x = offsetX;
                        y = offsetY;
                        offsetX += width + margin;
                    }
                    $(this).css({
                        'left' : x,
                        'position' : 'absolute',
                        'display' : 'block',
                        'top' : y
                    });
                });
                var max = offsetY;
                childrens.each(function(){
                    var top = this.style.top.replace('px', '') * 1
                    if (top == offsetY) {
                        top += $(this).height() + margin
                        if (top > max) {
                            max = top;
                        }
                    }
                });
                offsetY = max;
            } else if (mode == 'random') {
                var array = {};
                childrens.each(function(){
                    var $t = $(this);
                    if (offsetX + $t.width() > parWidth) {
                        offsetX = 0;
                    }
                    for (key in array) {
                        if (array[key][offsetX]) {
                            offsetY = array[key][offsetX].y + array[key][offsetX].h;
                        }
                    }
                    $t.css({
                        'left' : offsetX,
                        'position' : 'absolute',
                        'display' : 'block',
                        'top' : offsetY
                    });
                    if (!array[offsetY]) {
                        array[offsetY] = {}
                    }
                    array[offsetY][offsetX] = {
                        h : $t.height() + margin,
                        y : offsetY
                    }
                    offsetX += $t.width() + margin;
                });                
            } else {
                var array = {};
                childrens.each(function(){
                    if (offsetX + $(this).width() > parWidth) {
                        offsetX = 0;
                    }
                    for (key in array) {
                        if (array[key][offsetX]) {
                            offsetY = array[key][offsetX].y + array[key][offsetX].h;
                        }
                    }
                    $(this).css({
                        'left' : offsetX,
                        'position' : 'absolute',
                        'display' : 'block',
                        'top' : offsetY
                    });
                    if (!array[offsetY]) {
                        array[offsetY] = {}
                    }
                    array[offsetY][offsetX] = {
                        h : $(this).height() + margin,
                        y : offsetY
                    }
                    offsetX += $(this).width() + margin;
                });
            }
            setTimeout(function(){
                parent.trigger('show_isotope');
            }, 1);
            setTimeout(function(){
                $(window).trigger('scroll');
            }, 100);
            var max = offsetY;
            childrens.each(function(){
                var top = this.style.top.replace('px', '') * 1
                top += $(this).height() + margin;
                if (top > max) {
                    max = top;
                }
            });
            parent.css({
                'position' : 'relative',
                'height' : max
            });
        },
        checkEmpty : function(offsetX, offsetY, elements, width, margin, parWidth, w, empty){
            var array = new Array();
            if (elements[offsetX+':'+offsetY]) {
                offsetX += width + margin;
                if (offsetX + w >= parWidth) {
                    if (w > width && offsetX + width < parWidth && !elements[offsetX+':'+offsetY]) {
                        empty.push(offsetX+':'+offsetY)
                    }
                    offsetX = 0;
                    offsetY += width + margin;
                }
                array = this.checkEmpty(offsetX, offsetY, elements, width, margin, parWidth, w, empty);
                offsetX = array[0];
                offsetY = array[1];
            }
            if (w > width) {
                var x = offsetX + width + margin
                if (elements[x+':'+offsetY]) {
                    empty.push(offsetX+':'+offsetY);
                    offsetX += width + margin;
                    if (offsetX + w >= parWidth) {
                        offsetX = 0;
                        offsetY += width + margin;
                    }
                    array = this.checkEmpty(offsetX, offsetY, elements, width, margin, parWidth, w, empty);
                    offsetX = array[0];
                    offsetY = array[1];
                }
            }
            array[0] = offsetX;
            array[1] = offsetY;

            return array;
        },
        shuffle : function(){
            var childrens = this.parent.children().not('input'),
                n = childrens.length,
                parent = this.parent;
            var i, j, temp;
            for (i = n - 1; i > 0; i--) {
              j = Math.floor(Math.random() * (i + 1));
              temp = childrens[i];
              childrens[i] = childrens[j];
              childrens[j] = temp;
            }
            childrens.each( function () {
                $(this).appendTo(parent);
            });
        }
    }
    
    $.fn.ba_isotope = function (option) {
        return this.each(function () {
            var $this = $(this),
                data = $this.data('ba_isotope'),
                options = $.extend({}, $.fn.ba_isotope.defaults, typeof option == 'object' && option);
            if (typeof(option) == 'object') {
                $this.data('ba_isotope', (data = new ba_isotope(this, options)));
                data.init();
            } else {
                $this.data('ba_isotope', (data = new ba_isotope(this, $.fn.ba_isotope.defaults)));
                data[option]();
            }
        });
    }
    
    $.fn.ba_isotope.defaults = {
        selector : '> div',
        filter : '',
        margin : 10,
        count : 4,
        mode : 'grid'
    }
    
}(window.jQuery);
(function($) {
 
    $.fn.charCount = function(options){
 
		// default configuration properties
		var defaults = {
			allowed: 140,
			warning: 25,
			css: 'help-inline',
			counterElement: 'span',
			cssWarning: '',
			cssExceeded: 'error',
			counterText: ''
		};
 
		var options = $.extend(defaults, options);
 
		function calculate(obj){
			var count = $(obj).val().length;
			var available = options.allowed - count;
			if(available <= options.warning && available >= 0){
//Since the error/warning field is actually in the first div, we jump 2 parent classes up to find it.
				$(obj).next().parent().parent().addClass(options.cssWarning);
			} else {
				$(obj).next().parent().parent().removeClass(options.cssWarning);
			}
			if(available < 0){
				$(obj).next().parent().parent().addClass(options.cssExceeded);
			} else {
				$(obj).next().parent().parent().removeClass(options.cssExceeded);
			}
			$(obj).next().html(options.counterText + available);
		};
 
		this.each(function() {
			$(this).after('<'+ options.counterElement +' class="' + options.css + '">'+ options.counterText +'</'+ options.counterElement +'>');
			calculate(this);
			$(this).keyup(function(){calculate(this)});
			$(this).change(function(){calculate(this)});
		});
 
	};
 
})(jQuery);


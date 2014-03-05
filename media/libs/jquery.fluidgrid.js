/*jshint eqnull:true */
/*!
 * jQuery Fluid Grid Plugin v1.0
 * https://github.com/mcniac/jquery-fluidgrid
 *
 * Copyright 2012, Esteban Soler
 * Dual licensed under the MIT or GPL Version 2 licenses.
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.opensource.org/licenses/GPL-2.0
 */
(function($) {
	$.fn.fluidGrid = function(options) {

		var defaults = {
				item_selector: ' .item',
				col_class_prefix: 't-col-',
				default_item_width: 240,
				gutter: 20
			};
		if(typeof(this.length)=="undefined" || this.length==0) {
			return false;
		}
		var options = $.extend({}, defaults, options),
		gu = options.gutter, // gutter width
		coffset = $(this).offset().top, // container's top offset
		loffset = $(this).offset().left, // container's left offset
		iw = $(options.item_selector,this).width(); // item width, all items must be of the same width,

		// use a default width
		if( iw==0 ) {
			iw=options.default_item_width;
		}
		var cc = Math.floor(this.width() / (iw + gu)), // columns count
		fcols = []; // columns array

		// recalculate the item width and gutter so it completes the whole container
		if( $(this).width() > (iw + gu)*cc ) {
			iw += Math.floor(($(this).width() - (iw + gu)*cc)/cc*0.9);
		}
		
		// initialize column array
		while(cc--) {
			fcols[cc] = 0;
		}


		// add each item to the shortest column
		$(options.item_selector, this).each(function() {
			$(this).css('width', iw+'px');
			var idx = fcols.indexOf(Math.min.apply(null, fcols)), // get the shortest column
			lpos = idx*(iw+gu)+loffset+gu,
			tpos = fcols[idx]+coffset;
		
			$(this).css({position:'absolute',float:'left',top:tpos+'px',left:lpos+'px'})
			fcols[idx] += $(this).height()+gu;
//			$(this).detach();
//			$('.'+options.col_class_prefix + idx, $(options.list_selector)).append(this);
			
		});
		$(this).css('height',Math.max.apply(null, fcols)+'px');
	};

	

})(jQuery);
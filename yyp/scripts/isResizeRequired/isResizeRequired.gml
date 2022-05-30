///@function isResizeRequired(previousWidth, previousHeight)
///@description Return if window size has changed.
///@param {Integer} previousWidth
///@param {Integer} previousHeight
///@return {Boolean} isRequired
function isResizeRequired(argument0, argument1) {

		var previousWidth = argument0;
		var previousHeight = argument1;
	
		var width = isHtml5() ? browser_width : window_get_width();
		var height = isHtml5() ? browser_height : window_get_height();
		
		return ((previousWidth != width) ||
				(previousHeight != height));
	



}

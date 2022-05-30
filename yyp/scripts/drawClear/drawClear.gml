///@function drawClear(color)
///@description Wrapper for draw_clear and draw_clear_alpha
///@param {Color} color
function drawClear(argument0) {

		var color = argument0;
	
		draw_clear_alpha(
			colorToGMColor(color),
			getColorAlpha(color));
	



}

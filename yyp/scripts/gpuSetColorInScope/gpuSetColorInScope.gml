///@function gpuSetColorInScope(color)
///@description execute draw_ functions in current scope.
///@param {Color} color
function gpuSetColorInScope(argument0) {

		var color = argument0;

		draw_set_color(colorToGMColor(color));
		draw_set_alpha(getColorAlpha(color));
	



}

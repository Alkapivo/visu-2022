///@function cleanSurface(surface, color, alpha)
///@description Fill surface with color.
///@param {Surface} surface
///@param {Color} color
///@param {Number} alpha
function cleanSurface(argument0, argument1, argument2) {

		var surface = argument0;
		var color = argument1;
		var alpha = argument2;
	
		surface_set_target(surface);
		draw_clear_alpha(colorToGMColor(color), alpha);
		surface_reset_target();


}

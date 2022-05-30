///@function getSurface(surface, width, height, [disableDepth])
///@description Wrapper for !surface_exists ? surface_create.
///@param {Surface} surface
///@param {Integer} width
///@param {Integer} height
///@param {Boolean} [disableDepth=true]
function getSurface() {

		///checkArgumentCount(3, argument_count, getSurface);
	
		var surface = argument[0];
		var width = round(argument[1]);
		var height = round(argument[2]);
		var disableDepth = argument_count > 3 ? argument[3] : true;
	
		if (!isOptionalPresent(surface) || !surface_exists(surface)) {
			return createSurface(width, height, disableDepth);
		} else {
			///@todo Wrapper
			if ((surface_get_width(surface) != width) || 
				(surface_get_height(surface) != height)) {
				
				surface_resize(surface, width, height);
			}
			return surface;
		}
	



}

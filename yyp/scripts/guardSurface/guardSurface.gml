///@function guardSurface(context, surface, surfaceName, width, height, [disableDepth])
///@description Wrapper for !surface_exists ? surface_create.
///@param {Instance} context
///@param {Surface} surface
///@param {String} surfaceName
///@param {Integer} width
///@param {Integer} height
///@param {Boolean} [disableDepth]
function guardSurface() {

		if (argument_count < 5) {
			logger("checkSurface must have at least 5 arguments provided", LogType.ERROR);	
			return;
		}
	
		var context = argument[0];
		var surface = argument[1];
		var surfaceName = argument[2];
		var width = round(argument[3]);
		var height = round(argument[4]);
		var disableDepth = argument_count == 6 ? argument[5] : false;
	
		if (!isOptionalPresent(surface) || !surface_exists(surface)) {
			setInstanceVariable(context, surfaceName, disableDepth ? 
				createSurface(width, height, true) : createSurface(width, height));
		} else {
			if ((surface_get_width(surface) != width) || 
				(surface_get_height(surface) != height)) {
				surface_resize(surface, width, height);
			}
		}
	



}

///@function createSurface(width, heigh, [disableDepth])
///@description Wrapper for surface_create.
///@param {Integer} width
///@param {Integer} height
///@param {Boolean} [disableDepth=false]
function createSurface() {

		if (argument_count < 2) {
			logger("createSurface must have at least 2 arguments provided", LogType.ERROR);
			return createSurface(1, 1, true);
		}
	
		var width = round(argument[0]);
		var height = round(argument[1]);
		var disableDepth = argument_count > 2 ? argument[2] : false;
	
		var surface = null
		if (disableDepth) {
			surface_depth_disable(true);
			surface = surface_create(width, height);
			surface_depth_disable(false);	
		} else {
			surface = surface_create(width, height);
		}
	
		return surface;
	



}

///@function destroySurface(surface)
///@description Wrapper for surface_free.
///@param {Surface} surface
function destroySurface(argument0) {

		var surface = argument0;
	
		if (surface_exists(surface)) {
		
			surface_free(surface);	
		}
	



}

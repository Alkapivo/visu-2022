///@function getSpritePixelColor(sprite, xPosition, yPosition)
///@description Gettter.
///@param {AssetTexture} sprite
///@param {Integer} xPosition
///@param {Integer} yPosition
///@return {Color} color
function getSpritePixelColor(argument0, argument1, argument2) {

		var sprite = argument0;
		var xPosition = argument1;
		var yPosition = argument2;
	
		var surface = createSurface(1, 1, true);
	
		gpuSetSurfaceTarget(surface);
			draw_sprite_part(sprite, 0, xPosition, yPosition, 1, 1, 0, 0);
			var gmColor = surface_getpixel(surface, 0, 0);
		gpuResetSurfaceTarget();
	
		surface_free(surface);
	
		var color = gmColorToColor(gmColor);
	
		return color;
	



}

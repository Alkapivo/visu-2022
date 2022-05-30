///@function isTilemapRegionEmpty(tilemap, tileWidth, tileHeight, width, height, xBegin, yBegin)
///@description Return if tilemap on specified region contains only "null" tiles.
///@param {Tilemap} tilemap
///@param {Integer} tileWidth
///@param {Integer} tileHeight
///@param {Integer} width
///@param {Integer} height
///@param {Integer} xBegin
///@param {Integer} yBegin
function isTilemapRegionEmpty(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {


		var tilemap = argument0;
		var tileWidth = argument1;
		var tileHeight = argument2;
		var width = argument3;
		var height = argument4;
		var xBegin = argument5;
		var yBegin = argument6;
	
		var isTilemapOnRegionEmpty = true;
		var xEnd = xBegin + width;
		var yEnd = yBegin + height;
		for (var yTile = yBegin; yTile < yEnd; yTile += tileHeight) {
			for (var xTile = xBegin; xTile < xEnd; xTile += tileWidth) {
				var tile = tilemap_get_at_pixel(tilemap, xTile, yTile);
				if (tile != 0) {
					isTilemapOnRegionEmpty = false;
					return isTilemapOnRegionEmpty;
				}
			}
		}
	
		return isTilemapOnRegionEmpty;
	



}

///@function drawTilemapPartial(tilemap, xBegin, xBegin, width, height, cellSize);
///@description Like draw_tilemap it will draw tilemap but only tiles from specified range (usefull in 3D mode)
///@param {TilemapId} tilemap
///@param {Integer} xBegin
///@param {Integer} yBegin
///@param {Integer} width in pixels
///@param {Integer} height in pixels
///@param {Integer} cellSize
function drawTilemapPartialToSurface(argument0, argument1, argument2, argument3, argument4, argument5) {

		var tilemap = argument0;
		var xBegin = argument1;
		var yBegin = argument2;
		var width = argument3;
		var height = argument4;
		var cellSize = argument5;
	
		var tileset = tilemap_get_tileset(tilemap);
		var tileXBegin = xBegin div cellSize;
		var tileYBegin = yBegin div cellSize;
		var tileXEnd = (xBegin + width) div cellSize;
		var tileYEnd = (yBegin + height) div cellSize;
	
		var tileY = 0;
		for (var yCell = tileYBegin; yCell < tileYEnd; yCell++) {
			var tileX = 0;
			for (var xCell = tileXBegin; xCell < tileXEnd; xCell++) {
				var data = tilemap_get(tilemap, xCell, yCell);
				if (data > 0) {
					draw_tile(tileset, data, 0, tileX * cellSize, tileY * cellSize)	
				}
				tileX++;
			}
			tileY++;
		}


}

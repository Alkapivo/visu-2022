///@function createTilemapLayer(layerId, tilemap, xPos, yPos, width, height)
///@description wrapper for layer_create.
///@param {Layer} layerId
///@param {AssetTiles} tilemap
///@param {Integer} xPos
///@param {Integer} yPos
///@param {Integer} width
///@param {Integer} height
///@return {Tilemap} tilemapId
function createTilemapLayer(argument0, argument1, argument2, argument3, argument4, argument5) {

		var layerId = argument0;
		var tilemap = argument1;
		var xPos = argument2;
		var yPos = argument3;
		var width = argument4;
		var height = argument5;

		var tilemapId = layer_tilemap_create(layerId, xPos, yPos, tilemap, width, height);
		/*
		logger("Created tilemap layer: { id: {0}, tilemapName: {1}, x: {2}, y: {3}, width: {4}, height: {5} }", LogType.DEBUG,
			tilemapId, getAssetName(tilemap, AssetTiles), xPos, yPos, width, height);
		*/
		return tilemapId;
	



}

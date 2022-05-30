///@function createTiledMap(name, width, height, layers, tileWidth, tileHeight, compressMethod)
///@description Constructor for TiledMap entity.
///@param {String} name
///@param {Number} width
///@param {Number} height
///@param {TiledLayer[]} layers
///@param {Integer} tileWidth
///@param {Integer} tileHeight
///@param {TiledCompressMethod} compressMethod
///@return {TiledMap} tiledMap 
///@throws {Exception}
///@generated {2020-07-28T15:19:06.721Z}
function createTiledMap(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {

		var name = argument0;
		var width = argument1;
		var height = argument2;
		var layers = argument3;
		var tileWidth = argument4;
		var tileHeight = argument5;
		var compressMethod = argument6;
	
		var tiledMap = createEntity(TiledMap);

		setTiledMapName(tiledMap, assertNoOptional(name));
		setTiledMapWidth(tiledMap, assertNoOptional(width));
		setTiledMapHeight(tiledMap, assertNoOptional(height));
		setTiledMapLayers(tiledMap, assertNoOptional(layers));
		setTiledMapTileWidth(tiledMap, assertNoOptional(tileWidth));
		setTiledMapTileHeight(tiledMap, assertNoOptional(tileHeight));
		setTiledMapCompressMethod(tiledMap, assertNoOptional(compressMethod));

		return tiledMap;
	



}

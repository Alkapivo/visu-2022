///@function destroyTiledMap(tiledMap)
///@description Destroy TiledMap entity.
///@param {TiledMap} tiledMap
///@throws {Exception}
///@generated {2020-07-28T15:19:06.721Z}
function destroyTiledMap(argument0) {

		var tiledMap = argument0;
	
		var name = getTiledMapName(tiledMap);
		var width = getTiledMapWidth(tiledMap);
		var height = getTiledMapHeight(tiledMap);
		var layers = getTiledMapLayers(tiledMap);
		var tileWidth = getTiledMapTileWidth(tiledMap);
		var tileHeight = getTiledMapTileHeight(tiledMap);
		var compressMethod = getTiledMapCompressMethod(tiledMap);
	
		for (var index = 0; index < getArrayLength(layers); index++) {
			var entity = layers[@ index];
			destroyTiledLayer(entity);
		}
		setTiledMapLayers(tiledMap, null);
	

	



}

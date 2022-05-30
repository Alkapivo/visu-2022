///@function serializeTiledMap(tiledMap)
///@description Serialize TiledMap to JSON string.
///@param {TiledMap} tiledMap
///@return {String} tiledMapJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:41.445Z}
function serializeTiledMap(argument0) {

		var tiledMap = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"name",
			getTiledMapName(tiledMap));	
		appendFieldToJsonObject(
			jsonObject,
			"width",
			getTiledMapWidth(tiledMap));	
		appendFieldToJsonObject(
			jsonObject,
			"height",
			getTiledMapHeight(tiledMap));	
		appendEntityToJsonObject(
			jsonObject,
			"layers",
			getTiledMapLayers(tiledMap),
			"TiledLayer",
			Array);
	
		appendFieldToJsonObject(
			jsonObject,
			"tileWidth",
			getTiledMapTileWidth(tiledMap));	
		appendFieldToJsonObject(
			jsonObject,
			"tileHeight",
			getTiledMapTileHeight(tiledMap));	
		appendFieldToJsonObject(
			jsonObject,
			"compressMethod",
			getTiledMapCompressMethod(tiledMap));	

		var tiledMapJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return tiledMapJsonString;
	



}

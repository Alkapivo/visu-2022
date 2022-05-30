///@function deserializeTiledMap(jsonString)
///@description Deserialize TiledMap from JSON String to TiledMap entity.
///@param {String} jsonString
///@return {TiledMap} tiledMap 
///@throws {Exception}
///@generated {2020-07-28T15:19:06.721Z}
function deserializeTiledMap(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var name = assertNoOptional(getJsonObjectFieldValue(jsonObject, "name"));
		var width = assertNoOptional(getJsonObjectFieldValue(jsonObject, "width"));
		var height = assertNoOptional(getJsonObjectFieldValue(jsonObject, "height"));
		var layers = assertNoOptional(getJsonObjectFieldValue(jsonObject, "layers", Array, "TiledLayer"));
		var tileWidth = assertNoOptional(getJsonObjectFieldValue(jsonObject, "tileWidth"));
		var tileHeight = assertNoOptional(getJsonObjectFieldValue(jsonObject, "tileHeight"));
		var compressMethod = assertNoOptional(getJsonObjectFieldValue(jsonObject, "compressMethod"));

		destroyJsonObject(jsonObject);
	
		return createTiledMap(name, width, height, layers, tileWidth, tileHeight, compressMethod);
	



}

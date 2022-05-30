///@function deserializeTiledObject(jsonString)
///@description Deserialize TiledObject from JSON String to TiledObject entity.
///@param {String} jsonString
///@return {TiledObject} tiledObject 
///@throws {Exception}
///@generated {2020-07-28T15:19:07.105Z}
function deserializeTiledObject(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var type = assertNoOptional(getJsonObjectFieldValue(jsonObject, "type"));
		var name = getJsonObjectFieldValue(jsonObject, "name");
		var texture = assertNoOptional(getJsonObjectFieldValue(jsonObject, "texture"));
		var xPos = assertNoOptional(getJsonObjectFieldValue(jsonObject, "xPos"));
		var yPos = assertNoOptional(getJsonObjectFieldValue(jsonObject, "yPos"));
		var properties = getJsonObjectFieldValue(jsonObject, "properties", Map);

		destroyJsonObject(jsonObject);
	
		return createTiledObject(type, name, texture, xPos, yPos, properties);
	



}

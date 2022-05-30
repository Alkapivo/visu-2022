///@function deserializeTiledLayer(jsonString)
///@description Deserialize TiledLayer from JSON String to TiledLayer entity.
///@param {String} jsonString
///@return {TiledLayer} tiledLayer 
///@throws {Exception}
///@generated {2020-07-28T15:19:06.871Z}
function deserializeTiledLayer(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var name = assertNoOptional(getJsonObjectFieldValue(jsonObject, "name"));
		var opacity = assertNoOptional(getJsonObjectFieldValue(jsonObject, "opacity"));
		var type = assertNoOptional(getJsonObjectFieldValue(jsonObject, "type"));
		var xPos = assertNoOptional(getJsonObjectFieldValue(jsonObject, "xPos"));
		var yPos = assertNoOptional(getJsonObjectFieldValue(jsonObject, "yPos"));
		var properties = getJsonObjectFieldValue(jsonObject, "properties", Map);
		var data = getJsonObjectFieldValue(jsonObject, "data");
		var width = getJsonObjectFieldValue(jsonObject, "width");
		var height = getJsonObjectFieldValue(jsonObject, "height");
		var objects = getJsonObjectFieldValue(jsonObject, "objects", Array, "TiledObject");
		var vertexBufferGroups = getJsonObjectFieldValue(jsonObject, "vertexBufferGroups", Array, "VertexBufferGroup");
		var layers = getJsonObjectFieldValue(jsonObject, "layers", Array, "TiledLayer");

		destroyJsonObject(jsonObject);
	
		return createTiledLayer(name, opacity, type, xPos, yPos, properties, data, width, height, objects, vertexBufferGroups, layers);
	



}

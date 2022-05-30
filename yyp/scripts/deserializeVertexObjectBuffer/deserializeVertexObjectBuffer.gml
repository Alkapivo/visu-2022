///@function deserializeVertexObjectBuffer(jsonString)
///@description Deserialize VertexObjectBuffer from JSON String to VertexObjectBuffer entity.
///@param {String} jsonString
///@return {VertexObjectBuffer} vertexObjectBuffer 
///@throws {Exception}
///@generated {2020-08-06T19:19:54.514Z}
function deserializeVertexObjectBuffer(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var isFlat = assertNoOptional(getJsonObjectFieldValue(jsonObject, "isFlat"));
		var texture = assertNoOptional(getJsonObjectFieldValue(jsonObject, "texture"));
		var coords = assertNoOptional(getJsonObjectFieldValue(jsonObject, "coords", Array));

		destroyJsonObject(jsonObject);
	
		return createVertexObjectBuffer(isFlat, texture, coords);
	



}

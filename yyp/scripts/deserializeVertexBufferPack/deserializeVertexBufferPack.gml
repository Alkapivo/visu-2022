///@function deserializeVertexBufferPack(jsonString)
///@description Deserialize VertexBufferPack from JSON String to VertexBufferPack entity.
///@param {String} jsonString
///@return {VertexBufferPack} vertexBufferPack 
///@throws {Exception}
///@generated {2020-08-06T16:38:03.154Z}
function deserializeVertexBufferPack(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var textureGroup = assertNoOptional(getJsonObjectFieldValue(jsonObject, "textureGroup"));
		var vertexBuffer = assertNoOptional(getJsonObjectFieldValue(jsonObject, "vertexBuffer"));
		var vertexFormat = assertNoOptional(getJsonObjectFieldValue(jsonObject, "vertexFormat"));

		destroyJsonObject(jsonObject);
	
		return createVertexBufferPack(textureGroup, vertexBuffer, vertexFormat);
	



}

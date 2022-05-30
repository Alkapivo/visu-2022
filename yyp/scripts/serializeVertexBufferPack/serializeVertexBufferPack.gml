///@function serializeVertexBufferPack(vertexBufferPack)
///@description Serialize VertexBufferPack to JSON string.
///@param {VertexBufferPack} vertexBufferPack
///@return {String} vertexBufferPackJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:41.020Z}
function serializeVertexBufferPack(argument0) {

		var vertexBufferPack = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"textureGroup",
			getVertexBufferPackTextureGroup(vertexBufferPack));	
		appendFieldToJsonObject(
			jsonObject,
			"vertexBuffer",
			getVertexBufferPackVertexBuffer(vertexBufferPack));	
		appendFieldToJsonObject(
			jsonObject,
			"vertexFormat",
			getVertexBufferPackVertexFormat(vertexBufferPack));	

		var vertexBufferPackJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return vertexBufferPackJsonString;
	



}

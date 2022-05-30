///@function serializeVertexObjectBuffer(vertexObjectBuffer)
///@description Serialize VertexObjectBuffer to JSON string.
///@param {VertexObjectBuffer} vertexObjectBuffer
///@return {String} vertexObjectBufferJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:41.514Z}
function serializeVertexObjectBuffer(argument0) {

		var vertexObjectBuffer = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"isFlat",
			getVertexObjectBufferIsFlat(vertexObjectBuffer));	
		appendFieldToJsonObject(
			jsonObject,
			"texture",
			getVertexObjectBufferTexture(vertexObjectBuffer));	
		appendFieldToJsonObject(
			jsonObject,
			"coords",
			getVertexObjectBufferCoords(vertexObjectBuffer),
			Array);
	

		var vertexObjectBufferJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return vertexObjectBufferJsonString;
	



}

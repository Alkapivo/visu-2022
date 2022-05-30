///@function serializeVertexBufferGroup(vertexBufferGroup)
///@description Serialize VertexBufferGroup to JSON string.
///@param {VertexBufferGroup} vertexBufferGroup
///@return {String} vertexBufferGroupJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:41.492Z}
function serializeVertexBufferGroup(argument0) {

		var vertexBufferGroup = argument0;
	
		var jsonObject = createJsonObject();

		appendEntityToJsonObject(
			jsonObject,
			"chunkCoord",
			getVertexBufferGroupChunkCoord(vertexBufferGroup),
			"Tuple");
	
		appendFieldToJsonObject(
			jsonObject,
			"type",
			getVertexBufferGroupType(vertexBufferGroup));	
		appendEntityToJsonObject(
			jsonObject,
			"objectBuffer",
			getVertexBufferGroupObjectBuffer(vertexBufferGroup),
			"VertexObjectBuffer",
			Array);
	

		var vertexBufferGroupJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return vertexBufferGroupJsonString;
	



}

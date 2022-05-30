///@function deserializeVertexBufferGroup(jsonString)
///@description Deserialize VertexBufferGroup from JSON String to VertexBufferGroup entity.
///@param {String} jsonString
///@return {VertexBufferGroup} vertexBufferGroup 
///@throws {Exception}
///@generated {2020-07-28T15:19:07.239Z}
function deserializeVertexBufferGroup(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var chunkCoord = assertNoOptional(getJsonObjectFieldValue(jsonObject, "chunkCoord", Entity, "Tuple"));
		var type = assertNoOptional(getJsonObjectFieldValue(jsonObject, "type"));
		var objectBuffer = assertNoOptional(getJsonObjectFieldValue(jsonObject, "objectBuffer", Array, "VertexObjectBuffer"));

		destroyJsonObject(jsonObject);
	
		return createVertexBufferGroup(chunkCoord, type, objectBuffer);
	



}

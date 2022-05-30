///@function serializeShaderEvent(shaderEvent)
///@description Serialize ShaderEvent to JSON string.
///@param {ShaderEvent} shaderEvent
///@return {String} shaderEventJsonString 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.677Z}

function serializeShaderEvent(shaderEvent) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"name",
		getShaderEventName(shaderEvent));	
	appendFieldToJsonObject(
		jsonObject,
		"duration",
		getShaderEventDuration(shaderEvent));	
	appendFieldToJsonObject(
		jsonObject,
		"data",
		getShaderEventData(shaderEvent),
		Map);
	

	var shaderEventJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return shaderEventJsonString;
	
}

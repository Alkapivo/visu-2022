///@function deserializeShaderEvent(jsonString)
///@description Deserialize ShaderEvent from JSON String to ShaderEvent entity.
///@param {String} jsonString
///@return {ShaderEvent} shaderEvent 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.677Z}

function deserializeShaderEvent(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var name = assertNoOptional(getJsonObjectFieldValue(jsonObject, "name"));
	var duration = assertNoOptional(getJsonObjectFieldValue(jsonObject, "duration"));
	var data = assertNoOptional(getJsonObjectFieldValue(jsonObject, "data", Map));

	destroyJsonObject(jsonObject);
	
	return createShaderEvent(name, duration, data);
	
}

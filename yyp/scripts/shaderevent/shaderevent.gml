///@description ShaderEvent entity

///@function createShaderEvent(name, duration, data)
///@description Constructor for ShaderEvent entity.
///@param {String} name
///@param {Number} duration
///@param {Map<String::any>} data
///@return {ShaderEvent} shaderEvent 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.730Z}

function createShaderEvent(name, duration, data) {

	var shaderEvent = createEntity(ShaderEvent);

	setShaderEventName(shaderEvent, assertNoOptional(name));
	setShaderEventDuration(shaderEvent, assertNoOptional(duration));
	setShaderEventData(shaderEvent, assertNoOptional(data));

	return shaderEvent;
	
}
///@function serializeShaderEvent(shaderEvent)
///@description Serialize ShaderEvent to JSON string.
///@param {ShaderEvent} shaderEvent
///@return {String} shaderEventJsonString 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.730Z}

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
///@function deserializeShaderEvent(jsonString)
///@description Deserialize ShaderEvent from JSON String to ShaderEvent entity.
///@param {String} jsonString
///@return {ShaderEvent} shaderEvent 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.730Z}

function deserializeShaderEvent(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var name = assertNoOptional(getJsonObjectFieldValue(jsonObject, "name"));
	var duration = assertNoOptional(getJsonObjectFieldValue(jsonObject, "duration"));
	var data = assertNoOptional(getJsonObjectFieldValue(jsonObject, "data", Map));

	destroyJsonObject(jsonObject);
	
	return createShaderEvent(name, duration, data);
	
}
///@function destroyShaderEvent(shaderEvent)
///@description Destroy ShaderEvent entity.
///@param {ShaderEvent} shaderEvent
///@throws {Exception}
///@generated {2022-08-18T22:24:59.731Z}

function destroyShaderEvent(shaderEvent) {


	
	var name = getShaderEventName(shaderEvent);
	var duration = getShaderEventDuration(shaderEvent);
	var data = getShaderEventData(shaderEvent);
	
	destroyDataStructure(data, Map, "Unable to destroy Map data in ShaderEvent");
	setShaderEventData(shaderEvent, null);
	

	
}
///@function getShaderEventData(shaderEvent)
///@description Getter.
///@param {ShaderEvent} shaderEvent
///@return {Map<String::any>} data 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.731Z}

function getShaderEventData(shaderEvent) {

	return shaderEvent[@ 2];
	
}
///@function getShaderEventDuration(shaderEvent)
///@description Getter.
///@param {ShaderEvent} shaderEvent
///@return {Number} duration 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.731Z}

function getShaderEventDuration(shaderEvent) {

	return shaderEvent[@ 1];
	
}
///@function getShaderEventName(shaderEvent)
///@description Getter.
///@param {ShaderEvent} shaderEvent
///@return {String} name 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.731Z}

function getShaderEventName(shaderEvent) {

	return shaderEvent[@ 0];
	
}
///@function setShaderEventData(shaderEvent, data)
///@description Setter.
///@param {ShaderEvent} shaderEvent
///@param {Map<String::any>} data
///@throws {Exception}
///@generated {2022-08-18T22:24:59.731Z}

function setShaderEventData(shaderEvent, data) {

	shaderEvent[@ 2] = data;
	
}
///@function setShaderEventDuration(shaderEvent, duration)
///@description Setter.
///@param {ShaderEvent} shaderEvent
///@param {Number} duration
///@throws {Exception}
///@generated {2022-08-18T22:24:59.731Z}

function setShaderEventDuration(shaderEvent, duration) {

	shaderEvent[@ 1] = duration;
	
}
///@function setShaderEventName(shaderEvent, name)
///@description Setter.
///@param {ShaderEvent} shaderEvent
///@param {String} name
///@throws {Exception}
///@generated {2022-08-18T22:24:59.731Z}

function setShaderEventName(shaderEvent, name) {

	shaderEvent[@ 0] = name;
	
}

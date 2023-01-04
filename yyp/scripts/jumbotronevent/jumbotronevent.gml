///@description JumbotronEvent entity

///@function createJumbotronEvent(message, handlerName, duration)
///@description Constructor for JumbotronEvent entity.
///@param {String} message
///@param {String} handlerName
///@param {Number} duration
///@return {JumbotronEvent} jumbotronEvent 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.641Z}

function createJumbotronEvent(message, handlerName, duration) {

	var jumbotronEvent = createEntity(JumbotronEvent);

	setJumbotronEventMessage(jumbotronEvent, assertNoOptional(message));
	setJumbotronEventHandlerName(jumbotronEvent, assertNoOptional(handlerName));
	setJumbotronEventDuration(jumbotronEvent, assertNoOptional(duration));

	return jumbotronEvent;
	
}
///@function serializeJumbotronEvent(jumbotronEvent)
///@description Serialize JumbotronEvent to JSON string.
///@param {JumbotronEvent} jumbotronEvent
///@return {String} jumbotronEventJsonString 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.641Z}

function serializeJumbotronEvent(jumbotronEvent) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"message",
		getJumbotronEventMessage(jumbotronEvent));	
	appendFieldToJsonObject(
		jsonObject,
		"handlerName",
		getJumbotronEventHandlerName(jumbotronEvent));	
	appendFieldToJsonObject(
		jsonObject,
		"duration",
		getJumbotronEventDuration(jumbotronEvent));	

	var jumbotronEventJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return jumbotronEventJsonString;
	
}
///@function deserializeJumbotronEvent(jsonString)
///@description Deserialize JumbotronEvent from JSON String to JumbotronEvent entity.
///@param {String} jsonString
///@return {JumbotronEvent} jumbotronEvent 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.642Z}

function deserializeJumbotronEvent(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var message = assertNoOptional(getJsonObjectFieldValue(jsonObject, "message"));
	var handlerName = assertNoOptional(getJsonObjectFieldValue(jsonObject, "handlerName"));
	var duration = assertNoOptional(getJsonObjectFieldValue(jsonObject, "duration"));

	destroyJsonObject(jsonObject);
	
	return createJumbotronEvent(message, handlerName, duration);
	
}
///@function destroyJumbotronEvent(jumbotronEvent)
///@description Destroy JumbotronEvent entity.
///@param {JumbotronEvent} jumbotronEvent
///@throws {Exception}
///@generated {2022-08-18T22:24:59.642Z}

function destroyJumbotronEvent(jumbotronEvent) {


	
	var message = getJumbotronEventMessage(jumbotronEvent);
	var handlerName = getJumbotronEventHandlerName(jumbotronEvent);
	var duration = getJumbotronEventDuration(jumbotronEvent);
	

	
}
///@function getJumbotronEventDuration(jumbotronEvent)
///@description Getter.
///@param {JumbotronEvent} jumbotronEvent
///@return {Number} duration 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.642Z}

function getJumbotronEventDuration(jumbotronEvent) {

	return jumbotronEvent[@ 2];
	
}
///@function getJumbotronEventHandlerName(jumbotronEvent)
///@description Getter.
///@param {JumbotronEvent} jumbotronEvent
///@return {String} handlerName 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.642Z}

function getJumbotronEventHandlerName(jumbotronEvent) {

	return jumbotronEvent[@ 1];
	
}
///@function getJumbotronEventMessage(jumbotronEvent)
///@description Getter.
///@param {JumbotronEvent} jumbotronEvent
///@return {String} message 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.642Z}

function getJumbotronEventMessage(jumbotronEvent) {

	return jumbotronEvent[@ 0];
	
}
///@function setJumbotronEventDuration(jumbotronEvent, duration)
///@description Setter.
///@param {JumbotronEvent} jumbotronEvent
///@param {Number} duration
///@throws {Exception}
///@generated {2022-08-18T22:24:59.642Z}

function setJumbotronEventDuration(jumbotronEvent, duration) {

	jumbotronEvent[@ 2] = duration;
	
}
///@function setJumbotronEventHandlerName(jumbotronEvent, handlerName)
///@description Setter.
///@param {JumbotronEvent} jumbotronEvent
///@param {String} handlerName
///@throws {Exception}
///@generated {2022-08-18T22:24:59.642Z}

function setJumbotronEventHandlerName(jumbotronEvent, handlerName) {

	jumbotronEvent[@ 1] = handlerName;
	
}
///@function setJumbotronEventMessage(jumbotronEvent, message)
///@description Setter.
///@param {JumbotronEvent} jumbotronEvent
///@param {String} message
///@throws {Exception}
///@generated {2022-08-18T22:24:59.642Z}

function setJumbotronEventMessage(jumbotronEvent, message) {

	jumbotronEvent[@ 0] = message;
	
}

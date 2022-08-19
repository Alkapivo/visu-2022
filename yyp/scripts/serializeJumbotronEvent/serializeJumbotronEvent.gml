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

///@function serializeJumbotronEvent(jumbotronEvent)
///@description Serialize JumbotronEvent to JSON string.
///@param {JumbotronEvent} jumbotronEvent
///@return {String} jumbotronEventJsonString 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.583Z}

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

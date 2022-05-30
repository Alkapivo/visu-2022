///@function serializeUiActionEvent(uiActionEvent)
///@description Serialize UiActionEvent to JSON string.
///@param {UiActionEvent} uiActionEvent
///@return {String} uiActionEventJsonString 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.569Z}

function serializeUiActionEvent(uiActionEvent) {

	var jsonObject = createJsonObject();

	appendEntityToJsonObject(
		jsonObject,
		"data",
		getUiActionEventData(uiActionEvent),
		"GenericEntity");
	

	var uiActionEventJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return uiActionEventJsonString;
	
}

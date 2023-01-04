///@description UiActionEvent entity

///@function createUiActionEvent(data)
///@description Constructor for UiActionEvent entity.
///@param {GenericEntity} data
///@return {UiActionEvent} uiActionEvent 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.569Z}

function createUiActionEvent(data) {

	var uiActionEvent = createEntity(UiActionEvent);

	setUiActionEventData(uiActionEvent, assertNoOptional(data));

	return uiActionEvent;
	
}
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
///@function deserializeUiActionEvent(jsonString)
///@description Deserialize UiActionEvent from JSON String to UiActionEvent entity.
///@param {String} jsonString
///@return {UiActionEvent} uiActionEvent 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.569Z}

function deserializeUiActionEvent(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var data = assertNoOptional(getJsonObjectFieldValue(jsonObject, "data", Entity, "GenericEntity"));

	destroyJsonObject(jsonObject);
	
	return createUiActionEvent(data);
	
}
///@function destroyUiActionEvent(uiActionEvent)
///@description Destroy UiActionEvent entity.
///@param {UiActionEvent} uiActionEvent
///@throws {Exception}
///@generated {2021-05-01T23:43:42.569Z}

function destroyUiActionEvent(uiActionEvent) {


	
	var data = getUiActionEventData(uiActionEvent);
	
	destroyGenericEntity(data);
	setUiActionEventData(uiActionEvent, null);
	

	
}
///@function getUiActionEventData(uiActionEvent)
///@description Getter.
///@param {UiActionEvent} uiActionEvent
///@return {GenericEntity} data 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.569Z}

function getUiActionEventData(uiActionEvent) {

	return uiActionEvent[@ 0];
	
}
///@function setUiActionEventData(uiActionEvent, data)
///@description Setter.
///@param {UiActionEvent} uiActionEvent
///@param {GenericEntity} data
///@throws {Exception}
///@generated {2021-05-01T23:49:41.445Z}

function setUiActionEventData(uiActionEvent, data) {

	uiActionEvent[@ 0] = data;
	
}

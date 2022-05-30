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

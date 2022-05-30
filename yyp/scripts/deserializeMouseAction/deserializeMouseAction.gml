///@function deserializeMouseAction(jsonString)
///@description Deserialize MouseAction from JSON String to MouseAction entity.
///@param {String} jsonString
///@return {MouseAction} mouseAction 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.908Z}

function deserializeMouseAction(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var type = assertNoOptional(getJsonObjectFieldValue(jsonObject, "type"));
	var state = assertNoOptional(getJsonObjectFieldValue(jsonObject, "state"));
	var handler = assertNoOptional(getJsonObjectFieldValue(jsonObject, "handler"));

	destroyJsonObject(jsonObject);
	
	return createMouseAction(type, state, handler);
	
}

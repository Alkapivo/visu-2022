///@function deserializeGenericEvent(jsonString)
///@description Deserialize GenericEvent from JSON String to GenericEvent entity.
///@param {String} jsonString
///@return {GenericEvent} genericEvent 
///@throws {Exception}
///@generated {2021-05-01T23:43:44.174Z}

function deserializeGenericEvent(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var type = assertNoOptional(getJsonObjectFieldValue(jsonObject, "type"));
	var data = getJsonObjectFieldValue(jsonObject, "data", Entity, "ArrayMap");
	var dispatcher = getJsonObjectFieldValue(jsonObject, "dispatcher");

	destroyJsonObject(jsonObject);
	
	return createGenericEvent(type, data, dispatcher);
	
}

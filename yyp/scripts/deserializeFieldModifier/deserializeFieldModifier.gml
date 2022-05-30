///@function deserializeFieldModifier(jsonString)
///@description Deserialize FieldModifier from JSON String to FieldModifier entity.
///@param {String} jsonString
///@return {FieldModifier} fieldModifier 
///@throws {Exception}
///@generated {2021-08-09T17:10:20.103Z}

function deserializeFieldModifier(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var name = assertNoOptional(getJsonObjectFieldValue(jsonObject, "name"));
	var type = assertNoOptional(getJsonObjectFieldValue(jsonObject, "type"));
	var value = assertNoOptional(getJsonObjectFieldValue(jsonObject, "value"));
	var duration = getJsonObjectFieldValue(jsonObject, "duration");

	destroyJsonObject(jsonObject);
	
	return createFieldModifier(name, type, value, duration);
	
}

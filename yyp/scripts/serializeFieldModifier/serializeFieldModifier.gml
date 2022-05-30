///@function serializeFieldModifier(fieldModifier)
///@description Serialize FieldModifier to JSON string.
///@param {FieldModifier} fieldModifier
///@return {String} fieldModifierJsonString 
///@throws {Exception}
///@generated {2021-08-09T17:10:20.103Z}

function serializeFieldModifier(fieldModifier) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"name",
		getFieldModifierName(fieldModifier));	
	appendFieldToJsonObject(
		jsonObject,
		"type",
		getFieldModifierType(fieldModifier));	
	appendFieldToJsonObject(
		jsonObject,
		"value",
		getFieldModifierValue(fieldModifier));	
	if (isOptionalPresent(getFieldModifierDuration(fieldModifier))) {
		appendFieldToJsonObject(
			jsonObject,
			"duration",
			getFieldModifierDuration(fieldModifier));
	}
	

	var fieldModifierJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return fieldModifierJsonString;
	
}

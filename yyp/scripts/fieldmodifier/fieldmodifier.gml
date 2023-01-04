///@description FieldModifier entity

///@function createFieldModifier(name, type, value, duration)
///@description Constructor for FieldModifier entity.
///@param {String} name
///@param {GridEventFieldType} type
///@param {any} value
///@param {Optional<Number>} duration
///@return {FieldModifier} fieldModifier 
///@throws {Exception}
///@generated {2021-08-09T17:10:20.102Z}

function createFieldModifier(name, type, value, duration) {

	var fieldModifier = createEntity(FieldModifier);

	setFieldModifierName(fieldModifier, assertNoOptional(name));
	setFieldModifierType(fieldModifier, assertNoOptional(type));
	setFieldModifierValue(fieldModifier, assertNoOptional(value));
	setFieldModifierDuration(fieldModifier, duration);

	return fieldModifier; 
	
}
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
///@function destroyFieldModifier(fieldModifier)
///@description Destroy FieldModifier entity.
///@param {FieldModifier} fieldModifier
///@throws {Exception}
///@generated {2021-08-09T17:10:20.103Z}

function destroyFieldModifier(fieldModifier) {


	
	var name = getFieldModifierName(fieldModifier);
	var type = getFieldModifierType(fieldModifier);
	var value = getFieldModifierValue(fieldModifier);
	var duration = getFieldModifierDuration(fieldModifier);
	

	
}
///@function getFieldModifierDuration(fieldModifier)
///@description Getter.
///@param {FieldModifier} fieldModifier
///@return {Optional<Number>} duration 
///@throws {Exception}
///@generated {2021-08-09T17:10:20.103Z}

function getFieldModifierDuration(fieldModifier) {

	return fieldModifier[@ 3];
	
}
///@function getFieldModifierName(fieldModifier)
///@description Getter.
///@param {FieldModifier} fieldModifier
///@return {String} name 
///@throws {Exception}
///@generated {2021-08-09T17:10:20.103Z}

function getFieldModifierName(fieldModifier) {

	return fieldModifier[@ 0];
	
}

///@function getFieldModifierType(fieldModifier)
///@description Getter.
///@param {FieldModifier} fieldModifier
///@return {GridEventFieldType} type 
///@throws {Exception}
///@generated {2021-08-09T17:10:20.103Z}

function getFieldModifierType(fieldModifier) {

	return fieldModifier[@ 1];
	
}
///@function getFieldModifierValue(fieldModifier)
///@description Getter.
///@param {FieldModifier} fieldModifier
///@return {any} value 
///@throws {Exception}
///@generated {2021-08-09T17:10:20.103Z}

function getFieldModifierValue(fieldModifier) {

	return fieldModifier[@ 2];
	
}
///@function setFieldModifierDuration(fieldModifier, duration)
///@description Setter.
///@param {FieldModifier} fieldModifier
///@param {Optional<Number>} duration
///@throws {Exception}
///@generated {2021-08-09T17:10:20.103Z}

function setFieldModifierDuration(fieldModifier, duration) {

	fieldModifier[@ 3] = duration;
	
}
///@function setFieldModifierName(fieldModifier, name)
///@description Setter.
///@param {FieldModifier} fieldModifier
///@param {String} name
///@throws {Exception}
///@generated {2021-08-09T17:10:20.103Z}

function setFieldModifierName(fieldModifier, name) {

	fieldModifier[@ 0] = name;
	
}
///@function setFieldModifierType(fieldModifier, type)
///@description Setter.
///@param {FieldModifier} fieldModifier
///@param {GridEventFieldType} type
///@throws {Exception}
///@generated {2021-08-09T17:10:20.103Z}

function setFieldModifierType(fieldModifier, type) {

	fieldModifier[@ 1] = type;
	
}
///@function setFieldModifierValue(fieldModifier, value)
///@description Setter.
///@param {FieldModifier} fieldModifier
///@param {any} value
///@throws {Exception}
///@generated {2021-08-09T17:10:20.103Z}

function setFieldModifierValue(fieldModifier, value) {

	fieldModifier[@ 2] = value;
	
}

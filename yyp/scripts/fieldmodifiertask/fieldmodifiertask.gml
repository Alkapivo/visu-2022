///@description FieldModifierTask entity

///@function createFieldModifierTask(instance, fieldName, targetValue, factorValue, factorFrequency, currentTick)
///@description Constructor for FieldModifierTask entity.
///@param {Instance} instance
///@param {String} fieldName
///@param {Number} targetValue
///@param {Number} factorValue
///@param {Number} factorFrequency
///@param {Integer} currentTick
///@return {FieldModifierTask} fieldModifierTask 
///@throws {Exception}
///@generated {2020-09-22T10:33:22.255Z}
function createFieldModifierTask(argument0, argument1, argument2, argument3, argument4, argument5) {

		var instance = argument0;
		var fieldName = argument1;
		var targetValue = argument2;
		var factorValue = argument3;
		var factorFrequency = argument4;
		var currentTick = argument5;
	
		var fieldModifierTask = createEntity(FieldModifierTask);

		setFieldModifierTaskInstance(fieldModifierTask, assertNoOptional(instance));
		setFieldModifierTaskFieldName(fieldModifierTask, assertNoOptional(fieldName));
		setFieldModifierTaskTargetValue(fieldModifierTask, assertNoOptional(targetValue));
		setFieldModifierTaskFactorValue(fieldModifierTask, assertNoOptional(factorValue));
		setFieldModifierTaskFactorFrequency(fieldModifierTask, assertNoOptional(factorFrequency));
		setFieldModifierTaskCurrentTick(fieldModifierTask, assertNoOptional(currentTick));

		return fieldModifierTask;
	



}
///@function serializeFieldModifierTask(fieldModifierTask)
///@description Serialize FieldModifierTask to JSON string.
///@param {FieldModifierTask} fieldModifierTask
///@return {String} fieldModifierTaskJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:41.273Z}
function serializeFieldModifierTask(argument0) {

		var fieldModifierTask = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"instance",
			getFieldModifierTaskInstance(fieldModifierTask));	
		appendFieldToJsonObject(
			jsonObject,
			"fieldName",
			getFieldModifierTaskFieldName(fieldModifierTask));	
		appendFieldToJsonObject(
			jsonObject,
			"targetValue",
			getFieldModifierTaskTargetValue(fieldModifierTask));	
		appendFieldToJsonObject(
			jsonObject,
			"factorValue",
			getFieldModifierTaskFactorValue(fieldModifierTask));	
		appendFieldToJsonObject(
			jsonObject,
			"factorFrequency",
			getFieldModifierTaskFactorFrequency(fieldModifierTask));	
		appendFieldToJsonObject(
			jsonObject,
			"currentTick",
			getFieldModifierTaskCurrentTick(fieldModifierTask));	

		var fieldModifierTaskJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return fieldModifierTaskJsonString;
	



}
///@function deserializeFieldModifierTask(jsonString)
///@description Deserialize FieldModifierTask from JSON String to FieldModifierTask entity.
///@param {String} jsonString
///@return {FieldModifierTask} fieldModifierTask 
///@throws {Exception}
///@generated {2020-09-22T10:33:22.256Z}
function deserializeFieldModifierTask(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var instance = assertNoOptional(getJsonObjectFieldValue(jsonObject, "instance"));
		var fieldName = assertNoOptional(getJsonObjectFieldValue(jsonObject, "fieldName"));
		var targetValue = assertNoOptional(getJsonObjectFieldValue(jsonObject, "targetValue"));
		var factorValue = assertNoOptional(getJsonObjectFieldValue(jsonObject, "factorValue"));
		var factorFrequency = assertNoOptional(getJsonObjectFieldValue(jsonObject, "factorFrequency"));
		var currentTick = assertNoOptional(getJsonObjectFieldValue(jsonObject, "currentTick"));

		destroyJsonObject(jsonObject);
	
		return createFieldModifierTask(instance, fieldName, targetValue, factorValue, factorFrequency, currentTick);
	



}
///@function destroyFieldModifierTask(fieldModifierTask)
///@description Destroy FieldModifierTask entity.
///@param {FieldModifierTask} fieldModifierTask
///@throws {Exception}
///@generated {2020-09-22T10:33:22.256Z}
function destroyFieldModifierTask(argument0) {

		var fieldModifierTask = argument0;
	
		var instance = getFieldModifierTaskInstance(fieldModifierTask);
		var fieldName = getFieldModifierTaskFieldName(fieldModifierTask);
		var targetValue = getFieldModifierTaskTargetValue(fieldModifierTask);
		var factorValue = getFieldModifierTaskFactorValue(fieldModifierTask);
		var factorFrequency = getFieldModifierTaskFactorFrequency(fieldModifierTask);
		var currentTick = getFieldModifierTaskCurrentTick(fieldModifierTask);
	

	



}
///@function getFieldModifierTaskCurrentTick(fieldModifierTask)
///@description Getter.
///@param {FieldModifierTask} fieldModifierTask
///@return {Integer} currentTick 
///@throws {Exception}
///@generated {2020-09-22T10:33:22.256Z}
function getFieldModifierTaskCurrentTick(argument0) {

		return argument0[@ 5];
	



}
///@function getFieldModifierTaskFactorFrequency(fieldModifierTask)
///@description Getter.
///@param {FieldModifierTask} fieldModifierTask
///@return {Number} factorFrequency 
///@throws {Exception}
///@generated {2020-09-22T10:33:22.256Z}
function getFieldModifierTaskFactorFrequency(argument0) {

		return argument0[@ 4];
	



}
///@function getFieldModifierTaskFactorValue(fieldModifierTask)
///@description Getter.
///@param {FieldModifierTask} fieldModifierTask
///@return {Number} factorValue 
///@throws {Exception}
///@generated {2020-09-22T10:33:03.192Z}
function getFieldModifierTaskFactorValue(argument0) {

		return argument0[@ 3];
	



}
///@function getFieldModifierTaskFieldName(fieldModifierTask)
///@description Getter.
///@param {FieldModifierTask} fieldModifierTask
///@return {String} fieldName 
///@throws {Exception}
///@generated {2020-09-22T10:33:03.192Z}
function getFieldModifierTaskFieldName(argument0) {

		return argument0[@ 1];
	



}
///@function getFieldModifierTaskInstance(fieldModifierTask)
///@description Getter.
///@param {FieldModifierTask} fieldModifierTask
///@return {Instance} instance 
///@throws {Exception}
///@generated {2020-09-22T10:33:03.192Z}
function getFieldModifierTaskInstance(argument0) {

		return argument0[@ 0];
	



}
///@function getFieldModifierTaskTargetValue(fieldModifierTask)
///@description Getter.
///@param {FieldModifierTask} fieldModifierTask
///@return {Number} targetValue 
///@throws {Exception}
///@generated {2020-09-22T10:33:03.192Z}
function getFieldModifierTaskTargetValue(argument0) {

		return argument0[@ 2];
	



}
///@function setFieldModifierTaskCurrentTick(fieldModifierTask, currentTick)
///@description Setter.
///@param {FieldModifierTask} fieldModifierTask
///@param {Integer} currentTick
///@throws {Exception}
///@generated {2020-09-22T10:33:22.257Z}
function setFieldModifierTaskCurrentTick(argument0, argument1) {

		argument0[@ 5] = argument1;
	



}
///@function setFieldModifierTaskFactorFrequency(fieldModifierTask, factorFrequency)
///@description Setter.
///@param {FieldModifierTask} fieldModifierTask
///@param {Number} factorFrequency
///@throws {Exception}
///@generated {2020-09-22T10:33:22.257Z}
function setFieldModifierTaskFactorFrequency(argument0, argument1) {

		argument0[@ 4] = argument1;
	



}
///@function setFieldModifierTaskFactorValue(fieldModifierTask, factorValue)
///@description Setter.
///@param {FieldModifierTask} fieldModifierTask
///@param {Number} factorValue
///@throws {Exception}
///@generated {2020-09-22T10:33:22.257Z}
function setFieldModifierTaskFactorValue(argument0, argument1) {

		argument0[@ 3] = argument1;
	



}
///@function setFieldModifierTaskFieldName(fieldModifierTask, fieldName)
///@description Setter.
///@param {FieldModifierTask} fieldModifierTask
///@param {String} fieldName
///@throws {Exception}
///@generated {2020-09-22T10:33:22.257Z}
function setFieldModifierTaskFieldName(argument0, argument1) {

		argument0[@ 1] = argument1;
	



}
///@function setFieldModifierTaskInstance(fieldModifierTask, instance)
///@description Setter.
///@param {FieldModifierTask} fieldModifierTask
///@param {Instance} instance
///@throws {Exception}
///@generated {2020-09-22T10:33:22.257Z}
function setFieldModifierTaskInstance(argument0, argument1) {

		argument0[@ 0] = argument1;
	



}
///@function setFieldModifierTaskTargetValue(fieldModifierTask, targetValue)
///@description Setter.
///@param {FieldModifierTask} fieldModifierTask
///@param {Number} targetValue
///@throws {Exception}
///@generated {2020-09-22T10:33:22.257Z}
function setFieldModifierTaskTargetValue(argument0, argument1) {

		argument0[@ 2] = argument1;
	



}

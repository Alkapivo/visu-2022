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

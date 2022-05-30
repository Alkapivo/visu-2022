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

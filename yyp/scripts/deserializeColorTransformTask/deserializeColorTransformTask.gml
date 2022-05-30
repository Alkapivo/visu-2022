///@function deserializeColorTransformTask(jsonString)
///@description Deserialize ColorTransformTask from JSON String to ColorTransformTask entity.
///@param {String} jsonString
///@return {ColorTransformTask} colorTransformTask 
///@throws {Exception}
///@generated {2020-10-11T13:38:08.747Z}
function deserializeColorTransformTask(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var fieldName = assertNoOptional(getJsonObjectFieldValue(jsonObject, "fieldName"));
		var targetColor = assertNoOptional(getJsonObjectFieldValue(jsonObject, "targetColor", Entity, "Color"));
		var changeFactor = assertNoOptional(getJsonObjectFieldValue(jsonObject, "changeFactor"));

		destroyJsonObject(jsonObject);
	
		return createColorTransformTask(fieldName, targetColor, changeFactor);
	



}

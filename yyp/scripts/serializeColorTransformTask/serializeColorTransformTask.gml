///@function serializeColorTransformTask(colorTransformTask)
///@description Serialize ColorTransformTask to JSON string.
///@param {ColorTransformTask} colorTransformTask
///@return {String} colorTransformTaskJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:41.222Z}
function serializeColorTransformTask(argument0) {

		var colorTransformTask = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"fieldName",
			getColorTransformTaskFieldName(colorTransformTask));	
		appendEntityToJsonObject(
			jsonObject,
			"targetColor",
			getColorTransformTaskTargetColor(colorTransformTask),
			"Color");
	
		appendFieldToJsonObject(
			jsonObject,
			"changeFactor",
			getColorTransformTaskChangeFactor(colorTransformTask));	

		var colorTransformTaskJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return colorTransformTaskJsonString;
	



}

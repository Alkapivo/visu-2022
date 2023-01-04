///@description ColorTransformTask entity

///@function createColorTransformTask(fieldName, targetColor, changeFactor)
///@description Constructor for ColorTransformTask entity.
///@param {String} fieldName
///@param {Color} targetColor
///@param {Number} changeFactor
///@return {ColorTransformTask} colorTransformTask 
///@throws {Exception}
///@generated {2020-09-28T21:26:20.192Z}
function createColorTransformTask(argument0, argument1, argument2) {

		var fieldName = argument0;
		var targetColor = argument1;
		var changeFactor = argument2;
	
		var colorTransformTask = createEntity(ColorTransformTask);

		setColorTransformTaskFieldName(colorTransformTask, assertNoOptional(fieldName));
		setColorTransformTaskTargetColor(colorTransformTask, assertNoOptional(targetColor));
		setColorTransformTaskChangeFactor(colorTransformTask, assertNoOptional(changeFactor));

		return colorTransformTask;
	



}
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
///@function destroyColorTransformTask(colorTransformTask)
///@description Destroy ColorTransformTask entity.
///@param {ColorTransformTask} colorTransformTask
///@throws {Exception}
///@generated {2020-10-11T13:38:08.747Z}
function destroyColorTransformTask(argument0) {

		var colorTransformTask = argument0;
	
		var fieldName = getColorTransformTaskFieldName(colorTransformTask);
		var targetColor = getColorTransformTaskTargetColor(colorTransformTask);
		var changeFactor = getColorTransformTaskChangeFactor(colorTransformTask);
	
		destroyColor(targetColor);
		setColorTransformTaskTargetColor(colorTransformTask, null);
	

	



}
///@function getColorTransformTaskChangeFactor(colorTransformTask)
///@description Getter.
///@param {ColorTransformTask} colorTransformTask
///@return {Number} changeFactor 
///@throws {Exception}
///@generated {2020-09-28T21:26:20.192Z}
function getColorTransformTaskChangeFactor(argument0) {

		return argument0[@ 2];
	



}
///@function getColorTransformTaskFieldName(colorTransformTask)
///@description Getter.
///@param {ColorTransformTask} colorTransformTask
///@return {String} fieldName 
///@throws {Exception}
///@generated {2020-09-28T21:26:20.192Z}
function getColorTransformTaskFieldName(argument0) {

		return argument0[@ 0];
	



}
///@function getColorTransformTaskTargetColor(colorTransformTask)
///@description Getter.
///@param {ColorTransformTask} colorTransformTask
///@return {Color} targetColor 
///@throws {Exception}
///@generated {2020-09-28T21:26:20.192Z}
function getColorTransformTaskTargetColor(argument0) {

		return argument0[@ 1];
	



}
///@function setColorTransformTaskChangeFactor(colorTransformTask, changeFactor)
///@description Setter.
///@param {ColorTransformTask} colorTransformTask
///@param {Number} changeFactor
///@throws {Exception}
///@generated {2020-09-28T21:26:20.192Z}
function setColorTransformTaskChangeFactor(argument0, argument1) {

		argument0[@ 2] = argument1;
	



}
///@function setColorTransformTaskFieldName(colorTransformTask, fieldName)
///@description Setter.
///@param {ColorTransformTask} colorTransformTask
///@param {String} fieldName
///@throws {Exception}
///@generated {2020-09-28T21:26:20.192Z}
function setColorTransformTaskFieldName(argument0, argument1) {

		argument0[@ 0] = argument1;
	



}
///@function setColorTransformTaskTargetColor(colorTransformTask, targetColor)
///@description Setter.
///@param {ColorTransformTask} colorTransformTask
///@param {Color} targetColor
///@throws {Exception}
///@generated {2020-09-28T21:26:20.192Z}
function setColorTransformTaskTargetColor(argument0, argument1) {

		argument0[@ 1] = argument1;
	



}

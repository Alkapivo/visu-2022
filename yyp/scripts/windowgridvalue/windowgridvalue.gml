///@description WindowGridValue entity

///@function createWindowGridValue(data, type, color)
///@description Constructor for WindowGridValue entity.
///@param {String} data
///@param {WindowGridValueType} type
///@param {Color} color
///@return {WindowGridValue} windowGridValue 
///@throws {Exception}
///@generated {2020-09-28T21:11:55.546Z}
function createWindowGridValue(argument0, argument1, argument2) {

		var data = argument0;
		var type = argument1;
		var color = argument2;
	
		var windowGridValue = createEntity(WindowGridValue);

		setWindowGridValueData(windowGridValue, assertNoOptional(data));
		setWindowGridValueType(windowGridValue, assertNoOptional(type));
		setWindowGridValueColor(windowGridValue, assertNoOptional(color));

		return windowGridValue;
	



}
///@function serializeWindowGridValue(windowGridValue)
///@description Serialize WindowGridValue to JSON string.
///@param {WindowGridValue} windowGridValue
///@return {String} windowGridValueJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:41.573Z}
function serializeWindowGridValue(argument0) {

		var windowGridValue = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"data",
			getWindowGridValueData(windowGridValue));	
		appendFieldToJsonObject(
			jsonObject,
			"type",
			getWindowGridValueType(windowGridValue));	
		appendEntityToJsonObject(
			jsonObject,
			"color",
			getWindowGridValueColor(windowGridValue),
			"Color");
	

		var windowGridValueJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return windowGridValueJsonString;
	



}
///@function deserializeWindowGridValue(jsonString)
///@description Deserialize WindowGridValue from JSON String to WindowGridValue entity.
///@param {String} jsonString
///@return {WindowGridValue} windowGridValue 
///@throws {Exception}
///@generated {2020-09-28T21:12:27.906Z}
function deserializeWindowGridValue(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var data = assertNoOptional(getJsonObjectFieldValue(jsonObject, "data"));
		var type = assertNoOptional(getJsonObjectFieldValue(jsonObject, "type"));
		var color = assertNoOptional(getJsonObjectFieldValue(jsonObject, "color", Entity, "Color"));

		destroyJsonObject(jsonObject);
	
		return createWindowGridValue(data, type, color);
	



}
///@function destroyWindowGridValue(windowGridValue)
///@description Destroy WindowGridValue entity.
///@param {WindowGridValue} windowGridValue
///@throws {Exception}
///@generated {2020-09-28T21:12:27.906Z}
function destroyWindowGridValue(argument0) {

		var windowGridValue = argument0;
	
		var data = getWindowGridValueData(windowGridValue);
		var type = getWindowGridValueType(windowGridValue);
		var color = getWindowGridValueColor(windowGridValue);
	
		destroyColor(color);
		setWindowGridValueColor(windowGridValue, null);
	

	



}
///@function getWindowGridValueColor(windowGridValue)
///@description Getter.
///@param {WindowGridValue} windowGridValue
///@return {Color} color 
///@throws {Exception}
///@generated {2020-09-28T21:12:27.906Z}
function getWindowGridValueColor(argument0) {

		return argument0[@ 2];
	



}
///@function getWindowGridValueData(windowGridValue)
///@description Getter.
///@param {WindowGridValue} windowGridValue
///@return {String} data 
///@throws {Exception}
///@generated {2020-09-28T21:12:27.906Z}
function getWindowGridValueData(argument0) {

		return argument0[@ 0];
	



}
///@function getWindowGridValueType(windowGridValue)
///@description Getter.
///@param {WindowGridValue} windowGridValue
///@return {WindowGridValueType} type 
///@throws {Exception}
///@generated {2020-09-28T21:12:27.906Z}
function getWindowGridValueType(argument0) {

		return argument0[@ 1];
	



}
///@function setWindowGridValueColor(windowGridValue, color)
///@description Setter.
///@param {WindowGridValue} windowGridValue
///@param {Color} color
///@throws {Exception}
///@generated {2020-09-28T21:12:27.906Z}
function setWindowGridValueColor(argument0, argument1) {

		argument0[@ 2] = argument1;
	



}
///@function setWindowGridValueData(windowGridValue, data)
///@description Setter.
///@param {WindowGridValue} windowGridValue
///@param {String} data
///@throws {Exception}
///@generated {2020-09-28T21:12:27.906Z}
function setWindowGridValueData(argument0, argument1) {

		argument0[@ 0] = argument1;
	



}
///@function setWindowGridValueType(windowGridValue, type)
///@description Setter.
///@param {WindowGridValue} windowGridValue
///@param {WindowGridValueType} type
///@throws {Exception}
///@generated {2020-09-28T21:12:27.906Z}
function setWindowGridValueType(argument0, argument1) {

		argument0[@ 1] = argument1;
	



}

///@description Rectangle entity

///@function createRectangle(xBegin, yBegin, xEnd, yEnd)
///@description Constructor for Rectangle entity.
///@param {Number} xBegin
///@param {Number} yBegin
///@param {Number} xEnd
///@param {Number} yEnd
///@return {Rectangle} rectangle 
///@throws {Exception}
///@generated {2020-08-10T23:26:00.246Z}
function createRectangle(argument0, argument1, argument2, argument3) {

		var xBegin = argument0;
		var yBegin = argument1;
		var xEnd = argument2;
		var yEnd = argument3;
	
		var rectangle = createEntity(Rectangle);

		setRectangleXBegin(rectangle, assertNoOptional(xBegin));
		setRectangleYBegin(rectangle, assertNoOptional(yBegin));
		setRectangleXEnd(rectangle, assertNoOptional(xEnd));
		setRectangleYEnd(rectangle, assertNoOptional(yEnd));

		return rectangle;
	



}
///@function serializeRectangle(rectangle)
///@description Serialize Rectangle to JSON string.
///@param {Rectangle} rectangle
///@return {String} rectangleJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:41.121Z}
function serializeRectangle(argument0) {

		var rectangle = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"xBegin",
			getRectangleXBegin(rectangle));	
		appendFieldToJsonObject(
			jsonObject,
			"yBegin",
			getRectangleYBegin(rectangle));	
		appendFieldToJsonObject(
			jsonObject,
			"xEnd",
			getRectangleXEnd(rectangle));	
		appendFieldToJsonObject(
			jsonObject,
			"yEnd",
			getRectangleYEnd(rectangle));	

		var rectangleJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return rectangleJsonString;
	



}
///@function deserializeRectangle(jsonString)
///@description Deserialize Rectangle from JSON String to Rectangle entity.
///@param {String} jsonString
///@return {Rectangle} rectangle 
///@throws {Exception}
///@generated {2020-08-10T23:26:00.246Z}
function deserializeRectangle(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var xBegin = assertNoOptional(getJsonObjectFieldValue(jsonObject, "xBegin"));
		var yBegin = assertNoOptional(getJsonObjectFieldValue(jsonObject, "yBegin"));
		var xEnd = assertNoOptional(getJsonObjectFieldValue(jsonObject, "xEnd"));
		var yEnd = assertNoOptional(getJsonObjectFieldValue(jsonObject, "yEnd"));

		destroyJsonObject(jsonObject);
	
		return createRectangle(xBegin, yBegin, xEnd, yEnd);
	



}
///@function destroyRectangle(rectangle)
///@description Destroy Rectangle entity.
///@param {Rectangle} rectangle
///@throws {Exception}
///@generated {2020-08-10T23:26:00.246Z}
function destroyRectangle(argument0) {

		var rectangle = argument0;
	
		var xBegin = getRectangleXBegin(rectangle);
		var yBegin = getRectangleYBegin(rectangle);
		var xEnd = getRectangleXEnd(rectangle);
		var yEnd = getRectangleYEnd(rectangle);
	

	



}
///@function getRectangleXBegin(rectangle)
///@description Getter.
///@param {Rectangle} rectangle
///@return {Number} xBegin 
///@throws {Exception}
///@generated {2020-08-10T23:26:00.246Z}
function getRectangleXBegin(argument0) {

		return argument0[@ 0];
	



}
///@function getRectangleXEnd(rectangle)
///@description Getter.
///@param {Rectangle} rectangle
///@return {Number} xEnd 
///@throws {Exception}
///@generated {2020-08-10T23:26:00.246Z}
function getRectangleXEnd(argument0) {

		return argument0[@ 2];
	



}
///@function getRectangleYBegin(rectangle)
///@description Getter.
///@param {Rectangle} rectangle
///@return {Number} yBegin 
///@throws {Exception}
///@generated {2020-08-10T23:26:00.246Z}
function getRectangleYBegin(argument0) {

		return argument0[@ 1];
	



}
///@function getRectangleYEnd(rectangle)
///@description Getter.
///@param {Rectangle} rectangle
///@return {Number} yEnd 
///@throws {Exception}
///@generated {2020-08-10T23:26:00.246Z}
function getRectangleYEnd(argument0) {

		return argument0[@ 3];
	



}
///@function setRectangleXBegin(rectangle, xBegin)
///@description Setter.
///@param {Rectangle} rectangle
///@param {Number} xBegin
///@throws {Exception}
///@generated {2020-08-10T23:26:00.246Z}
function setRectangleXBegin(argument0, argument1) {

		argument0[@ 0] = argument1;
	



}
///@function setRectangleXEnd(rectangle, xEnd)
///@description Setter.
///@param {Rectangle} rectangle
///@param {Number} xEnd
///@throws {Exception}
///@generated {2020-08-10T23:26:00.246Z}
function setRectangleXEnd(argument0, argument1) {

		argument0[@ 2] = argument1;
	



}
///@function setRectangleYBegin(rectangle, yBegin)
///@description Setter.
///@param {Rectangle} rectangle
///@param {Number} yBegin
///@throws {Exception}
///@generated {2020-08-10T23:26:00.246Z}
function setRectangleYBegin(argument0, argument1) {

		argument0[@ 1] = argument1;
	



}
///@function setRectangleYEnd(rectangle, yEnd)
///@description Setter.
///@param {Rectangle} rectangle
///@param {Number} yEnd
///@throws {Exception}
///@generated {2020-08-10T23:26:00.246Z}
function setRectangleYEnd(argument0, argument1) {

		argument0[@ 3] = argument1;
	



}

///@description Margin entity

///@function createMargin(top, right, bottom, left)
///@description Constructor for Margin entity.
///@param {Number} top
///@param {Number} right
///@param {Number} bottom
///@param {Number} left
///@return {Margin} margin 
///@throws {Exception}
///@generated {2020-09-28T21:11:55.446Z}
function createMargin(argument0, argument1, argument2, argument3) {

		var top = argument0;
		var right = argument1;
		var bottom = argument2;
		var left = argument3;
	
		var margin = createEntity(Margin);

		setMarginTop(margin, assertNoOptional(top));
		setMarginRight(margin, assertNoOptional(right));
		setMarginBottom(margin, assertNoOptional(bottom));
		setMarginLeft(margin, assertNoOptional(left));

		return margin;
	



}
///@function serializeMargin(margin)
///@description Serialize Margin to JSON string.
///@param {Margin} margin
///@return {String} marginJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:41.557Z}
function serializeMargin(argument0) {

		var margin = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"top",
			getMarginTop(margin));	
		appendFieldToJsonObject(
			jsonObject,
			"right",
			getMarginRight(margin));	
		appendFieldToJsonObject(
			jsonObject,
			"bottom",
			getMarginBottom(margin));	
		appendFieldToJsonObject(
			jsonObject,
			"left",
			getMarginLeft(margin));	

		var marginJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return marginJsonString;
	



}
///@function deserializeMargin(jsonString)
///@description Deserialize Margin from JSON String to Margin entity.
///@param {String} jsonString
///@return {Margin} margin 
///@throws {Exception}
///@generated {2020-09-28T21:11:55.446Z}
function deserializeMargin(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var top = assertNoOptional(getJsonObjectFieldValue(jsonObject, "top"));
		var right = assertNoOptional(getJsonObjectFieldValue(jsonObject, "right"));
		var bottom = assertNoOptional(getJsonObjectFieldValue(jsonObject, "bottom"));
		var left = assertNoOptional(getJsonObjectFieldValue(jsonObject, "left"));

		destroyJsonObject(jsonObject);
	
		return createMargin(top, right, bottom, left);
	



}
///@function destroyMargin(margin)
///@description Destroy Margin entity.
///@param {Margin} margin
///@throws {Exception}
///@generated {2020-09-28T21:11:55.446Z}
function destroyMargin(argument0) {

		var margin = argument0;
	
		var top = getMarginTop(margin);
		var right = getMarginRight(margin);
		var bottom = getMarginBottom(margin);
		var left = getMarginLeft(margin);
	

	



}
///@function getMarginBottom(margin)
///@description Getter.
///@param {Margin} margin
///@return {Number} bottom 
///@throws {Exception}
///@generated {2020-09-28T21:11:55.446Z}
function getMarginBottom(argument0) {

		return argument0[@ 2];
	



}
///@function getMarginLeft(margin)
///@description Getter.
///@param {Margin} margin
///@return {Number} left 
///@throws {Exception}
///@generated {2020-09-28T21:11:55.446Z}
function getMarginLeft(argument0) {

		return argument0[@ 3];
	



}
///@function getMarginRight(margin)
///@description Getter.
///@param {Margin} margin
///@return {Number} right 
///@throws {Exception}
///@generated {2020-09-28T21:11:55.446Z}
function getMarginRight(argument0) {

		return argument0[@ 1];
	



}
///@function getMarginTop(margin)
///@description Getter.
///@param {Margin} margin
///@return {Number} top 
///@throws {Exception}
///@generated {2020-09-28T21:11:55.446Z}
function getMarginTop(argument0) {

		return argument0[@ 0];
	



}
///@function setMarginBottom(margin, bottom)
///@description Setter.
///@param {Margin} margin
///@param {Number} bottom
///@throws {Exception}
///@generated {2020-09-28T21:11:55.446Z}
function setMarginBottom(argument0, argument1) {

		argument0[@ 2] = argument1;
	



}
///@function setMarginLeft(margin, left)
///@description Setter.
///@param {Margin} margin
///@param {Number} left
///@throws {Exception}
///@generated {2020-09-28T21:11:55.446Z}
function setMarginLeft(argument0, argument1) {

		argument0[@ 3] = argument1;
	



}
///@function setMarginRight(margin, right)
///@description Setter.
///@param {Margin} margin
///@param {Number} right
///@throws {Exception}
///@generated {2020-09-28T21:11:55.446Z}
function setMarginRight(argument0, argument1) {

		argument0[@ 1] = argument1;
	



}
///@function setMarginTop(margin, top)
///@description Setter.
///@param {Margin} margin
///@param {Number} top
///@throws {Exception}
///@generated {2020-09-28T21:11:55.446Z}
function setMarginTop(argument0, argument1) {

		argument0[@ 0] = argument1;
	



}

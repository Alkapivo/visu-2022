///@description Color entity

///@function createColor(red, green, blue, alpha)
///@description Constructor for Color entity.
///@param {Number} red
///@param {Number} green
///@param {Number} blue
///@param {Number} alpha
///@return {Color} color 
///@throws {Exception}
///@generated {2020-09-28T21:11:14.663Z}
function createColor(argument0, argument1, argument2, argument3) {

		var red = argument0;
		var green = argument1;
		var blue = argument2;
		var alpha = argument3;
	
		var color = createEntity(Color);

		setColorRed(color, assertNoOptional(red));
		setColorGreen(color, assertNoOptional(green));
		setColorBlue(color, assertNoOptional(blue));
		setColorAlpha(color, assertNoOptional(alpha));

		return color;
	



}
///@function serializeColor(color)
///@description Serialize Color to JSON string.
///@param {Color} color
///@return {String} colorJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:40.704Z}
function serializeColor(argument0) {

		var color = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"red",
			getColorRed(color));	
		appendFieldToJsonObject(
			jsonObject,
			"green",
			getColorGreen(color));	
		appendFieldToJsonObject(
			jsonObject,
			"blue",
			getColorBlue(color));	
		appendFieldToJsonObject(
			jsonObject,
			"alpha",
			getColorAlpha(color));	

		var colorJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return colorJsonString;
	



}
///@function deserializeColor(jsonString)
///@description Deserialize Color from JSON String to Color entity.
///@param {String} jsonString
///@return {Color} color 
///@throws {Exception}
///@generated {2020-09-28T21:11:14.663Z}
///@override
function deserializeColor(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var red = assertNoOptional(getJsonObjectFieldValue(jsonObject, "red"));
		var green = assertNoOptional(getJsonObjectFieldValue(jsonObject, "green"));
		var blue = assertNoOptional(getJsonObjectFieldValue(jsonObject, "blue"));
	
	#region @override
		var alpha = getJsonObjectFieldValue(jsonObject, "alpha");
		if (!isOptionalPresent(alpha)) {
		
			alpha = 1.0;
		}
	#endregion

		destroyJsonObject(jsonObject);
	
		return createColor(red, green, blue, alpha);
	



}
///@function destroyColor(color)
///@description Destroy Color entity.
///@param {Color} color
///@throws {Exception}
///@generated {2020-09-28T21:11:14.663Z}
///@override
function destroyColor(argument0) {

		var color = argument0;
	



}
///@function getColorAlpha(color)
///@description Getter.
///@param {Color} color
///@return {Number} alpha 
///@throws {Exception}
///@generated {2020-09-28T21:11:14.664Z}
function getColorAlpha(argument0) {

		return argument0[@ 3];
	



}
///@function getColorBlue(color)
///@description Getter.
///@param {Color} color
///@return {Number} blue 
///@throws {Exception}
///@generated {2020-09-28T21:11:14.664Z}
function getColorBlue(argument0) {

		return argument0[@ 2];
	



}
///@function getColorGreen(color)
///@description Getter.
///@param {Color} color
///@return {Number} green 
///@throws {Exception}
///@generated {2020-09-28T21:11:14.664Z}
function getColorGreen(argument0) {

		return argument0[@ 1];
	



}
///@function getColorRed(color)
///@description Getter.
///@param {Color} color
///@return {Number} red 
///@throws {Exception}
///@generated {2020-09-28T21:11:14.664Z}
function getColorRed(argument0) {

		return argument0[@ 0];
	



}

///@function setColorAlpha(color, alpha)
///@description Setter.
///@param {Color} color
///@param {Number} alpha
///@throws {Exception}
///@generated {2020-09-28T21:11:14.664Z}
function setColorAlpha(argument0, argument1) {

		argument0[@ 3] = argument1;
	



}
///@function setColorBlue(color, blue)
///@description Setter.
///@param {Color} color
///@param {Number} blue
///@throws {Exception}
///@generated {2020-09-28T21:11:14.664Z}
function setColorBlue(argument0, argument1) {

		argument0[@ 2] = argument1;
	



}
///@function setColorGreen(color, green)
///@description Setter.
///@param {Color} color
///@param {Number} green
///@throws {Exception}
///@generated {2020-09-28T21:11:14.664Z}
function setColorGreen(argument0, argument1) {

		argument0[@ 1] = argument1;
	



}
///@function setColorRed(color, red)
///@description Setter.
///@param {Color} color
///@param {Number} red
///@throws {Exception}
///@generated {2020-09-28T21:11:14.664Z}
function setColorRed(argument0, argument1) {

		argument0[@ 0] = argument1;
	



}

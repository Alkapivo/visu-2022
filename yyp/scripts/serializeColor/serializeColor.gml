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

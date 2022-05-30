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

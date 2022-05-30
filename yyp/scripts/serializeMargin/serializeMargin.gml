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

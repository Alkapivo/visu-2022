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

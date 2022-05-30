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

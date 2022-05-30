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

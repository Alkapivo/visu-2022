///@function deserializePosition(jsonString)
///@description Deserialize Position from JSON String to Position entity.
///@param {String} jsonString
///@return {Position} position 
///@throws {Exception}
///@generated {2020-09-28T21:11:14.762Z}
function deserializePosition(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var horizontal = assertNoOptional(getJsonObjectFieldValue(jsonObject, "horizontal"));
		var vertical = assertNoOptional(getJsonObjectFieldValue(jsonObject, "vertical"));

		destroyJsonObject(jsonObject);
	
		return createPosition(horizontal, vertical);
	



}

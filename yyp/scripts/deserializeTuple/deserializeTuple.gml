///@function deserializeTuple(jsonString)
///@description Deserialize Tuple from JSON String to Tuple entity.
///@param {String} jsonString
///@return {Tuple} tuple 
///@throws {Exception}
///@generated {2020-07-01T13:57:12.901Z}
function deserializeTuple(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var key = getJsonObjectFieldValue(jsonObject, "key");
		var value = getJsonObjectFieldValue(jsonObject, "value");

		return createTuple(key, value);
	



}

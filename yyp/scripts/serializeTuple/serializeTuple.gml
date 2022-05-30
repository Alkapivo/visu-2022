///@function serializeTuple(tuple)
///@description Serialize Tuple to JSON string.
///@param {Tuple} tuple
///@return {String} tupleJsonString 
///@throws {Exception}
///@generated {2020-07-01T13:57:12.901Z}
function serializeTuple(argument0) {

		var tuple = argument0;
	
		var jsonObject = createJsonObject();

		if (isOptionalPresent(getTupleKey(tuple))) {
			appendFieldToJsonObject(
				jsonObject,
				"key",
				getTupleKey(tuple));
		}
	
		if (isOptionalPresent(getTupleValue(tuple))) {
			appendFieldToJsonObject(
				jsonObject,
				"value",
				getTupleValue(tuple));
		}
	

		var tupleJsonString = encodeJson(jsonObject);

		return tupleJsonString;
	



}

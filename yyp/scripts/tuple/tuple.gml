///@description Tuple entity

///@function createTuple(key, value)
///@description Constructor for Tuple entity.
///@param {Optional<Object>} key
///@param {Optional<Object>} value
///@return {Tuple} tuple 
///@throws {Exception}
///@generated {2020-07-01T13:57:12.901Z}
function createTuple(argument0, argument1) {

		var key = argument0;
		var value = argument1;
	
		var tuple = createEntity(Tuple);

		setTupleKey(tuple, key);
		setTupleValue(tuple, value);

		return tuple;
	



}
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
///@function destroyTuple(tuple)
///@description Destroy Tuple entity.
///@param {Tuple} tuple
///@throws {Exception}
///@generated {2020-07-01T13:57:12.901Z}
function destroyTuple(argument0) {

		var tuple = argument0;
	



}
///@function getTupleKey(tuple)
///@description Getter.
///@param {Tuple} tuple
///@return {Optional<Object>} key 
///@throws {Exception}
///@generated {2020-07-01T13:57:12.901Z}
function getTupleKey(argument0) {

		return argument0[@ 0];
	



}
///@function getTupleValue(tuple)
///@description Getter.
///@param {Tuple} tuple
///@return {Optional<Object>} value 
///@throws {Exception}
///@generated {2020-07-01T13:57:12.901Z}
function getTupleValue(argument0) {

		return argument0[@ 1];
	



}
///@function setTupleKey(tuple, key)
///@description Setter.
///@param {Tuple} tuple
///@param {Optional<Object>} key
///@throws {Exception}
///@generated {2020-07-01T13:57:12.901Z}
function setTupleKey(argument0, argument1) {

		argument0[@ 0] = argument1;
	



}
///@function setTupleValue(tuple, value)
///@description Setter.
///@param {Tuple} tuple
///@param {Optional<Object>} value
///@throws {Exception}
///@generated {2020-07-01T13:57:12.901Z}
function setTupleValue(argument0, argument1) {

		argument0[@ 1] = argument1;
	



}

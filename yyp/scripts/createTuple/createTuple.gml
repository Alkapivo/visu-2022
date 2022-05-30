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

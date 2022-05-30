///@function getNumericTupleDirectionBetweenKeys(source, target)
///@description Move key and value of source like move_towards_point.
///@param {Tuple<Number::Number>} source
///@param {Tuple<Number::Number>} target
///@return {Integer} direction signed ///@todo enum
function getNumericTupleDirectionBetweenKeys(argument0, argument1) {

		var source = argument0;
		var target = argument1;
	
		var currentKey = getTupleKey(source);
		var targetKey = getTupleKey(target);
		var keyDirection = sign(targetKey - currentKey);
	
		return keyDirection;
	



}

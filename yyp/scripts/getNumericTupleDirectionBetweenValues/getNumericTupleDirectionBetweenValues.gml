///@function getNumericTupleDirectionBetweenValues(source, target)
///@description Move key and value of source like move_towards_point.
///@param {Tuple<Number::Number>} source
///@param {Tuple<Number::Number>} target
///@return {Integer} direction signed ///@todo enum
function getNumericTupleDirectionBetweenValues(argument0, argument1) {

		var source = argument0;
		var target = argument1;
	
		var currentValue = getTupleValue(source);
		var targetValue = getTupleValue(target);
		var valueDirection = sign(targetValue - currentValue);
	
		return valueDirection;
	



}

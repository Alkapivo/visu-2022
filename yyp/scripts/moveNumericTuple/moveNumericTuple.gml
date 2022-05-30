///@function moveNumericTuple(source, target, moveSpeed)
///@description Move key and value of source like move_towards_point.
///@param {Tuple<Number::Number>} source
///@param {Tuple<Number::Number>} target
///@param {Number} [moveSpeed]
///@return {Tuple<Number::Number>} newTuple
function moveNumericTuple() {

		///checkArgumentCount(2, argument_count, moveNumericTuple);

		var source = argument[0];
		var target = argument[1];
		var moveSpeed = argument_count > 2 ? argument[2] : null;
	
		var newKey = null;
		var newValue = null;
		if (moveSpeed == null) {
			newKey = getTupleKey(target);
			newValue = getTupleValue(target);
		} else {
			var currentKey = getTupleKey(source);
			var currentValue = getTupleValue(source);
			var targetKey = getTupleKey(target);
			var targetValue = getTupleValue(target);
		
			var keyDirection = sign(targetKey - currentKey);
			var valueDirection = sign(targetValue - currentValue);
		
			newKey = currentKey + (keyDirection * moveSpeed * getDeltaTimeValue());
			newValue = currentKey + (valueDirection * moveSpeed * getDeltaTimeValue());
		
			var newKeyDirection = sign(targetKey - newKey);
			var newValueDirection = sign(targetValue - newValue);
		
			newKey = keyDirection != newKeyDirection ? targetKey : newKey;
			newValue = valueDirection != newValueDirection ? targetValue : newValue;
		}
	
		return createTuple(newKey, newValue);
	



}

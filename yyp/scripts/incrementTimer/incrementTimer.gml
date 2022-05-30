///@function incrementTimer(value, maxValue, [incrementBy]) 
///@description return incremented value. If value reach maxValue then return 0.
///@param {Number} value
///@param {Number} maxValue
///@param {Number} [incrementBy=1/GAME_FPS]
function incrementTimer() {

		///checkArgumentCount(2, argument_count, incrementTimer);

		var value = argument[0];
		var maxValue = argument_count > 1 ? argument[1] : MAX_NUMBER;
		var incrementBy = argument_count > 2 ? argument[2] : 1.0 / GAME_FPS;
	
		value += incrementBy * getDeltaTimeValue();
		return value >= maxValue ? 0.0 : value;
	
	


}

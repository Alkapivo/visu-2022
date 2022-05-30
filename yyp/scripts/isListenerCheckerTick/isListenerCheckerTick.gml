///@function isListenerCheckerTick(listener)
///@description Check if it's time to checkListener
///@param {Listener} listener
///@return {Boolean} isCheckerTick
function isListenerCheckerTick(argument0) {

		var listener = argument0;
	
		var frequency = getListenerFrequency(listener);
		var tick = getListenerTick(listener);
	
		return tick mod frequency == 0;
	
	


}

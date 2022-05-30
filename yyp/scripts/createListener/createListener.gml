///@function createListener(compareMethod, frequency, tick)
///@description Constructor for Listener entity.
///@param {CompareMethod} compareMethod
///@param {Number} frequency
///@param {Integer} tick
///@return {Listener} listener 
///@throws {Exception}
///@generated {2020-09-28T21:11:54.918Z}
function createListener(argument0, argument1, argument2) {

		var compareMethod = argument0;
		var frequency = argument1;
		var tick = argument2;
	
		var listener = createEntity(Listener);

		setListenerCompareMethod(listener, assertNoOptional(compareMethod));
		setListenerFrequency(listener, assertNoOptional(frequency));
		setListenerTick(listener, assertNoOptional(tick));

		return listener;
	



}

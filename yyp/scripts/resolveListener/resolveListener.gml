///@function resolveListener(listener)
///@description Update listener tick
///@param {Listener} listener
function resolveListener(argument0) {

		var listener = argument0;
	
		var tick = getListenerTick(listener);
	
		tick++;
		if (tick > room_speed) {
			tick = 0;	
		}
	
		setListenerTick(listener, tick);


}

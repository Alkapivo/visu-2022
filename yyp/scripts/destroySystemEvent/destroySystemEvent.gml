///@function destroySystemEvent(systemEvent)
///@description Destroy SystemEvent entity.
///@param {SystemEvent} systemEvent
///@throws {Exception}
///@generated {2020-10-11T13:39:40.747Z}
function destroySystemEvent(argument0) {

		var systemEvent = argument0;
	
		var type = getSystemEventType(systemEvent);
		var timer = getSystemEventTimer(systemEvent);
		var data = getSystemEventData(systemEvent);
	
		if (isOptionalPresent(data)) {
			destroyArrayMap(data);
		}
		setSystemEventData(systemEvent, null);
	

	



}

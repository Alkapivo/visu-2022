///@function createSystemEvent(type, timer, data)
///@description Constructor for SystemEvent entity.
///@param {SystemEventType} type
///@param {Number} timer
///@param {Optional<ArrayMap>} data
///@return {SystemEvent} systemEvent 
///@throws {Exception}
///@generated {2020-10-11T13:39:40.747Z}
function createSystemEvent(argument0, argument1, argument2) {

		var type = argument0;
		var timer = argument1;
		var data = argument2;
	
		var systemEvent = createEntity(SystemEvent);

		setSystemEventType(systemEvent, assertNoOptional(type));
		setSystemEventTimer(systemEvent, assertNoOptional(timer));
		setSystemEventData(systemEvent, data);

		return systemEvent;
	



}

///@function sendManagerEvent(manager, event)
///@description Send event to manager.
///@param {T?GenericManager} manager
///@param {any} event
function sendManagerEvent(argument0, argument1) {

		var manager = argument0;
		var event = argument1;
	
		var eventPipeline = getInstanceVariable(manager, FieldGenericManager_eventPipeline);
		if (isEntity(eventPipeline, Pipeline)) {
	
			addElementToPipeline(eventPipeline, event);
		}
	



}

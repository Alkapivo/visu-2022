///@function sendGenericManagerEvent(context, event)
///@description Sender.
///@param {T?GenericManager} context
///@param {T?GenericEvent} event
function sendGenericManagerEvent(argument0, argument1) {

		var context = argument0;
		var event = argument1;
	
		var managerPrototype = getGenericManagerPrototype(context);
		if (isEntity(managerPrototype, ManagerPrototype)) {
	
			var eventPipeline = getInstanceVariable(context, FieldGenericManager_eventPipeline);
			addElementToPipeline(eventPipeline, event);
		}
	



}

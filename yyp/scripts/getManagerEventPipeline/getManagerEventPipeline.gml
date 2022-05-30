///@function getManagerEventPipeline(manager)
///@description Safe getter.
///@param {T?GenericManager} manager
///@return {Optional<Pipeline<GenericEvent>>} eventPipeline
function getManagerEventPipeline(argument0) {

		var manager = argument0;
	
		var eventPipeline = getInstanceVariable(manager, FieldGenericManager_eventPipeline);
	
		return eventPipeline;
	



}

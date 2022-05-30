///@function managerEventDispatcher(params)
///@description Generic handler for ManagerPrototype::eventDispatcher.
///@param {Optional<any[]>} params
function managerEventDispatcher() {

		var params = argument[0];
	
		if ((isArray(params)) &&
			(getArrayLength(params) >= 1)) {
	
			var context = params[0];
		
			var eventPipeline = getManagerEventPipeline(context);
			if (isEntity(eventPipeline, Pipeline)) {
			
				for (var event = getPipelineFirstElement(eventPipeline);
					 iteratorFinish(event);
					 event = getPipelineNextElement(eventPipeline)) {
			
					///@safeCast {GenericEvent}
					var eventDispatcher = getGenericEventDispatcher(event); ; ///@todo inject
					if (isScript(eventDispatcher)) {
				
						runScript(eventDispatcher, context, event);
					}
				}
			}
		}
	



}

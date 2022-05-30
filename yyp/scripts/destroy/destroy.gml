///@function destroy(instance)
///@description Wrapper for instance_destroy.
///@param {Instance} instance
function destroy(argument0) {

		var instance = argument0;
	
		setInstanceVariable(instance, "instanceLifecycle", false);
		if (isInstance(instance)) {
		
			instance_destroy(instance, true);	
		} else {
		
			logger("Trying to destroy non-existsing instance. Raw data: {0}", LogType.WARNING, instance);
		}
	



}

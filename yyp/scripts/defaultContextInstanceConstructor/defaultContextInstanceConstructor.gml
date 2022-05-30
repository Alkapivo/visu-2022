///@function defaultContextInstanceConstructor(class, className, instanceLayer)
///@descritpion Default Constructor for object with context.
///@param {AssetClass} class
///@param {Layer} instanceLayer
///@return {Instance} instance of passed class.
function defaultContextInstanceConstructor(argument0, argument1, argument2) {
	
	var class = argument0;
	var className = argument1;
	var instanceLayer = argument2;

	var instance = null;
	var contextName = capitalToLowerCase(className) + "Context";
	var context = globalVariableExists(contextName) ? null : getGlobalVariable(contextName);
	if (!isOptionalPresent(context)) {
			
		instance = instance_create_layer(0, 0, instanceLayer, class);
		logger("{0} initialized", LogType.INFO, className);
	} else {
		
		instance = context
		logger("{0} already initialized", LogType.WARNING, className);
	}
	
	return instance;
}

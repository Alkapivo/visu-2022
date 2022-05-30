///@@function controlVariableKey(key, instance, variableName, factor)
function controlVariableKey(argument0, argument1, argument2, argument3) {

		var key = argument0;
		var instance = argument1;
		var variableName = argument2;
		var factor = argument3;
	
		var variable = getInstanceVariable(instance, variableName);
		if (keyboard_check(key)) {
	
			print(variableName + ":", variable, "->", variable + factor);
			setInstanceVariable(instance, variableName, variable + factor);
		}


}

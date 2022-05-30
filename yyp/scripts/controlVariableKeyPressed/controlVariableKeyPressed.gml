///@@function controlVariableKey(key, instance, variableName, factor)
function controlVariableKeyPressed(argument0, argument1, argument2, argument3) {

		var key = argument0;
		var instance = argument1;
		var variableName = argument2;
		var factor = argument3;
	
		var variable = getInstanceVariable(instance, variableName);
		if (keyboard_check_pressed(key)) {
	
			print(variableName + ":", variable, "->", factor);
			setInstanceVariable(instance, variableName, factor);
		}


}

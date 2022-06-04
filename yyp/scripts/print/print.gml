///@function print(message)
///@description Wrapper for show_debug_message
///@param {...Object} message
///@gml {^2.3}
function print() {

	var stringBuilder = "";
	for (var index = 0; index < argument_count; index++) {
		
		var message = string(argument[index]);
		stringBuilder += (index == 0 ? "" : " ") + message;
	}
	
	if (globalVariableExists("isLoggerEnabled")) {
		if (global.isLoggerEnabled) {
			
			show_debug_message(stringBuilder);
		}	
	}
}

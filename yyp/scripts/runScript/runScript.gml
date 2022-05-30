///@function runScript(handler, argument[s)
///@description Wrapper for script_execute.
///@param {AssetScript} script
///@param {...Object} argument[s
///@return {Optional<Object>} result
///@throws {ScriptNotFoundException|Exception}
function runScript() {

		///checkArgumentCount(1, argument_count, runScript);
	
		var handler = argument[0];
	
		if (!isScript(handler)) {
			throwException(
				createException(
					ScriptNotFoundException,
					stringParams("Script wasn't found. { \"rawData:\": \"{0}\" }", handler)
				)
			);
			return createEmptyOptional();
		}

		switch (argument_count) {
			case 1:
				return script_execute(handler);
			case 2:
				return script_execute(handler, argument[1]);
			case 3:
				return script_execute(handler, argument[1], argument[2]);
			case 4:
				return script_execute(handler, argument[1], argument[2], argument[3]);
			case 5:
				return script_execute(handler, argument[1], argument[2], argument[3], argument[4]);
			case 6:
				return script_execute(handler, argument[1], argument[2], argument[3], argument[4], argument[5]);
			case 7:
				return script_execute(handler, argument[1], argument[2], argument[3], argument[4], argument[5], argument[6]);
			case 8:
				return script_execute(handler, argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7]);
			case 9:
				return script_execute(handler, argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8]);
			case 10:
				return script_execute(handler, argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9]);
			case 11:
				return script_execute(handler, argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10]);
			case 12:
				return script_execute(handler, argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10], argument[11]);
			case 13:
				return script_execute(handler, argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10], argument[11], argument[12]);
			case 14:
				return script_execute(handler, argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10], argument[11], argument[12], argument[13]);
			case 15:
				return script_execute(handler, argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10], argument[11], argument[12], argument[13], argument[14]);
			case 16:
				return script_execute(handler, argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10], argument[11], argument[12], argument[13], argument[14], argument[15]);
		}
	



}

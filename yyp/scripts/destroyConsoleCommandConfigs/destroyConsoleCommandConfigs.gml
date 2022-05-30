///@function destroyConsoleCommandConfigs(consoleCommandConfigs)
///@description Destroy ConsoleCommandConfigs entity.
///@param {ConsoleCommandConfigs} consoleCommandConfigs
///@throws {Exception}
///@generated {2020-09-28T21:11:14.614Z}
function destroyConsoleCommandConfigs(argument0) {

		var consoleCommandConfigs = argument0;
	
		var data = getConsoleCommandConfigsData(consoleCommandConfigs);
	
		for (var index = 0; index < getArrayLength(data); index++) {
			var entity = data[@ index];
			destroyConsoleCommandConfig(entity);
		}
		setConsoleCommandConfigsData(consoleCommandConfigs, null);
	

	



}

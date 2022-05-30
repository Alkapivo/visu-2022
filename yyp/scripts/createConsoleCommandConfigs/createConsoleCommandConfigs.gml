///@function createConsoleCommandConfigs(data)
///@description Constructor for ConsoleCommandConfigs entity.
///@param {ConsoleCommandConfig[]} data
///@return {ConsoleCommandConfigs} consoleCommandConfigs 
///@throws {Exception}
///@generated {2020-09-28T21:11:14.614Z}
function createConsoleCommandConfigs(argument0) {

		var data = argument0;
	
		var consoleCommandConfigs = createEntity(ConsoleCommandConfigs);

		setConsoleCommandConfigsData(consoleCommandConfigs, assertNoOptional(data));

		return consoleCommandConfigs;
	



}

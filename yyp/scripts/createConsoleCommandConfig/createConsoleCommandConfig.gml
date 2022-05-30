///@function createConsoleCommandConfig(name, asset)
///@description Constructor for ConsoleCommandConfig entity.
///@param {String} name
///@param {String} asset
///@return {ConsoleCommandConfig} consoleCommandConfig 
///@throws {Exception}
///@generated {2020-09-28T21:11:14.547Z}
function createConsoleCommandConfig(argument0, argument1) {

		var name = argument0;
		var asset = argument1;
	
		var consoleCommandConfig = createEntity(ConsoleCommandConfig);

		setConsoleCommandConfigName(consoleCommandConfig, assertNoOptional(name));
		setConsoleCommandConfigAsset(consoleCommandConfig, assertNoOptional(asset));

		return consoleCommandConfig;
	



}

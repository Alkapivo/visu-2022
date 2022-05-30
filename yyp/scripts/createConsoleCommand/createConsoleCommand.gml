///@function createConsoleCommand(name, parameters)
///@description Constructor for ConsoleCommand entity.
///@param {String} name
///@param {String[]} parameters
///@return {ConsoleCommand} consoleCommand 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.957Z}
function createConsoleCommand(argument0, argument1) {

		var name = argument0;
		var parameters = argument1;
	
		var consoleCommand = createEntity(ConsoleCommand);

		setConsoleCommandName(consoleCommand, assertNoOptional(name));
		setConsoleCommandParameters(consoleCommand, assertNoOptional(parameters));

		return consoleCommand;
	



}

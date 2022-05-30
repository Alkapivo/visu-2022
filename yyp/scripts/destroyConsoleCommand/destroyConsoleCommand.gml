///@function destroyConsoleCommand(consoleCommand)
///@description Destroy ConsoleCommand entity.
///@param {ConsoleCommand} consoleCommand
///@throws {Exception}
///@generated {2020-09-28T21:11:54.684Z}
function destroyConsoleCommand(argument0) {

		var consoleCommand = argument0;
	
		var name = getConsoleCommandName(consoleCommand);
		var parameters = getConsoleCommandParameters(consoleCommand);
	
		setConsoleCommandParameters(consoleCommand, null);
	

	



}

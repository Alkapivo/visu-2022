///@function serializeConsoleCommand(consoleCommand)
///@description Serialize ConsoleCommand to JSON string.
///@param {ConsoleCommand} consoleCommand
///@return {String} consoleCommandJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:41.240Z}
function serializeConsoleCommand(argument0) {

		var consoleCommand = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"name",
			getConsoleCommandName(consoleCommand));	
		appendFieldToJsonObject(
			jsonObject,
			"parameters",
			getConsoleCommandParameters(consoleCommand),
			Array);
	

		var consoleCommandJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return consoleCommandJsonString;
	



}

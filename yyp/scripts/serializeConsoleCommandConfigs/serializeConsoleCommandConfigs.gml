///@function serializeConsoleCommandConfigs(consoleCommandConfigs)
///@description Serialize ConsoleCommandConfigs to JSON string.
///@param {ConsoleCommandConfigs} consoleCommandConfigs
///@return {String} consoleCommandConfigsJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:40.688Z}
function serializeConsoleCommandConfigs(argument0) {

		var consoleCommandConfigs = argument0;
	
		var jsonObject = createJsonObject();

		appendEntityToJsonObject(
			jsonObject,
			"data",
			getConsoleCommandConfigsData(consoleCommandConfigs),
			"ConsoleCommandConfig",
			Array);
	

		var consoleCommandConfigsJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return consoleCommandConfigsJsonString;
	



}

///@function serializeConsoleCommandConfig(consoleCommandConfig)
///@description Serialize ConsoleCommandConfig to JSON string.
///@param {ConsoleCommandConfig} consoleCommandConfig
///@return {String} consoleCommandConfigJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:40.669Z}
function serializeConsoleCommandConfig(argument0) {

		var consoleCommandConfig = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"name",
			getConsoleCommandConfigName(consoleCommandConfig));	
		appendFieldToJsonObject(
			jsonObject,
			"asset",
			getConsoleCommandConfigAsset(consoleCommandConfig));	

		var consoleCommandConfigJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return consoleCommandConfigJsonString;
	



}

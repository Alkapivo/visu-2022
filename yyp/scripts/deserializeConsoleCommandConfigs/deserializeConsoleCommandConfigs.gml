///@function deserializeConsoleCommandConfigs(jsonString)
///@description Deserialize ConsoleCommandConfigs from JSON String to ConsoleCommandConfigs entity.
///@param {String} jsonString
///@return {ConsoleCommandConfigs} consoleCommandConfigs 
///@throws {Exception}
///@generated {2020-09-28T21:11:14.614Z}
function deserializeConsoleCommandConfigs(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var data = assertNoOptional(getJsonObjectFieldValue(jsonObject, "data", Array, "ConsoleCommandConfig"));

		destroyJsonObject(jsonObject);
	
		return createConsoleCommandConfigs(data);
	



}

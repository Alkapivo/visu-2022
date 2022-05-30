///@function deserializeConsoleCommandConfig(jsonString)
///@description Deserialize ConsoleCommandConfig from JSON String to ConsoleCommandConfig entity.
///@param {String} jsonString
///@return {ConsoleCommandConfig} consoleCommandConfig 
///@throws {Exception}
///@generated {2020-09-28T21:11:14.547Z}
function deserializeConsoleCommandConfig(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var name = assertNoOptional(getJsonObjectFieldValue(jsonObject, "name"));
		var asset = assertNoOptional(getJsonObjectFieldValue(jsonObject, "asset"));

		destroyJsonObject(jsonObject);
	
		return createConsoleCommandConfig(name, asset);
	



}

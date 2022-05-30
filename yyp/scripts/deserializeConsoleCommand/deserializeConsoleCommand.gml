///@function deserializeConsoleCommand(jsonString)
///@description Deserialize ConsoleCommand from JSON String to ConsoleCommand entity.
///@param {String} jsonString
///@return {ConsoleCommand} consoleCommand 
///@throws {Exception}
///@generated {2020-09-28T21:11:54.684Z}
function deserializeConsoleCommand(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var name = assertNoOptional(getJsonObjectFieldValue(jsonObject, "name"));
		var parameters = assertNoOptional(getJsonObjectFieldValue(jsonObject, "parameters", Array));

		destroyJsonObject(jsonObject);
	
		return createConsoleCommand(name, parameters);
	



}

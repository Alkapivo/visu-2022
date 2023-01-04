///@description ConsoleCommand entity

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

///@function getConsoleCommandName(consoleCommand)
///@description Getter.
///@param {ConsoleCommand} consoleCommand
///@return {String} name 
///@throws {Exception}
///@generated {2020-09-28T21:11:54.684Z}
function getConsoleCommandName(argument0) {

		return argument0[@ 0];
	



}
///@function getConsoleCommandParameters(consoleCommand)
///@description Getter.
///@param {ConsoleCommand} consoleCommand
///@return {String[]} parameters 
///@throws {Exception}
///@generated {2020-09-28T21:11:54.684Z}
function getConsoleCommandParameters(argument0) {

		return argument0[@ 1];
	



}


///@function setConsoleCommandName(consoleCommand, name)
///@description Setter.
///@param {ConsoleCommand} consoleCommand
///@param {String} name
///@throws {Exception}
///@generated {2020-09-28T21:11:54.685Z}
function setConsoleCommandName(argument0, argument1) {

		argument0[@ 0] = argument1;
	



}
///@function setConsoleCommandParameters(consoleCommand, parameters)
///@description Setter.
///@param {ConsoleCommand} consoleCommand
///@param {String[]} parameters
///@throws {Exception}
///@generated {2020-09-28T21:11:54.685Z}
function setConsoleCommandParameters(argument0, argument1) {

		argument0[@ 1] = argument1;
	



}

///@description ConsoleCommandConfigs entity

///@function createConsoleCommandConfigs(data)
///@description Constructor for ConsoleCommandConfigs entity.
///@param {ConsoleCommandConfig[]} data
///@return {ConsoleCommandConfigs} consoleCommandConfigs 
///@throws {Exception}
///@generated {2020-09-28T21:11:14.614Z}
function createConsoleCommandConfigs(argument0) {

		var data = argument0;
	
		var consoleCommandConfigs = createEntity(ConsoleCommandConfigs);

		setConsoleCommandConfigsData(consoleCommandConfigs, assertNoOptional(data));

		return consoleCommandConfigs;
	



}
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
///@function destroyConsoleCommandConfigs(consoleCommandConfigs)
///@description Destroy ConsoleCommandConfigs entity.
///@param {ConsoleCommandConfigs} consoleCommandConfigs
///@throws {Exception}
///@generated {2020-09-28T21:11:14.614Z}
function destroyConsoleCommandConfigs(argument0) {

		var consoleCommandConfigs = argument0;
	
		var data = getConsoleCommandConfigsData(consoleCommandConfigs);
	
		for (var index = 0; index < getArrayLength(data); index++) {
			var entity = data[@ index];
			destroyConsoleCommandConfig(entity);
		}
		setConsoleCommandConfigsData(consoleCommandConfigs, null);
	

	



}
///@function getConsoleCommandConfigsData(consoleCommandConfigs)
///@description Getter.
///@param {ConsoleCommandConfigs} consoleCommandConfigs
///@return {ConsoleCommandConfig[]} data 
///@throws {Exception}
///@generated {2020-09-28T21:11:14.614Z}
function getConsoleCommandConfigsData(argument0) {

		return argument0[@ 0];
	



}
///@function setConsoleCommandConfigsData(consoleCommandConfigs, data)
///@description Setter.
///@param {ConsoleCommandConfigs} consoleCommandConfigs
///@param {ConsoleCommandConfig[]} data
///@throws {Exception}
///@generated {2020-09-28T21:11:14.614Z}
function setConsoleCommandConfigsData(argument0, argument1) {

		argument0[@ 0] = argument1;
	



}

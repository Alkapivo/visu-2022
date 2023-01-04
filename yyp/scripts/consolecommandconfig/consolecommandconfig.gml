///@description ConsoleCommandConfig entity

///@function createConsoleCommandConfig(name, asset)
///@description Constructor for ConsoleCommandConfig entity.
///@param {String} name
///@param {String} asset
///@return {ConsoleCommandConfig} consoleCommandConfig 
///@throws {Exception}
///@generated {2020-09-28T21:11:14.547Z}
function createConsoleCommandConfig(argument0, argument1) {

		var name = argument0;
		var asset = argument1;
	
		var consoleCommandConfig = createEntity(ConsoleCommandConfig);

		setConsoleCommandConfigName(consoleCommandConfig, assertNoOptional(name));
		setConsoleCommandConfigAsset(consoleCommandConfig, assertNoOptional(asset));

		return consoleCommandConfig;
	



}
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
///@function destroyConsoleCommandConfig(consoleCommandConfig)
///@description Destroy ConsoleCommandConfig entity.
///@param {ConsoleCommandConfig} consoleCommandConfig
///@throws {Exception}
///@generated {2020-09-28T21:11:14.547Z}
function destroyConsoleCommandConfig(argument0) {

		var consoleCommandConfig = argument0;
	
		var name = getConsoleCommandConfigName(consoleCommandConfig);
		var asset = getConsoleCommandConfigAsset(consoleCommandConfig);
	

	



}
///@function getConsoleCommandConfigAsset(consoleCommandConfig)
///@description Getter.
///@param {ConsoleCommandConfig} consoleCommandConfig
///@return {String} asset 
///@throws {Exception}
///@generated {2020-09-28T21:11:14.547Z}
function getConsoleCommandConfigAsset(argument0) {

		return argument0[@ 1];
	



}
///@function getConsoleCommandConfigName(consoleCommandConfig)
///@description Getter.
///@param {ConsoleCommandConfig} consoleCommandConfig
///@return {String} name 
///@throws {Exception}
///@generated {2020-09-28T21:11:14.547Z}
function getConsoleCommandConfigName(argument0) {

		return argument0[@ 0];
	



}

///@function setConsoleCommandConfigAsset(consoleCommandConfig, asset)
///@description Setter.
///@param {ConsoleCommandConfig} consoleCommandConfig
///@param {String} asset
///@throws {Exception}
///@generated {2020-09-28T21:11:14.547Z}
function setConsoleCommandConfigAsset(argument0, argument1) {

		argument0[@ 1] = argument1;
	



}
///@function setConsoleCommandConfigName(consoleCommandConfig, name)
///@description Setter.
///@param {ConsoleCommandConfig} consoleCommandConfig
///@param {String} name
///@throws {Exception}
///@generated {2020-09-28T21:11:14.547Z}
function setConsoleCommandConfigName(argument0, argument1) {

		argument0[@ 0] = argument1;
	



}

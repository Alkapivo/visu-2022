///@description Settings entity

///@function createSettings(name, attributes)
///@description Constructor for Settings entity.
///@param {String} name
///@param {Map<String::any>} attributes
///@return {Settings} settings 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.824Z}
function createSettings(argument0, argument1) {

		var name = argument0;
		var attributes = argument1;
	
		var settings = createEntity(Settings);

		setSettingsName(settings, assertNoOptional(name));
		setSettingsAttributes(settings, assertNoOptional(attributes));

		return settings;
	



}
///@function serializeSettings(settings)
///@description Serialize Settings to JSON string.
///@param {Settings} settings
///@return {String} settingsJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:41.189Z}
function serializeSettings(argument0) {

		var settings = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"name",
			getSettingsName(settings));	
		appendFieldToJsonObject(
			jsonObject,
			"attributes",
			getSettingsAttributes(settings),
			Map);
	

		var settingsJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return settingsJsonString;
	



}
///@function deserializeSettings(jsonString)
///@description Deserialize Settings from JSON String to Settings entity.
///@param {String} jsonString
///@return {Settings} settings 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.824Z}
function deserializeSettings(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var name = assertNoOptional(getJsonObjectFieldValue(jsonObject, "name"));
		var attributes = assertNoOptional(getJsonObjectFieldValue(jsonObject, "attributes", Map));

		destroyJsonObject(jsonObject);
	
		return createSettings(name, attributes);
	



}
///@function destroySettings(settings)
///@description Destroy Settings entity.
///@param {Settings} settings
///@throws {Exception}
///@generated {2020-09-28T21:11:15.824Z}
function destroySettings(argument0) {

		var settings = argument0;
	
		var name = getSettingsName(settings);
		var attributes = getSettingsAttributes(settings);
	
		destroyDataStructure(attributes, Map, "Unable to destroy Map attributes in Settings");
		setSettingsAttributes(settings, null);
	

	



}
///@function getSettingsAttributes(settings)
///@description Getter.
///@param {Settings} settings
///@return {Map<String::any>} attributes 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.825Z}
function getSettingsAttributes(argument0) {

		return argument0[@ 1];
	



}
///@function getSettingsName(settings)
///@description Getter.
///@param {Settings} settings
///@return {String} name 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.825Z}
function getSettingsName(argument0) {

		return argument0[@ 0];
	



}
///@function setSettingsAttributes(settings, attributes)
///@description Setter.
///@param {Settings} settings
///@param {Map<String::any>} attributes
///@throws {Exception}
///@generated {2020-09-28T21:11:15.825Z}
function setSettingsAttributes(argument0, argument1) {

		argument0[@ 1] = argument1;
	



}
///@function setSettingsName(settings, name)
///@description Setter.
///@param {Settings} settings
///@param {String} name
///@throws {Exception}
///@generated {2020-09-28T21:11:15.825Z}
function setSettingsName(argument0, argument1) {

		argument0[@ 0] = argument1;
	



}

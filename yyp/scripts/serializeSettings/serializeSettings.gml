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

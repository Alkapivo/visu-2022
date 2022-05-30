///@function serializeTheme(theme)
///@description Serialize Theme to JSON string.
///@param {Theme} theme
///@return {String} themeJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:41.206Z}
function serializeTheme(argument0) {

		var theme = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"name",
			getThemeName(theme));	
		appendFieldToJsonObject(
			jsonObject,
			"attributes",
			getThemeAttributes(theme),
			Map);
	

		var themeJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return themeJsonString;
	



}

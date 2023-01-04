///@description Theme entity

///@function createTheme(name, attributes)
///@description Constructor for Theme entity.
///@param {String} name
///@param {Map<String::any>} attributes
///@return {Theme} theme 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.890Z}
function createTheme(argument0, argument1) {

		var name = argument0;
		var attributes = argument1;
	
		var theme = createEntity(Theme);

		setThemeName(theme, assertNoOptional(name));
		setThemeAttributes(theme, assertNoOptional(attributes));

		return theme;
	



}
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
///@function deserializeTheme(jsonString)
///@description Deserialize Theme from JSON String to Theme entity.
///@param {String} jsonString
///@return {Theme} theme 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.890Z}
function deserializeTheme(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var name = assertNoOptional(getJsonObjectFieldValue(jsonObject, "name"));
		var attributes = assertNoOptional(getJsonObjectFieldValue(jsonObject, "attributes", Map));

		destroyJsonObject(jsonObject);
	
		return createTheme(name, attributes);
	



}
///@function destroyTheme(theme)
///@description Destroy Theme entity.
///@param {Theme} theme
///@throws {Exception}
///@generated {2020-10-07T16:32:05.802Z}
function destroyTheme(argument0) {

		var theme = argument0;
	
		var name = getThemeName(theme);
		var attributes = getThemeAttributes(theme);
	
		destroyDataStructure(attributes, Map, "Unable to destroy Map attributes in Theme");
		setThemeAttributes(theme, null);
	

	



}
///@function getThemeAttributes(theme)
///@description Getter.
///@param {Theme} theme
///@return {Map<String::any>} attributes 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.890Z}
function getThemeAttributes(argument0) {

		return argument0[@ 1];
	



}
///@function getThemeName(theme)
///@description Getter.
///@param {Theme} theme
///@return {String} name 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.890Z}
function getThemeName(argument0) {

		return argument0[@ 0];
	



}
///@function setThemeAttributes(theme, attributes)
///@description Setter.
///@param {Theme} theme
///@param {Map<String::any>} attributes
///@throws {Exception}
///@generated {2020-09-28T21:11:15.890Z}
function setThemeAttributes(argument0, argument1) {

		argument0[@ 1] = argument1;
	



}
///@function setThemeName(theme, name)
///@description Setter.
///@param {Theme} theme
///@param {String} name
///@throws {Exception}
///@generated {2020-09-28T21:11:15.890Z}
function setThemeName(argument0, argument1) {

		argument0[@ 0] = argument1;
	



}

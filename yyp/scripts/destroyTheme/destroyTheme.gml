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

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

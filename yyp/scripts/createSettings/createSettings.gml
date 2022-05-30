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

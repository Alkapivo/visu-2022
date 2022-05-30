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

///@function deserializePackageConfigs(jsonString)
///@description Deserialize PackageConfigs from JSON String to PackageConfigs entity.
///@param {String} jsonString
///@return {PackageConfigs} packageConfigs 
///@throws {Exception}
///@generated {2020-09-28T21:11:14.496Z}
function deserializePackageConfigs(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var data = assertNoOptional(getJsonObjectFieldValue(jsonObject, "data", Array, "PackageConfig"));

		destroyJsonObject(jsonObject);
	
		return createPackageConfigs(data);
	



}

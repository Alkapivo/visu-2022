///@function serializePackageConfigs(packageConfigs)
///@description Serialize PackageConfigs to JSON string.
///@param {PackageConfigs} packageConfigs
///@return {String} packageConfigsJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:40.648Z}
function serializePackageConfigs(argument0) {

		var packageConfigs = argument0;
	
		var jsonObject = createJsonObject();

		appendEntityToJsonObject(
			jsonObject,
			"data",
			getPackageConfigsData(packageConfigs),
			"PackageConfig",
			Array);
	

		var packageConfigsJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return packageConfigsJsonString;
	



}

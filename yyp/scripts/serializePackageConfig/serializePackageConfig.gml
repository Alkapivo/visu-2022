///@function serializePackageConfig(packageConfig)
///@description Serialize PackageConfig to JSON string.
///@param {PackageConfig} packageConfig
///@return {String} packageConfigJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:40.616Z}
function serializePackageConfig(argument0) {

		var packageConfig = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"packageName",
			getPackageConfigPackageName(packageConfig));	
		appendFieldToJsonObject(
			jsonObject,
			"artifactName",
			getPackageConfigArtifactName(packageConfig));	
		appendFieldToJsonObject(
			jsonObject,
			"context",
			getPackageConfigContext(packageConfig));	
		appendFieldToJsonObject(
			jsonObject,
			"scenes",
			getPackageConfigScenes(packageConfig),
			Array);
	

		var packageConfigJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return packageConfigJsonString;
	



}

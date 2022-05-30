///@function deserializePackageConfig(jsonString)
///@description Deserialize PackageConfig from JSON String to PackageConfig entity.
///@param {String} jsonString
///@return {PackageConfig} packageConfig 
///@throws {Exception}
///@generated {2020-09-28T21:11:14.359Z}
function deserializePackageConfig(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var packageName = assertNoOptional(getJsonObjectFieldValue(jsonObject, "packageName"));
		var artifactName = assertNoOptional(getJsonObjectFieldValue(jsonObject, "artifactName"));
		var context = assertNoOptional(getJsonObjectFieldValue(jsonObject, "context"));
		var scenes = assertNoOptional(getJsonObjectFieldValue(jsonObject, "scenes", Array));

		destroyJsonObject(jsonObject);
	
		return createPackageConfig(packageName, artifactName, context, scenes);
	



}

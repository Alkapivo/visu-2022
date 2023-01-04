///@description PackageConfig entity

///@function createPackageConfig(packageName, artifactName, context, scenes)
///@description Constructor for PackageConfig entity.
///@param {String} packageName
///@param {String} artifactName
///@param {String} context
///@param {String[]} scenes
///@return {PackageConfig} packageConfig 
///@throws {Exception}
///@generated {2020-09-28T21:11:14.358Z}
function createPackageConfig(argument0, argument1, argument2, argument3) {

		var packageName = argument0;
		var artifactName = argument1;
		var context = argument2;
		var scenes = argument3;
	
		var packageConfig = createEntity(PackageConfig);

		setPackageConfigPackageName(packageConfig, assertNoOptional(packageName));
		setPackageConfigArtifactName(packageConfig, assertNoOptional(artifactName));
		setPackageConfigContext(packageConfig, assertNoOptional(context));
		setPackageConfigScenes(packageConfig, assertNoOptional(scenes));

		return packageConfig;
	



}
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
///@function destroyPackageConfig(packageConfig)
///@description Destroy PackageConfig entity.
///@param {PackageConfig} packageConfig
///@throws {Exception}
///@generated {2020-09-28T21:11:14.361Z}
function destroyPackageConfig(argument0) {

		var packageConfig = argument0;
	
		var packageName = getPackageConfigPackageName(packageConfig);
		var artifactName = getPackageConfigArtifactName(packageConfig);
		var context = getPackageConfigContext(packageConfig);
		var scenes = getPackageConfigScenes(packageConfig);
	
		setPackageConfigScenes(packageConfig, null);
	

	



}
///@function getPackageConfigArtifactName(packageConfig)
///@description Getter.
///@param {PackageConfig} packageConfig
///@return {String} artifactName 
///@throws {Exception}
///@generated {2020-09-28T21:11:14.361Z}
function getPackageConfigArtifactName(argument0) {

		return argument0[@ 1];
	



}
///@function getPackageConfigContext(packageConfig)
///@description Getter.
///@param {PackageConfig} packageConfig
///@return {String} context 
///@throws {Exception}
///@generated {2020-09-28T21:11:14.361Z}
function getPackageConfigContext(argument0) {

		return argument0[@ 2];
	



}
///@function getPackageConfigPackageName(packageConfig)
///@description Getter.
///@param {PackageConfig} packageConfig
///@return {String} packageName 
///@throws {Exception}
///@generated {2020-09-28T21:11:14.361Z}
function getPackageConfigPackageName(argument0) {

		return argument0[@ 0];
	



}
///@function getPackageConfigScenes(packageConfig)
///@description Getter.
///@param {PackageConfig} packageConfig
///@return {String[]} scenes 
///@throws {Exception}
///@generated {2020-09-28T21:11:14.361Z}
function getPackageConfigScenes(argument0) {

		return argument0[@ 3];
	



}

///@function setPackageConfigArtifactName(packageConfig, artifactName)
///@description Setter.
///@param {PackageConfig} packageConfig
///@param {String} artifactName
///@throws {Exception}
///@generated {2020-09-28T21:11:14.362Z}
function setPackageConfigArtifactName(argument0, argument1) {

		argument0[@ 1] = argument1;
	



}
///@function setPackageConfigContext(packageConfig, context)
///@description Setter.
///@param {PackageConfig} packageConfig
///@param {String} context
///@throws {Exception}
///@generated {2020-09-28T21:11:14.362Z}
function setPackageConfigContext(argument0, argument1) {

		argument0[@ 2] = argument1;
	



}
///@function setPackageConfigPackageName(packageConfig, packageName)
///@description Setter.
///@param {PackageConfig} packageConfig
///@param {String} packageName
///@throws {Exception}
///@generated {2020-09-28T21:11:14.362Z}
function setPackageConfigPackageName(argument0, argument1) {

		argument0[@ 0] = argument1;
	



}
///@function setPackageConfigScenes(packageConfig, scenes)
///@description Setter.
///@param {PackageConfig} packageConfig
///@param {String[]} scenes
///@throws {Exception}
///@generated {2020-09-28T21:11:14.362Z}
function setPackageConfigScenes(argument0, argument1) {

		argument0[@ 3] = argument1;
	



}

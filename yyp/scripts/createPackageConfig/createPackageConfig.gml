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

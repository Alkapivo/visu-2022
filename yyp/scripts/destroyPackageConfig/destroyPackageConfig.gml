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

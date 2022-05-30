///@function createPackageConfigs(data)
///@description Constructor for PackageConfigs entity.
///@param {PackageConfig[]} data
///@return {PackageConfigs} packageConfigs 
///@throws {Exception}
///@generated {2020-09-28T21:11:14.496Z}
function createPackageConfigs(argument0) {

		var data = argument0;
	
		var packageConfigs = createEntity(PackageConfigs);

		setPackageConfigsData(packageConfigs, assertNoOptional(data));

		return packageConfigs;
	



}

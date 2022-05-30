///@function destroyPackageConfigs(packageConfigs)
///@description Destroy PackageConfigs entity.
///@param {PackageConfigs} packageConfigs
///@throws {Exception}
///@generated {2020-09-28T21:11:14.496Z}
function destroyPackageConfigs(argument0) {

		var packageConfigs = argument0;
	
		var data = getPackageConfigsData(packageConfigs);
	
		for (var index = 0; index < getArrayLength(data); index++) {
			var entity = data[@ index];
			destroyPackageConfig(entity);
		}
		setPackageConfigsData(packageConfigs, null);
	

	



}

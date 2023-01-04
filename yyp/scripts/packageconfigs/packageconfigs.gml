///@description PackageConfigs entity

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
///@function getPackageConfigsData(packageConfigs)
///@description Getter.
///@param {PackageConfigs} packageConfigs
///@return {PackageConfig[]} data 
///@throws {Exception}
///@generated {2020-09-28T21:11:14.496Z}
function getPackageConfigsData(argument0) {

		return argument0[@ 0];
	



}
///@function setPackageConfigsData(packageConfigs, data)
///@description Setter.
///@param {PackageConfigs} packageConfigs
///@param {PackageConfig[]} data
///@throws {Exception}
///@generated {2020-09-28T21:11:14.496Z}
function setPackageConfigsData(argument0, argument1) {

		argument0[@ 0] = argument1;
	



}

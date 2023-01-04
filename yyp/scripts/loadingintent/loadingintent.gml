///@description LoadingIntent entity

///@function createLoadingIntent(scene, data)
///@description Constructor for LoadingIntent entity.
///@param {Scene} scene
///@param {Optional<ArrayMap>} data
///@return {LoadingIntent} loadingIntent 
///@throws {Exception}
///@generated {2020-09-22T10:33:22.429Z}
function createLoadingIntent(argument0, argument1) {

		var scene = argument0;
		var data = argument1;
	
		var loadingIntent = createEntity(LoadingIntent);

		setLoadingIntentScene(loadingIntent, assertNoOptional(scene));
		setLoadingIntentData(loadingIntent, data);

		return loadingIntent;
	



}
///@function serializeLoadingIntent(loadingIntent)
///@description Serialize LoadingIntent to JSON string.
///@param {LoadingIntent} loadingIntent
///@return {String} loadingIntentJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:41.322Z}
function serializeLoadingIntent(argument0) {

		var loadingIntent = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"scene",
			getLoadingIntentScene(loadingIntent));	
		if (isOptionalPresent(getLoadingIntentData(loadingIntent))) {
			appendEntityToJsonObject(
				jsonObject,
				"data",
				getLoadingIntentData(loadingIntent),
				"ArrayMap");
		}
	

		var loadingIntentJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return loadingIntentJsonString;
	



}
///@function deserializeLoadingIntent(jsonString)
///@description Deserialize LoadingIntent from JSON String to LoadingIntent entity.
///@param {String} jsonString
///@return {LoadingIntent} loadingIntent 
///@throws {Exception}
///@generated {2020-09-22T10:33:22.429Z}
function deserializeLoadingIntent(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var scene = assertNoOptional(getJsonObjectFieldValue(jsonObject, "scene"));
		var data = getJsonObjectFieldValue(jsonObject, "data", Entity, "ArrayMap");

		destroyJsonObject(jsonObject);
	
		return createLoadingIntent(scene, data);
	



}
///@function destroyLoadingIntent(loadingIntent)
///@description Destroy LoadingIntent entity.
///@param {LoadingIntent} loadingIntent
///@throws {Exception}
///@generated {2020-09-22T10:33:22.429Z}
function destroyLoadingIntent(argument0) {

		var loadingIntent = argument0;
	
		var scene = getLoadingIntentScene(loadingIntent);
		var data = getLoadingIntentData(loadingIntent);
	
		if (isOptionalPresent(data)) {
			destroyArrayMap(data);
		}
		setLoadingIntentData(loadingIntent, null);
	

	



}
///@function getLoadingIntentData(loadingIntent)
///@description Getter.
///@param {LoadingIntent} loadingIntent
///@return {Optional<ArrayMap>} data 
///@throws {Exception}
///@generated {2020-09-22T10:33:22.429Z}
function getLoadingIntentData(argument0) {

		return argument0[@ 1];
	



}
///@function getLoadingIntentScene(loadingIntent)
///@description Getter.
///@param {LoadingIntent} loadingIntent
///@return {Scene} scene 
///@throws {Exception}
///@generated {2020-09-22T10:33:22.429Z}
function getLoadingIntentScene(argument0) {

		return argument0[@ 0];
	



}
///@function setLoadingIntentData(loadingIntent, data)
///@description Setter.
///@param {LoadingIntent} loadingIntent
///@param {Optional<ArrayMap>} data
///@throws {Exception}
///@generated {2020-09-22T10:33:22.429Z}
function setLoadingIntentData(argument0, argument1) {

		argument0[@ 1] = argument1;
	



}
///@function setLoadingIntentScene(loadingIntent, scene)
///@description Setter.
///@param {LoadingIntent} loadingIntent
///@param {Scene} scene
///@throws {Exception}
///@generated {2020-09-22T10:33:22.429Z}
function setLoadingIntentScene(argument0, argument1) {

		argument0[@ 0] = argument1;
	



}

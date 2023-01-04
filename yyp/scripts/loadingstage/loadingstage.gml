///@description LoadingStage entity

///@function createLoadingStage(currentValue, maxValue, state)
///@description Constructor for LoadingStage entity.
///@param {Integer} currentValue
///@param {Integer} maxValue
///@param {Map<String::any>} state
///@return {LoadingStage} loadingStage 
///@throws {Exception}
///@generated {2020-09-28T21:11:55.028Z}
function createLoadingStage(argument0, argument1, argument2) {

		var currentValue = argument0;
		var maxValue = argument1;
		var state = argument2;
	
		var loadingStage = createEntity(LoadingStage);

		setLoadingStageCurrentValue(loadingStage, assertNoOptional(currentValue));
		setLoadingStageMaxValue(loadingStage, assertNoOptional(maxValue));
		setLoadingStageState(loadingStage, assertNoOptional(state));

		return loadingStage;
	



}
///@function serializeLoadingStage(loadingStage)
///@description Serialize LoadingStage to JSON string.
///@param {LoadingStage} loadingStage
///@return {String} loadingStageJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:41.338Z}
function serializeLoadingStage(argument0) {

		var loadingStage = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"currentValue",
			getLoadingStageCurrentValue(loadingStage));	
		appendFieldToJsonObject(
			jsonObject,
			"maxValue",
			getLoadingStageMaxValue(loadingStage));	
		appendFieldToJsonObject(
			jsonObject,
			"state",
			getLoadingStageState(loadingStage),
			Map);
	

		var loadingStageJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return loadingStageJsonString;
	



}
///@function deserializeLoadingStage(jsonString)
///@description Deserialize LoadingStage from JSON String to LoadingStage entity.
///@param {String} jsonString
///@return {LoadingStage} loadingStage 
///@throws {Exception}
///@generated {2020-09-28T21:11:55.029Z}
function deserializeLoadingStage(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var currentValue = assertNoOptional(getJsonObjectFieldValue(jsonObject, "currentValue"));
		var maxValue = assertNoOptional(getJsonObjectFieldValue(jsonObject, "maxValue"));
		var state = assertNoOptional(getJsonObjectFieldValue(jsonObject, "state", Map));

		destroyJsonObject(jsonObject);
	
		return createLoadingStage(currentValue, maxValue, state);
	



}
///@function destroyLoadingStage(loadingStage)
///@description Destroy LoadingStage entity.
///@param {LoadingStage} loadingStage
///@throws {Exception}
///@generated {2020-09-28T21:11:55.029Z}
function destroyLoadingStage(argument0) {

		var loadingStage = argument0;
	
		var currentValue = getLoadingStageCurrentValue(loadingStage);
		var maxValue = getLoadingStageMaxValue(loadingStage);
		var state = getLoadingStageState(loadingStage);
	
		destroyDataStructure(state, Map, "Unable to destroy Map state in LoadingStage");
		setLoadingStageState(loadingStage, null);
	

	



}
///@function getLoadingStageCurrentValue(loadingStage)
///@description Getter.
///@param {LoadingStage} loadingStage
///@return {Integer} currentValue 
///@throws {Exception}
///@generated {2020-09-28T21:11:55.029Z}
function getLoadingStageCurrentValue(argument0) {

		return argument0[@ 0];
	



}
///@function getLoadingStageMaxValue(loadingStage)
///@description Getter.
///@param {LoadingStage} loadingStage
///@return {Integer} maxValue 
///@throws {Exception}
///@generated {2020-09-28T21:11:55.029Z}
function getLoadingStageMaxValue(argument0) {

		return argument0[@ 1];
	



}
///@function getLoadingStageState(loadingStage)
///@description Getter.
///@param {LoadingStage} loadingStage
///@return {Map<String::any>} state 
///@throws {Exception}
///@generated {2020-09-28T21:11:55.029Z}
function getLoadingStageState(argument0) {

		return argument0[@ 2];
	



}
///@function setLoadingStageCurrentValue(loadingStage, currentValue)
///@description Setter.
///@param {LoadingStage} loadingStage
///@param {Integer} currentValue
///@throws {Exception}
///@generated {2020-09-28T21:11:55.029Z}
function setLoadingStageCurrentValue(argument0, argument1) {

		argument0[@ 0] = argument1;
	



}
///@function setLoadingStageMaxValue(loadingStage, maxValue)
///@description Setter.
///@param {LoadingStage} loadingStage
///@param {Integer} maxValue
///@throws {Exception}
///@generated {2020-09-28T21:11:55.029Z}
function setLoadingStageMaxValue(argument0, argument1) {

		argument0[@ 1] = argument1;
	



}
///@function setLoadingStageState(loadingStage, state)
///@description Setter.
///@param {LoadingStage} loadingStage
///@param {Map<String::any>} state
///@throws {Exception}
///@generated {2020-09-28T21:11:55.029Z}
function setLoadingStageState(argument0, argument1) {

		argument0[@ 2] = argument1;
	



}

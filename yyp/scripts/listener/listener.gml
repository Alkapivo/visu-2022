///@description Listener entity

///@function createListener(compareMethod, frequency, tick)
///@description Constructor for Listener entity.
///@param {CompareMethod} compareMethod
///@param {Number} frequency
///@param {Integer} tick
///@return {Listener} listener 
///@throws {Exception}
///@generated {2020-09-28T21:11:54.918Z}
function createListener(argument0, argument1, argument2) {

		var compareMethod = argument0;
		var frequency = argument1;
		var tick = argument2;
	
		var listener = createEntity(Listener);

		setListenerCompareMethod(listener, assertNoOptional(compareMethod));
		setListenerFrequency(listener, assertNoOptional(frequency));
		setListenerTick(listener, assertNoOptional(tick));

		return listener;
	



}
///@function serializeListener(listener)
///@description Serialize Listener to JSON string.
///@param {Listener} listener
///@return {String} listenerJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:41.295Z}
function serializeListener(argument0) {

		var listener = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"compareMethod",
			getListenerCompareMethod(listener));	
		appendFieldToJsonObject(
			jsonObject,
			"frequency",
			getListenerFrequency(listener));	
		appendFieldToJsonObject(
			jsonObject,
			"tick",
			getListenerTick(listener));	

		var listenerJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return listenerJsonString;
	



}
///@function deserializeListener(jsonString)
///@description Deserialize Listener from JSON String to Listener entity.
///@param {String} jsonString
///@return {Listener} listener 
///@throws {Exception}
///@generated {2020-09-28T21:11:54.918Z}
function deserializeListener(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var compareMethod = assertNoOptional(getJsonObjectFieldValue(jsonObject, "compareMethod"));
		var frequency = assertNoOptional(getJsonObjectFieldValue(jsonObject, "frequency"));
		var tick = assertNoOptional(getJsonObjectFieldValue(jsonObject, "tick"));

		destroyJsonObject(jsonObject);
	
		return createListener(compareMethod, frequency, tick);
	



}
///@function destroyListener(listener)
///@description Destroy Listener entity.
///@param {Listener} listener
///@throws {Exception}
///@generated {2020-09-28T21:11:54.918Z}
function destroyListener(argument0) {

		var listener = argument0;
	
		var compareMethod = getListenerCompareMethod(listener);
		var frequency = getListenerFrequency(listener);
		var tick = getListenerTick(listener);
	

	



}
///@function getListenerCompareMethod(listener)
///@description Getter.
///@param {Listener} listener
///@return {CompareMethod} compareMethod 
///@throws {Exception}
///@generated {2020-09-28T21:11:54.918Z}
function getListenerCompareMethod(argument0) {

		return argument0[@ 0];
	



}
///@function getListenerFrequency(listener)
///@description Getter.
///@param {Listener} listener
///@return {Number} frequency 
///@throws {Exception}
///@generated {2020-09-28T21:11:54.918Z}
function getListenerFrequency(argument0) {

		return argument0[@ 1];
	



}
///@function getListenerTick(listener)
///@description Getter.
///@param {Listener} listener
///@return {Integer} tick 
///@throws {Exception}
///@generated {2020-09-28T21:11:54.918Z}
function getListenerTick(argument0) {

		return argument0[@ 2];
	



}
///@function setListenerCompareMethod(listener, compareMethod)
///@description Setter.
///@param {Listener} listener
///@param {CompareMethod} compareMethod
///@throws {Exception}
///@generated {2020-09-28T21:11:54.918Z}
function setListenerCompareMethod(argument0, argument1) {

		argument0[@ 0] = argument1;
	



}
///@function setListenerFrequency(listener, frequency)
///@description Setter.
///@param {Listener} listener
///@param {Number} frequency
///@throws {Exception}
///@generated {2020-09-28T21:11:54.918Z}
function setListenerFrequency(argument0, argument1) {

		argument0[@ 1] = argument1;
	



}
///@function setListenerTick(listener, tick)
///@description Setter.
///@param {Listener} listener
///@param {Integer} tick
///@throws {Exception}
///@generated {2020-09-28T21:11:54.918Z}
function setListenerTick(argument0, argument1) {

		argument0[@ 2] = argument1;
	



}

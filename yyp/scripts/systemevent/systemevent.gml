///@description SystemEvent entity

///@function createSystemEvent(type, timer, data)
///@description Constructor for SystemEvent entity.
///@param {SystemEventType} type
///@param {Number} timer
///@param {Optional<ArrayMap>} data
///@return {SystemEvent} systemEvent 
///@throws {Exception}
///@generated {2020-10-11T13:39:40.747Z}
function createSystemEvent(argument0, argument1, argument2) {

		var type = argument0;
		var timer = argument1;
		var data = argument2;
	
		var systemEvent = createEntity(SystemEvent);

		setSystemEventType(systemEvent, assertNoOptional(type));
		setSystemEventTimer(systemEvent, assertNoOptional(timer));
		setSystemEventData(systemEvent, data);

		return systemEvent;
	



}
///@function serializeSystemEvent(systemEvent)
///@description Serialize SystemEvent to JSON string.
///@param {SystemEvent} systemEvent
///@return {String} systemEventJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:41.356Z}
function serializeSystemEvent(argument0) {

		var systemEvent = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"type",
			getSystemEventType(systemEvent));	
		appendFieldToJsonObject(
			jsonObject,
			"timer",
			getSystemEventTimer(systemEvent));	
		if (isOptionalPresent(getSystemEventData(systemEvent))) {
			appendEntityToJsonObject(
				jsonObject,
				"data",
				getSystemEventData(systemEvent),
				"ArrayMap");
		}
	

		var systemEventJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return systemEventJsonString;
	



}
///@function deserializeSystemEvent(jsonString)
///@description Deserialize SystemEvent from JSON String to SystemEvent entity.
///@param {String} jsonString
///@return {SystemEvent} systemEvent 
///@throws {Exception}
///@generated {2020-10-11T13:39:40.747Z}
function deserializeSystemEvent(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var type = assertNoOptional(getJsonObjectFieldValue(jsonObject, "type"));
		var timer = assertNoOptional(getJsonObjectFieldValue(jsonObject, "timer"));
		var data = getJsonObjectFieldValue(jsonObject, "data", Entity, "ArrayMap");

		destroyJsonObject(jsonObject);
	
		return createSystemEvent(type, timer, data);
	



}
///@function destroySystemEvent(systemEvent)
///@description Destroy SystemEvent entity.
///@param {SystemEvent} systemEvent
///@throws {Exception}
///@generated {2020-10-11T13:39:40.747Z}
function destroySystemEvent(argument0) {

		var systemEvent = argument0;
	
		var type = getSystemEventType(systemEvent);
		var timer = getSystemEventTimer(systemEvent);
		var data = getSystemEventData(systemEvent);
	
		if (isOptionalPresent(data)) {
			destroyArrayMap(data);
		}
		setSystemEventData(systemEvent, null);
	

	



}
///@function getSystemEventData(systemEvent)
///@description Getter.
///@param {SystemEvent} systemEvent
///@return {Optional<ArrayMap>} data 
///@throws {Exception}
///@generated {2020-09-22T10:33:29.525Z}
function getSystemEventData(argument0) {

		return argument0[@ 2];
	



}
///@function getSystemEventTimer(systemEvent)
///@description Getter.
///@param {SystemEvent} systemEvent
///@return {Number} timer 
///@throws {Exception}
///@generated {2020-09-22T10:33:29.525Z}
function getSystemEventTimer(argument0) {

		return argument0[@ 1];
	



}
///@function getSystemEventType(systemEvent)
///@description Getter.
///@param {SystemEvent} systemEvent
///@return {SystemEventType} type 
///@throws {Exception}
///@generated {2020-10-11T13:39:40.747Z}
function getSystemEventType(argument0) {

		return argument0[@ 0];
	



}
///@function setSystemEventData(systemEvent, data)
///@description Setter.
///@param {SystemEvent} systemEvent
///@param {Optional<ArrayMap>} data
///@throws {Exception}
///@generated {2020-09-22T10:33:29.525Z}
function setSystemEventData(argument0, argument1) {

		argument0[@ 2] = argument1;
	



}
///@function setSystemEventTimer(systemEvent, timer)
///@description Setter.
///@param {SystemEvent} systemEvent
///@param {Number} timer
///@throws {Exception}
///@generated {2020-09-22T10:33:29.525Z}
function setSystemEventTimer(argument0, argument1) {

		argument0[@ 1] = argument1;
	



}
///@function setSystemEventType(systemEvent, type)
///@description Setter.
///@param {SystemEvent} systemEvent
///@param {SystemEventType} type
///@throws {Exception}
///@generated {2020-10-11T13:39:40.747Z}
function setSystemEventType(argument0, argument1) {

		argument0[@ 0] = argument1;
	



}

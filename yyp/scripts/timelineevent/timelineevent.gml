///@description TimelineEvent entity

///@function createTimelineEvent(type, data)
///@description Constructor for TimelineEvent entity.
///@param {String} type
///@param {Map<String::any>} data
///@return {TimelineEvent} timelineEvent 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.973Z}

function createTimelineEvent(type, data) {

	var timelineEvent = createEntity(TimelineEvent);

	setTimelineEventType(timelineEvent, assertNoOptional(type));
	setTimelineEventData(timelineEvent, assertNoOptional(data));

	return timelineEvent;
	
}
///@function serializeTimelineEvent(timelineEvent)
///@description Serialize TimelineEvent to JSON string.
///@param {TimelineEvent} timelineEvent
///@return {String} timelineEventJsonString 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.973Z}

function serializeTimelineEvent(timelineEvent) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"type",
		getTimelineEventType(timelineEvent));	
	appendFieldToJsonObject(
		jsonObject,
		"data",
		getTimelineEventData(timelineEvent),
		Map);
	

	var timelineEventJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return timelineEventJsonString;
	
}
///@function deserializeTimelineEvent(jsonString)
///@description Deserialize TimelineEvent from JSON String to TimelineEvent entity.
///@param {String} jsonString
///@return {TimelineEvent} timelineEvent 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.973Z}

function deserializeTimelineEvent(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var type = assertNoOptional(getJsonObjectFieldValue(jsonObject, "type"));
	var data = assertNoOptional(getJsonObjectFieldValue(jsonObject, "data", Map));

	destroyJsonObject(jsonObject);
	
	return createTimelineEvent(type, data);
	
}
///@function destroyTimelineEvent(timelineEvent)
///@description Destroy TimelineEvent entity.
///@param {TimelineEvent} timelineEvent
///@throws {Exception}
///@generated {2022-08-18T22:24:59.973Z}

function destroyTimelineEvent(timelineEvent) {


	
	var type = getTimelineEventType(timelineEvent);
	var data = getTimelineEventData(timelineEvent);
	
	destroyDataStructure(data, Map, "Unable to destroy Map data in TimelineEvent");
	setTimelineEventData(timelineEvent, null);
	

	
}
///@function getTimelineEventData(timelineEvent)
///@description Getter.
///@param {TimelineEvent} timelineEvent
///@return {Map<String::any>} data 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.973Z}

function getTimelineEventData(timelineEvent) {

	return timelineEvent[@ 1];
	
}
///@function getTimelineEventType(timelineEvent)
///@description Getter.
///@param {TimelineEvent} timelineEvent
///@return {String} type 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.973Z}

function getTimelineEventType(timelineEvent) {

	return timelineEvent[@ 0];
	
}
///@function setTimelineEventData(timelineEvent, data)
///@description Setter.
///@param {TimelineEvent} timelineEvent
///@param {Map<String::any>} data
///@throws {Exception}
///@generated {2022-08-18T22:24:59.973Z}

function setTimelineEventData(timelineEvent, data) {

	timelineEvent[@ 1] = data;
	
}
///@function setTimelineEventType(timelineEvent, type)
///@description Setter.
///@param {TimelineEvent} timelineEvent
///@param {String} type
///@throws {Exception}
///@generated {2022-08-18T22:24:59.973Z}

function setTimelineEventType(timelineEvent, type) {

	timelineEvent[@ 0] = type;
	
}

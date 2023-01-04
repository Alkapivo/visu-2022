///@description TimelineEntry entity

///@function createTimelineEntry(time, events)
///@description Constructor for TimelineEntry entity.
///@param {Number} time
///@param {TimelineEvent[]} events
///@return {TimelineEntry} timelineEntry 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.963Z}

function createTimelineEntry(time, events) {

	var timelineEntry = createEntity(TimelineEntry);

	setTimelineEntryTime(timelineEntry, assertNoOptional(time));
	setTimelineEntryEvents(timelineEntry, assertNoOptional(events));

	return timelineEntry;
	
}
///@function serializeTimelineEntry(timelineEntry)
///@description Serialize TimelineEntry to JSON string.
///@param {TimelineEntry} timelineEntry
///@return {String} timelineEntryJsonString 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.963Z}

function serializeTimelineEntry(timelineEntry) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"time",
		getTimelineEntryTime(timelineEntry));	
	appendEntityToJsonObject(
		jsonObject,
		"events",
		getTimelineEntryEvents(timelineEntry),
		"TimelineEvent",
		Array);
	

	var timelineEntryJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return timelineEntryJsonString;
	
}
///@function deserializeTimelineEntry(jsonString)
///@description Deserialize TimelineEntry from JSON String to TimelineEntry entity.
///@param {String} jsonString
///@return {TimelineEntry} timelineEntry 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.964Z}

function deserializeTimelineEntry(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var time = assertNoOptional(getJsonObjectFieldValue(jsonObject, "time"));
	var events = assertNoOptional(getJsonObjectFieldValue(jsonObject, "events", Array, "TimelineEvent"));

	destroyJsonObject(jsonObject);
	
	return createTimelineEntry(time, events);
	
}
///@function destroyTimelineEntry(timelineEntry)
///@description Destroy TimelineEntry entity.
///@param {TimelineEntry} timelineEntry
///@throws {Exception}
///@generated {2022-08-18T22:24:59.964Z}

function destroyTimelineEntry(timelineEntry) {


	
	var time = getTimelineEntryTime(timelineEntry);
	var events = getTimelineEntryEvents(timelineEntry);
	
	for (var index = 0; index < getArrayLength(events); index++) {
		var entity = events[@ index];
		destroyTimelineEvent(entity);
	}
	setTimelineEntryEvents(timelineEntry, null);
	

	
}
///@function getTimelineEntryEvents(timelineEntry)
///@description Getter.
///@param {TimelineEntry} timelineEntry
///@return {TimelineEvent[]} events 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.964Z}

function getTimelineEntryEvents(timelineEntry) {

	return timelineEntry[@ 1];
	
}
///@function getTimelineEntryTime(timelineEntry)
///@description Getter.
///@param {TimelineEntry} timelineEntry
///@return {Number} time 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.964Z}

function getTimelineEntryTime(timelineEntry) {

	return timelineEntry[@ 0];
	
}
///@function setTimelineEntryEvents(timelineEntry, events)
///@description Setter.
///@param {TimelineEntry} timelineEntry
///@param {TimelineEvent[]} events
///@throws {Exception}
///@generated {2022-08-18T22:24:59.964Z}

function setTimelineEntryEvents(timelineEntry, events) {

	timelineEntry[@ 1] = events;
	
}
///@function setTimelineEntryTime(timelineEntry, time)
///@description Setter.
///@param {TimelineEntry} timelineEntry
///@param {Number} time
///@throws {Exception}
///@generated {2022-08-18T22:24:59.964Z}

function setTimelineEntryTime(timelineEntry, time) {

	timelineEntry[@ 0] = time;
	
}

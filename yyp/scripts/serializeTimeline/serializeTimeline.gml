///@function serializeTimeline(timeline)
///@description Serialize Timeline to JSON string.
///@param {Timeline} timeline
///@return {String} timelineJsonString 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.829Z}

function serializeTimeline(timeline) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"time",
		getTimelineTime(timeline));	
	appendFieldToJsonObject(
		jsonObject,
		"context",
		getTimelineContext(timeline));	
	appendEntityToJsonObject(
		jsonObject,
		"stack",
		getTimelineStack(timeline),
		"Satck<GameEvent");
	

	var timelineJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return timelineJsonString;
	
}

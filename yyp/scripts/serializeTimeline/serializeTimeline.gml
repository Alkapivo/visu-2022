///@function serializeTimeline(timeline)
///@description Serialize Timeline to JSON string.
///@param {Timeline} timeline
///@return {String} timelineJsonString 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.953Z}

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

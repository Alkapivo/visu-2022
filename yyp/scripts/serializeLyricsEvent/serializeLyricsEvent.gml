///@function serializeLyricsEvent(lyricsEvent)
///@description Serialize LyricsEvent to JSON string.
///@param {LyricsEvent} lyricsEvent
///@return {String} lyricsEventJsonString 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.876Z}

function serializeLyricsEvent(lyricsEvent) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"lyrics",
		getLyricsEventLyrics(lyricsEvent),
		Array);
	
	appendFieldToJsonObject(
		jsonObject,
		"lifespan",
		getLyricsEventLifespan(lyricsEvent));	
	appendFieldToJsonObject(
		jsonObject,
		"duration",
		getLyricsEventDuration(lyricsEvent));	

	var lyricsEventJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return lyricsEventJsonString;
	
}

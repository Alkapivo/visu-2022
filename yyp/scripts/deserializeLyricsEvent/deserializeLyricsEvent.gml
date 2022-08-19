///@function deserializeLyricsEvent(jsonString)
///@description Deserialize LyricsEvent from JSON String to LyricsEvent entity.
///@param {String} jsonString
///@return {LyricsEvent} lyricsEvent 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.983Z}

function deserializeLyricsEvent(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var lyrics = assertNoOptional(getJsonObjectFieldValue(jsonObject, "lyrics", Array));
	var lifespan = assertNoOptional(getJsonObjectFieldValue(jsonObject, "lifespan"));
	var duration = assertNoOptional(getJsonObjectFieldValue(jsonObject, "duration"));

	destroyJsonObject(jsonObject);
	
	return createLyricsEvent(lyrics, lifespan, duration);
	
}

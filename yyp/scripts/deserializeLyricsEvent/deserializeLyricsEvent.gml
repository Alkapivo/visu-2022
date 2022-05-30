///@function deserializeLyricsEvent(jsonString)
///@description Deserialize LyricsEvent from JSON String to LyricsEvent entity.
///@param {String} jsonString
///@return {LyricsEvent} lyricsEvent 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.876Z}

function deserializeLyricsEvent(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var lyrics = assertNoOptional(getJsonObjectFieldValue(jsonObject, "lyrics", Array));
	var lifespan = assertNoOptional(getJsonObjectFieldValue(jsonObject, "lifespan"));
	var duration = assertNoOptional(getJsonObjectFieldValue(jsonObject, "duration"));

	destroyJsonObject(jsonObject);
	
	return createLyricsEvent(lyrics, lifespan, duration);
	
}

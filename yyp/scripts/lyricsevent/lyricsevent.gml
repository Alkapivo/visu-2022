///@description LyricsEvent entity

///@function createLyricsEvent(lyrics, lifespan, duration)
///@description Constructor for LyricsEvent entity.
///@param {String[]} lyrics
///@param {Number} lifespan
///@param {Number} duration
///@return {LyricsEvent} lyricsEvent 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.983Z}

function createLyricsEvent(lyrics, lifespan, duration) {

	var lyricsEvent = createEntity(LyricsEvent);

	setLyricsEventLyrics(lyricsEvent, assertNoOptional(lyrics));
	setLyricsEventLifespan(lyricsEvent, assertNoOptional(lifespan));
	setLyricsEventDuration(lyricsEvent, assertNoOptional(duration));

	return lyricsEvent;
	
}
///@function serializeLyricsEvent(lyricsEvent)
///@description Serialize LyricsEvent to JSON string.
///@param {LyricsEvent} lyricsEvent
///@return {String} lyricsEventJsonString 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.983Z}

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
///@function destroyLyricsEvent(lyricsEvent)
///@description Destroy LyricsEvent entity.
///@param {LyricsEvent} lyricsEvent
///@throws {Exception}
///@generated {2022-08-18T22:24:59.983Z}

function destroyLyricsEvent(lyricsEvent) {


	
	var lyrics = getLyricsEventLyrics(lyricsEvent);
	var lifespan = getLyricsEventLifespan(lyricsEvent);
	var duration = getLyricsEventDuration(lyricsEvent);
	
	setLyricsEventLyrics(lyricsEvent, null);
	

	
}
///@function getLyricsEventDuration(lyricsEvent)
///@description Getter.
///@param {LyricsEvent} lyricsEvent
///@return {Number} duration 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.984Z}

function getLyricsEventDuration(lyricsEvent) {

	return lyricsEvent[@ 2];
	
}
///@function getLyricsEventLifespan(lyricsEvent)
///@description Getter.
///@param {LyricsEvent} lyricsEvent
///@return {Number} lifespan 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.984Z}

function getLyricsEventLifespan(lyricsEvent) {

	return lyricsEvent[@ 1];
	
}
///@function getLyricsEventLyrics(lyricsEvent)
///@description Getter.
///@param {LyricsEvent} lyricsEvent
///@return {String[]} lyrics 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.983Z}

function getLyricsEventLyrics(lyricsEvent) {

	return lyricsEvent[@ 0];
	
}
///@function setLyricsEventDuration(lyricsEvent, duration)
///@description Setter.
///@param {LyricsEvent} lyricsEvent
///@param {Number} duration
///@throws {Exception}
///@generated {2022-08-18T22:24:59.984Z}

function setLyricsEventDuration(lyricsEvent, duration) {

	lyricsEvent[@ 2] = duration;
	
}
///@function setLyricsEventLifespan(lyricsEvent, lifespan)
///@description Setter.
///@param {LyricsEvent} lyricsEvent
///@param {Number} lifespan
///@throws {Exception}
///@generated {2022-08-18T22:24:59.984Z}

function setLyricsEventLifespan(lyricsEvent, lifespan) {

	lyricsEvent[@ 1] = lifespan;
	
}
///@function setLyricsEventLyrics(lyricsEvent, lyrics)
///@description Setter.
///@param {LyricsEvent} lyricsEvent
///@param {String[]} lyrics
///@throws {Exception}
///@generated {2022-08-18T22:24:59.984Z}

function setLyricsEventLyrics(lyricsEvent, lyrics) {

	lyricsEvent[@ 0] = lyrics;
	
}

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

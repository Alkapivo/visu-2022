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

///@function destroyLyricsEvent(lyricsEvent)
///@description Destroy LyricsEvent entity.
///@param {LyricsEvent} lyricsEvent
///@throws {Exception}
///@generated {2021-08-25T13:56:53.876Z}

function destroyLyricsEvent(lyricsEvent) {


	
	var lyrics = getLyricsEventLyrics(lyricsEvent);
	var lifespan = getLyricsEventLifespan(lyricsEvent);
	var duration = getLyricsEventDuration(lyricsEvent);
	
	setLyricsEventLyrics(lyricsEvent, null);
	

	
}

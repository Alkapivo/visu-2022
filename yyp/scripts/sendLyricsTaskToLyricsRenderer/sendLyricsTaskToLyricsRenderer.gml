///@function sendLyricsTaskToLyricsRenderer(lyricsTask)
///@desription Push lyricsTask to lyricsRenderer pipeline.
///@param {LyricsTask} lyricsRenderer
function sendLyricsTaskToLyricsRenderer(argument0) {

		// TODO LyricsTask entity
		var lyricsTaskJsonString = argument0;
	
		var lyricsTask = deserializeLyricsEvent(lyricsTaskJsonString);
	
		var lyricsRenderer = getLyricsRenderer();
		if (isOptionalPresent(lyricsRenderer)) {
			pushStack(lyricsRenderer.lyricsTaskPipeline, lyricsTask);	
		} else {
			logger("Trying to push LyricsTask when LyricsRenderer wasn't initialized", LogType.ERROR);	
		}
	



}

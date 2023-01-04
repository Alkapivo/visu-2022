///@function createLyricsRenderer(layerId)
///@description Constructor.
///@param {Layer} [layerId]
///@return {LyricsRenderer} lyricsRenderer
function createLyricsRenderer() {

		var class = LyricsRenderer;
		var instanceLayer = argument_count > 0 ? argument[0] : getSystemLayer();
	
		var instance = defaultContextInstanceConstructor(class, "LyricsRenderer", instanceLayer);
	
		return instance;
	



}

///@function getLyricsRenderer()
///@description Getter.
///@return {Optional<LyricsRenderer>} lyricsRenderer
function getLyricsRenderer() {

		return global.lyricsRendererContext;
	



}

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

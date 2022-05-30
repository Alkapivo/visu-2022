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

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

///@function sendLyricsEventToLyricsRenderer(lyricsEvent)
///@param {Struct} lyricsEvent
function sendLyricsEventToLyricsRenderer(lyricsEvent) {

	addElementToPipeline(getInstanceVariable(getLyricsRenderer(), "lyricsPipeline"), lyricsEvent);
}

///@param {String} jsonString
function parseJsonLyrics(jsonString) {
	
	parseLyricsTemplate = function(jsonObject) {
	
		var parseArea = function(map) {
			var area = {
				xStart: Core.Collections.Maps.get(map, "xStart"),
				yStart: Core.Collections.Maps.get(map, "yStart"),
				xEnd: Core.Collections.Maps.get(map, "xEnd"),
				yEnd: Core.Collections.Maps.get(map, "yEnd")
			}
			return area;
		}
		
		var template = {
            name: Core.Collections.Maps.get(jsonObject, "name"),
            font: Core.Assets.Font.fetch(Core.Collections.Maps.get(jsonObject, "font")),
			charInterval: Core.Collections.Maps.get(jsonObject, "charInterval"),
			charAmount: Core.Collections.Maps.get(jsonObject, "charAmount"),
			verticalAlign: Core.Collections.Maps.get(jsonObject, "verticalAlign"),
			horizontalAlign: Core.Collections.Maps.get(jsonObject, "horizontalAlign"),
			color: colorHashToGMColor(Core.Collections.Maps.get(jsonObject, "color")),
			useInvertedBackgroundColor: Core.Collections.Maps.get(jsonObject, "useInvertedBackgroundColor") == true,
			useConsoleStackAsLines: Core.Collections.Maps.get(jsonObject, "useConsoleStackAsLines") == true,
			shakeProbability: Core.Collections.Maps.get(jsonObject, "shakeProbability"),
			shakeAmount: Core.Collections.Lists.toArray(Core.Collections.Maps.get(jsonObject, "shakeAmount")),
			shakeDuration: Core.Collections.Lists.toArray(Core.Collections.Maps.get(jsonObject, "shakeDuration")),
			alpha: Core.Collections.Maps.get(jsonObject, "alpha"),
			linesPadding: Core.Collections.Maps.get(jsonObject, "linesPadding"),
			area: parseArea(Core.Collections.Maps.get(jsonObject, "area")),
			lines: Core.Collections.Lists.toArray(Core.Collections.Maps.get(jsonObject, "lines")),
        }
		return template;
	}   

    try {

        var gmJsonMap = Core.JSON.decode(jsonString);
		var gmJsonArray = Core.Collections.Maps.get(gmJsonMap, "default");
        for (var index = 0; index < Core.Collections.Lists.size(gmJsonArray); index++) {

            var gmJsonObject = Core.Collections.Lists.get(gmJsonArray, index);
            var template = parseLyricsTemplate(gmJsonObject);
            logger("Parsed LyricsTemplate: {0}", LogType.INFO, template.name);
            saveInRepository(fetchLyricsRepository(), template.name, template)
        }
		destroyDataStructure(gmJsonMap, Map);
    } catch (exception) {

        logger(exception.message, LogType.ERROR);
        printStackTrace();
    }
}


function fetchLyricsRepository() {

	return getLyricsRenderer().lyricsRepository;
}

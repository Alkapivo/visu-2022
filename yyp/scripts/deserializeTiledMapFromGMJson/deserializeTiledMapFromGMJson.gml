///@function deserializeTiledMapGMJsonInline(jsonString)
///@description Deserialize TiledMap from JSON String to TiledMap entity.
///@param {String} jsonString
///@return {Optional<TiledMap>} tiledMap 
///@throws {Exception}
function deserializeTiledMapFromGMJson(argument0) {

	var jsonString = argument0;
	
	var tiledMap = createEmptyOptional();
	var jsonObject = json_decode(jsonString);
	if (!isDataStructure(jsonObject, Map)) {
		throwException(
			createException(
				ParseException,
				"Unable to deserialize TiledMap"
			)
		);
		
		return tiledMap;
	}
	
	var layers = jsonObject[? "layers"];
	if (!isDataStructure(layers, List)) {
		throwException(
			createException(
				ParseException,
				"Unable to deserialize TiledMap - \"layers\" weren't found."
			)
		);
		
		return tiledMap;
	}
	
	var layersSize = getListSize(layers);
	var layersArray = createArray(layersSize);
	for (var index = 0; index < layersSize; index++) {
	
		var rawLayer = layers[| index];
		if (!isDataStructure(rawLayer, Map)) {
			
			throwException(
				createException(
					ParseException,
					"Unable to deserialize TiledMap - \"layers\" weren't found."
				)
			);
			
			break;
		}
		
		var tiledLayer = createTiledLayerFromGMJsonObject(rawLayer);
		
		if (isException()) {
			
			break;
		}
		
		layersArray[@ index] = tiledLayer;
	}
	
	var name = assertNoOptional(jsonObject[? "name"]);
	var width = assertNoOptional(jsonObject[? "width"]);
	var height = assertNoOptional(jsonObject[? "height"]);
	var tileWidth = assertNoOptional(jsonObject[? "tileWidth"]);
	var tileHeight = assertNoOptional(jsonObject[? "tileHeight"]);
	var compressMethod = assertNoOptional(jsonObject[? "compressMethod"]);
	
	destroyDataStructure(jsonObject, Map, "Unable to destroy TiledMap GMJson object");
	
	return createTiledMap(name, width, height, layersArray, tileWidth, tileHeight, compressMethod);
}

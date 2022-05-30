///@function destroyJsonArray(jsonArray)
///@description JsonArray destructor.
///@param {JsonArray} jsonArray
function destroyJsonArray(argument0) {

		var jsonArray = argument0;
		var decoder = getJsonArrayDecoder(jsonArray);
	
		switch (decoder) {
			case JsonDecoderType.GMJSON:
				///@gameMakerBug https://bugs.yoyogames.com/view.php?id=30496
				destroyDataStructure(getJsonArrayData(jsonArray), List, "JsonArray<GMJSON>");
				break;
			case JsonDecoderType.TJSON:
				/// TJSON is GC managed, this line is not necessary
				jsonArray[@ 1] = null;
				break;
			default:
				logger("Found unrecognized JsonDecoderType. Memory leak possible! Raw data: {0}", LogType.ERROR, decoder);
				break;
		}
	



}

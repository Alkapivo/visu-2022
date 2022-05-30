///@function destroyJsonObject(jsonObject)
///@description JsonObject destructor. Use only for jsonObject created by decodeJson
///@param {JsonObject} jsonObject
function destroyJsonObject(argument0) {

		var jsonObject = argument0;
		var decoder = getJsonObjectDecoder(jsonObject);
	
		switch (decoder) {
			case JsonDecoderType.GMJSON:
				///@gameMakerBug https://bugs.yoyogames.com/view.php?id=30496
				destroyDataStructure(getJsonObjectData(jsonObject), Map, "JsonObject<GMJSON>");
				break;
			case JsonDecoderType.TJSON:
				/// TJSON is GC managed, this line is not necessary
				jsonObject[@ 1] = null;
				break;
			default:
				logger("Found unrecognized JsonDecoderType. Memory leak possible! Raw data: {0}", LogType.ERROR, decoder);
				break;
		}
	



}

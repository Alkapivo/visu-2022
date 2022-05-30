///@function getJsonObjectSize(jsonObject)
///@description Getter
///@param {JsonObject} jsonObject
///@return {String[]} keys - return 0 if decoder wasn't recognized.
function getJsonObjectSize(argument0) {

		var jsonObject = argument0;
	
		var decoder = getJsonObjectDecoder(jsonObject);
		var data = getJsonObjectData(jsonObject);
	
		switch (decoder) {
			case JsonDecoderType.GMJSON:
				return getMapSize(data);
				break;
			case JsonDecoderType.TJSON:
				return tj_size(data);
				break;
			default:
				logger("Found unrecognized JsonDecoderType. Memory leak possible! Raw data: {0}", LogType.ERROR, decoder);
				return 0;
				break;
		}
	



}

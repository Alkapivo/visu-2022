///@function getJsonObjectKeys(jsonObject)
///@description Getter
///@param {JsonObject} jsonObject
///@return {String[]} keys - return empty array if decoder wasn't recognized.
function getJsonObjectKeys(argument0) {

		var jsonObject = argument0;
	
		var decoder = getJsonObjectDecoder(jsonObject);
		var data = getJsonObjectData(jsonObject);
	
		switch (decoder) {
			case JsonDecoderType.GMJSON:
				return getMapKeys(data);
				break;
			case JsonDecoderType.TJSON:
				return tj_keys(data);
				break;
			default:
				logger("Found unrecognized JsonDecoderType. Memory leak possible! Raw data: {0}", LogType.ERROR, decoder);
				return [];
				break;
		}
	



}

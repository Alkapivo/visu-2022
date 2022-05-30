///@function getJsonArraySize(jsonArray)
///@description Getter.
///@param {JsonArray} jsonArray
///@return {Integer} size - return 0 if decoder wasn't recognized.
function getJsonArraySize(argument0) {

		var jsonArray = argument0;
		var decoder = getJsonArrayDecoder(jsonArray);
		var data = getJsonArrayData(jsonArray);
	
		switch (decoder) {
			case JsonDecoderType.GMJSON:
				return getListSize(data);
				break;
			case JsonDecoderType.TJSON:
				return getArrayLength(data);
				break;
			default:
				logger("Found unrecognized JsonDecoderType. Memory leak possible! Raw data: {0}", LogType.ERROR, decoder);
				return 0;
				break;
		}
	



}

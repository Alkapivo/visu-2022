///@function isJsonArray(jsonArray)
///@description Validator.
///@param {JsonArray} jsonArray
///@return {Boolean} isValid - return false if decoder wasn't recognized.
function isJsonArray(argument0) {

		var jsonArray = argument0;
		var decoder = getJsonArrayDecoder(jsonArray);
		var data = getJsonArrayData(jsonArray);
	
		switch (decoder) {
			case JsonDecoderType.GMJSON:
				return isDataStructure(data, List);
				break;
			case JsonDecoderType.TJSON:
				return tj_is_array(data);
				break;
			default:
				logger("Found unrecognized JsonDecoderType. Memory leak possible! Raw data: {0}", LogType.ERROR, decoder);
				return false;
				break;
		}
	


}

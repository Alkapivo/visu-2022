///@function isJsonObject(jsonObject)
///@description Validator.
///@param {JsonObject} jsonObject
///@return {Boolean} isValid - return false if decoder wasn't recognized.
function isJsonObject(argument0) {

		var jsonObject = argument0;
		var decoder = getJsonObjectDecoder(jsonObject);
		var data = getJsonObjectData(jsonObject);
	
		switch (decoder) {
			case JsonDecoderType.GMJSON:
				return isDataStructure(data, Map);
				break;
			case JsonDecoderType.TJSON:
				return tj_is_object(data);
				break;
			default:
				logger("Found unrecognized JsonDecoderType. Memory leak possible! Raw data: {0}", LogType.ERROR, decoder);
				return false;
				break;
		}
	



}

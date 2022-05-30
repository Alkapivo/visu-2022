///@function jsonObjectContainKey(jsonObject, key)
///@description Validator.
///@param {JsonObject} jsonObject
///@return {Boolean} contains
function jsonObjectContainKey(argument0, argument1) {

		var jsonObject = argument0;
		var key = argument1;
	
		var decoder = getJsonObjectDecoder(jsonObject);
		var data = getJsonObjectData(jsonObject);
	
		switch (decoder) {
			case JsonDecoderType.GMJSON:
				return mapContains(data, key);
				break;
			case JsonDecoderType.TJSON:
				return arrayContain(getJsonObjectKeys(jsonObject), key);
				break;
			default:
				logger("Found unrecognized JsonDecoderType. Memory leak possible! Raw data: {0}", LogType.ERROR, decoder);
				return false;
				break;
		}
	



}

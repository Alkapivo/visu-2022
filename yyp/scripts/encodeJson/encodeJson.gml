///@function encodeJson(jsonEntity)
///@description Encode JsonObject|JsonArray to string.
///@param {JsonObject|JsonArray} jsonEntity
///@param {JsonDecoderType} [jsonDecoderType]
///@return {Optional<String>} jsonString - return null if json couldn't be parsed.
function encodeJson(argument0) {

		var jsonObject = argument0;
		var decoder = getJsonObjectDecoder(jsonObject);
		var data = getJsonObjectData(jsonObject);
	
		switch (decoder) {
			case JsonDecoderType.GMJSON:
				return json_encode(data);
				break;
			case JsonDecoderType.TJSON:
				return tj_encode(data);
				break;
			default:
				logger("Found unrecognized JsonDecoderType. Memory leak possible! Raw data: {0}", LogType.ERROR, decoder);
				return "{}";
				break;
		}
	



}

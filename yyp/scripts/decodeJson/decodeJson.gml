///@function decodeJson(jsonString, jsonDecoderType)
///@description Decode json string to JsonObject|JsonArray.
///@param {String} jsonString
///@param {JsonDecoderType} [jsonDecoderType]
///@return {Optional<JsonObject>|Optional<JsonArray>} jsonObject
///@throws {ParseException}
function decodeJson() {

		///checkArgumentCount(1, argument_count, decodeJson);

		var jsonString = argument[0];
		var decoder = argument_count > 1 ? argument[1] : getDefaultJsonDecoderType();

		var jsonData = null;
		switch (decoder) {
			case JsonDecoderType.GMJSON:
				jsonData = json_decode(jsonString);
				if (jsonData == -1) {
					jsonData = null;	
					throwException(createException(ParseException,
						stringParams("Unable to parse: jsonString. JSON String: {0}", jsonString),
						null));
				}
				break;
			case JsonDecoderType.TJSON:
				jsonData = tj_decode(jsonString);
				if (jsonData == tj_error) {
					jsonData = null;
					throwException(createException(ParseException,
						stringParams("Unable to parse: jsonString. Message: {0}, JSON String: {1}", tj_error_text, jsonString),
						null));
				}
				break;
			default:
				logger("Found unrecognized JsonDecoderType. Memory leak possible! data: {0}", LogType.ERROR, decoder);
				decoder = JsonDecoderType.GMJSON;
				jsonData = json_decode(jsonString);
				if (jsonData == -1) {
					jsonData = null;	
					throwException(createException(ParseException,
						stringParams("Unable to parse: jsonString. JSON String: {0}", jsonString),
						null));
				}
				break;
		}
	
		var jsonObject = createJsonObject(decoder, jsonData);
	
		return jsonObject;
	



}

///@function createJsonObject(decoder, data)
///@description JsonObject constructor.
///@param {JsonDecoderType} [decoder]
///@param {Object} [data]
///@return {JsonObject} jsonObject
function createJsonObject() {

		var decoder = argument_count > 0 ? argument[0] : getDefaultJsonDecoderType();
		var data = argument_count > 1 ? argument[1] : null;
	
		switch (decoder) {
			case JsonDecoderType.GMJSON:
				data = isOptionalPresent(data) ? data : createMap();
				break;
			case JsonDecoderType.TJSON:
				data = isOptionalPresent(data) ? data : tj_object();
				break;
		}
	
		var jsonObject = [ decoder, data ];
	
		return jsonObject;
	



}

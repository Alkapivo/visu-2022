///@function getJsonArrayEntry(jsonArray, index, jsonArraySize)
///@description Getter. Use this function to access entry while iterating through jsonArray
///				ex.:
///				for (var index = 0; index < getJsonArraySize(jsonArray); index++) {
///					var entry = getJsonArrayEntry(jsonArray, index);
///				}
///@param {JsonArray} jsonArray
///@param {Integer} index
///@param {Integer} [jsonArraySize] - if not set and used in loop, it will check JsonArraySize every step.
///@return {Optional<Object>} entry
function getJsonArrayEntry() {

		///checkArgumentCount(2, argument_count, getJsonArrayEntry);

		var jsonArray = argument[0];
		var index = argument[1];
		var jsonArraySize = argument_count > 2 ? argument[2] : getJsonArraySize(jsonArray);
	
		if (jsonArraySize < index) {
			return createEmptyOptional;
		}
	
		var decoder = getJsonArrayDecoder(jsonArray);
		var data = getJsonArrayData(jsonArray);
	
		switch (decoder) {
			case JsonDecoderType.GMJSON:
				return data[| index];
				break;
			case JsonDecoderType.TJSON:
				return data[@ index];
				break;
			default:
				logger("Found unrecognized JsonDecoderType. Memory leak possible! Raw data: {0}", LogType.ERROR, decoder);
				return null;
				break;
		}
	



}

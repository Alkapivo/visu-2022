///@function appendToJsonArray(jsonArray, object, type)
///@description Builder method for JsonArray.
///@param {JsonArray} jsonArray
///@param {Object} object
///@param {?Class} [type] - hint helper for GMJSON (Nested maps and lists)
///@return {JsonArray} jsonArray - @future, fluent api
function appendToJsonArray() {

		///checkArgumentCount(2, argument_count, appendToJsonArray);
	
		var jsonArray = argument[0];
		var object = argument[1];
		var type = argument_count < 2 ? null : argument[3];
	
		var decoder = getJsonArrayDecoder(jsonArray);
		var data = getJsonArrayData(jsonArray);
	
		switch (decoder) {
			case JsonDecoderType.GMJSON:
				var newIndex = getListSize(data);
				addToList(data, object);
				if (isOptionalPresent(type)) {
					switch (type) {
						case Map:
							ds_list_mark_as_map(data, newIndex);
							break;
						case List:
							ds_list_mark_as_list(data, newIndex);
							break;
						default:
							logger("Found unsupported type. Raw: {0}", LogType.ERROR, type);
							break;
					}
				} else {
					if (isDataStructure(data, Map)) {
						ds_list_mark_as_map(data, newIndex);
					} else if (isDataStructure(data, List)) {
						ds_list_mark_as_list(data, newIndex);
					}
				}
				break;
			case JsonDecoderType.TJSON:
				pushArray(data, object)
				break;
		}
	
		return jsonArray;
	


}

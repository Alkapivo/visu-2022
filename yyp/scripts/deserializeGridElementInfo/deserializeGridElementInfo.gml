///@function deserializeGridElementInfo(jsonString)
///@description Deserialize GridElementInfo from JSON String to GridElementInfo entity.
///@param {String} jsonString
///@return {GridElementInfo} gridElementInfo 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.617Z}

function deserializeGridElementInfo(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var isVisible = assertNoOptional(getJsonObjectFieldValue(jsonObject, "isVisible"));
	var type = assertNoOptional(getJsonObjectFieldValue(jsonObject, "type"));
	var color = assertNoOptional(getJsonObjectFieldValue(jsonObject, "color", Entity, "Color"));
	var text = assertNoOptional(getJsonObjectFieldValue(jsonObject, "text"));

	destroyJsonObject(jsonObject);
	
	return createGridElementInfo(isVisible, type, color, text);
	
}

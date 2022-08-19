///@function deserializeGridElement(jsonString)
///@description Deserialize GridElement from JSON String to GridElement entity.
///@param {String} jsonString
///@return {GridElement} gridElement 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.593Z}

function deserializeGridElement(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var position = assertNoOptional(getJsonObjectFieldValue(jsonObject, "position", Entity, "Position"));
	var sprite = assertNoOptional(getJsonObjectFieldValue(jsonObject, "sprite", Entity, "Sprite"));
	var info = assertNoOptional(getJsonObjectFieldValue(jsonObject, "info", Entity, "GridElementInfo"));

	destroyJsonObject(jsonObject);
	
	return createGridElement(position, sprite, info);
	
}

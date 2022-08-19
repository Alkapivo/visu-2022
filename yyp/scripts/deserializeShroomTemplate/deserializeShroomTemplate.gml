///@function deserializeShroomTemplate(jsonString)
///@description Deserialize ShroomTemplate from JSON String to ShroomTemplate entity.
///@param {String} jsonString
///@return {ShroomTemplate} shroomTemplate 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.921Z}

function deserializeShroomTemplate(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var sprite = assertNoOptional(getJsonObjectFieldValue(jsonObject, "sprite", Entity, "Sprite"));
	var type = assertNoOptional(getJsonObjectFieldValue(jsonObject, "type", Map, "Object"));
	var speedValues = assertNoOptional(getJsonObjectFieldValue(jsonObject, "speedValues", Array));
	var texts = assertNoOptional(getJsonObjectFieldValue(jsonObject, "texts", Array, "Tuple"));

	destroyJsonObject(jsonObject);
	
	return createShroomTemplate(sprite, type, speedValues, texts);
	
}

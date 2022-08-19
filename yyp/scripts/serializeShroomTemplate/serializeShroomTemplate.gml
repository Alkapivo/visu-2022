///@function serializeShroomTemplate(shroomTemplate)
///@description Serialize ShroomTemplate to JSON string.
///@param {ShroomTemplate} shroomTemplate
///@return {String} shroomTemplateJsonString 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.921Z}

function serializeShroomTemplate(shroomTemplate) {

	var jsonObject = createJsonObject();

	appendEntityToJsonObject(
		jsonObject,
		"sprite",
		getShroomTemplateSprite(shroomTemplate),
		"Sprite");
	
	appendEntityToJsonObject(
		jsonObject,
		"type",
		getShroomTemplateType(shroomTemplate),
		"Object",
		Map);
	
	appendFieldToJsonObject(
		jsonObject,
		"speedValues",
		getShroomTemplateSpeedValues(shroomTemplate),
		Array);
	
	appendEntityToJsonObject(
		jsonObject,
		"texts",
		getShroomTemplateTexts(shroomTemplate),
		"Tuple",
		Array);
	

	var shroomTemplateJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return shroomTemplateJsonString;
	
}

///@description ShroomTemplate entity

///@function createShroomTemplate(sprite, type, speedValues, texts)
///@description Constructor for ShroomTemplate entity.
///@param {Sprite} sprite
///@param {Map<String::Object>} type
///@param {Number[]} speedValues
///@param {Tuple[]} texts
///@return {ShroomTemplate} shroomTemplate 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.921Z}

function createShroomTemplate(sprite, type, speedValues, texts) {

	var shroomTemplate = createEntity(ShroomTemplate);

	setShroomTemplateSprite(shroomTemplate, assertNoOptional(sprite));
	setShroomTemplateType(shroomTemplate, assertNoOptional(type));
	setShroomTemplateSpeedValues(shroomTemplate, assertNoOptional(speedValues));
	setShroomTemplateTexts(shroomTemplate, assertNoOptional(texts));

	return shroomTemplate;
	
}
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
///@function destroyShroomTemplate(shroomTemplate)
///@description Destroy ShroomTemplate entity.
///@param {ShroomTemplate} shroomTemplate
///@generated {2019-11-02T12:52:14.353Z}
///@override
function destroyShroomTemplate(argument0) {

		var shroomTemplate = argument0;
	
		var sprite = getShroomTemplateSprite(shroomTemplate);
		var type = getShroomTemplateType(shroomTemplate);
		var texts = getShroomTemplateTexts(shroomTemplate);
	
		destroySprite(sprite);

	#region override
		var shaderTemplates = type[? "shaderTemplates"];
		for (var index = 0; index < getArrayLength(shaderTemplates); index++) {
			destroyShaderEvent(shaderTemplates[index]);	
		}
	#endregion
		destroyDataStructure(type, Map, "Unable to destroy Map type in ShroomTemplate");
		setShroomTemplateType(shroomTemplate, null);
		setShroomTemplateSpeedValues(shroomTemplate, null);
	
		for (var index = 0; index < getArrayLength(texts); index++) {
			var entity = texts[@ index];
			destroyTuple(entity);
		}
		setShroomTemplateTexts(shroomTemplate, null);
	



}
///@function getShroomTemplateSpeedValues(shroomTemplate)
///@description Getter.
///@param {ShroomTemplate} shroomTemplate
///@return {Number[]} speedValues 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.921Z}

function getShroomTemplateSpeedValues(shroomTemplate) {

	return shroomTemplate[@ 2];
	
}
///@function getShroomTemplateSprite(shroomTemplate)
///@description Getter.
///@param {ShroomTemplate} shroomTemplate
///@return {Sprite} sprite 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.921Z}

function getShroomTemplateSprite(shroomTemplate) {

	return shroomTemplate[@ 0];
	
}
///@function getShroomTemplateTexts(shroomTemplate)
///@description Getter.
///@param {ShroomTemplate} shroomTemplate
///@return {Tuple[]} texts 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.921Z}

function getShroomTemplateTexts(shroomTemplate) {

	return shroomTemplate[@ 3];
	
}
///@function getShroomTemplateType(shroomTemplate)
///@description Getter.
///@param {ShroomTemplate} shroomTemplate
///@return {Map<String::Object>} type 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.921Z}

function getShroomTemplateType(shroomTemplate) {

	return shroomTemplate[@ 1];
	
}
///@function setShroomTemplateSpeedValues(shroomTemplate, speedValues)
///@description Setter.
///@param {ShroomTemplate} shroomTemplate
///@param {Number[]} speedValues
///@throws {Exception}
///@generated {2022-08-18T22:24:59.921Z}

function setShroomTemplateSpeedValues(shroomTemplate, speedValues) {

	shroomTemplate[@ 2] = speedValues;
	
}
///@function setShroomTemplateSprite(shroomTemplate, sprite)
///@description Setter.
///@param {ShroomTemplate} shroomTemplate
///@param {Sprite} sprite
///@throws {Exception}
///@generated {2022-08-18T22:24:59.921Z}

function setShroomTemplateSprite(shroomTemplate, sprite) {

	shroomTemplate[@ 0] = sprite;
	
}
///@function setShroomTemplateTexts(shroomTemplate, texts)
///@description Setter.
///@param {ShroomTemplate} shroomTemplate
///@param {Tuple[]} texts
///@throws {Exception}
///@generated {2022-08-18T22:24:59.921Z}

function setShroomTemplateTexts(shroomTemplate, texts) {

	shroomTemplate[@ 3] = texts;
	
}
///@function setShroomTemplateType(shroomTemplate, type)
///@description Setter.
///@param {ShroomTemplate} shroomTemplate
///@param {Map<String::Object>} type
///@throws {Exception}
///@generated {2022-08-18T22:24:59.921Z}

function setShroomTemplateType(shroomTemplate, type) {

	shroomTemplate[@ 1] = type;
	
}

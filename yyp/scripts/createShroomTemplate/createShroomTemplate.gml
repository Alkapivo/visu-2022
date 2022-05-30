///@function createShroomTemplate(sprite, type, speedValues, texts)
///@description Constructor for ShroomTemplate entity.
///@param {Sprite} sprite
///@param {Map<String::Object>} type
///@param {Number[]} speedValues
///@param {Tuple[]} texts
///@return {ShroomTemplate} shroomTemplate 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.795Z}

function createShroomTemplate(sprite, type, speedValues, texts) {

	var shroomTemplate = createEntity(ShroomTemplate);

	setShroomTemplateSprite(shroomTemplate, assertNoOptional(sprite));
	setShroomTemplateType(shroomTemplate, assertNoOptional(type));
	setShroomTemplateSpeedValues(shroomTemplate, assertNoOptional(speedValues));
	setShroomTemplateTexts(shroomTemplate, assertNoOptional(texts));

	return shroomTemplate;
	
}

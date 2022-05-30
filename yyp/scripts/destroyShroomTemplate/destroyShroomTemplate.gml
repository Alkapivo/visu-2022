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

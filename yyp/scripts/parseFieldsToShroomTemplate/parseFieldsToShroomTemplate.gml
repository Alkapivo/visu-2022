///@function parseFieldsToShroomTemplate(fields)
///@description Parser for GameEvent entity.
///@param {Map<String::Object>} fields
///@return {ShroomTemplate} shroomTemplate
function parseFieldsToShroomTemplate(argument0) {

		var fields = argument0;

		///@jsonFieldName "sprite"
		var sprite = createSprite(
			getAssetIndex(getValueFromMap(fields, "sprite", "asset_texture_strip_beaver_boss"), AssetTexture, asset_texture_strip_beaver_boss),
			0.0, 1.0, 1.0, 1.0, 0.0, c_white);
							
		///@jsonFieldName "type"
		var type = getValueFromMap(fields, "type", createMap([ "name", "default" ]));
		var typeMap = createMap();
		var keys = tj_keys(type);
		for (var index = 0; index < getArrayLength(keys); index++) {
			var key = keys[index];
			var value = tj_get(type, key);
			if (key == "shaderTemplates") {
				var tjsonShaderTemplatesArray = tj_get(type, key);
				var value = [];
				for (var tjsonIndex = 0; tjsonIndex < getArrayLength(tjsonShaderTemplatesArray); tjsonIndex++) {
					var tjsonShaderTemplate = tjsonShaderTemplatesArray[tjsonIndex];
					var shaderEvent = deserializeShaderEvent(tj_encode(tjsonShaderTemplate));
					pushArray(value, shaderEvent);
				}
			}
			addToMap(typeMap, key, value);
		}
														
		///@jsonFieldName "speedValues"
		var speedValues = getValueFromMap(fields, "speedValues", [ 0.002 ]);
		speedValues = !isArray(speedValues) ? [ speedValues ] : cloneArray(speedValues);
		speedValues = getArrayLength(speedValues) == 0 ? [ 0.002 ] : speedValues;
							
		///@jsonFieldName "texts"
		var texts = getValueFromMap(fields, "texts", []);
		texts = !isArray(texts) ? [ texts ] : texts;
		var parsedTexts = [];
		if (getArrayLength(texts) == 0) {
			text = [ GridElementInfoType.DEFAULT, "" ];
			pushArray(parsedTexts, text);
		} else {
			for (var textIndex = 0; textIndex < getArrayLength(texts); textIndex++) {
				var text = texts[textIndex];
				if (isArray(text)) {
					var length = getArrayLength(text);
					if (length > 1) {
						var parsedType = parseGridElementInfoTypeStringToEnum(text[0]);
						text = [ parsedType == null ? GridElementInfoType.DEFAULT : parsedType, text[1]];
					} else {
						text = [ GridElementInfoType.DEFAULT, text[0]];
					}
				} else {
					text = [ GridElementInfoType.DEFAULT, text ];
				}
				pushArray(parsedTexts, text);
			}
		}
							
		var shroomTemplate = createShroomTemplate(sprite, typeMap, speedValues, parsedTexts);
	
		return shroomTemplate;
	



}

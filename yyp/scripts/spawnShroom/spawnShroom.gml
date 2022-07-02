///@function spawnShroom(shroomTemplate, position)
///@description Shroom spawner.
///@param {ShroomTemplate} shroomTemplate
///@param {Position} position
function spawnShroom(shroomTemplate, shroomPosition, horizontalSpeed, shroomState) {

		var type = cloneMap(getShroomTemplateType(shroomTemplate));
		var shaderTemplates = type[? "shaderTemplates"];
		if (!isUndefined(shaderTemplates)) {
			var newShaderTemplates = [];
			for (var index = 0; index < getArrayLength(shaderTemplates); index++) {
				var shaderTemplate = shaderTemplates[index];
				var shaderEventData = getShaderEventData(shaderTemplate);
				var clonedMap = cloneMap(shaderEventData);
				setShaderEventData(shaderTemplate, clonedMap);
				var shaderEvent = createShaderEvent(
					getShaderEventName(shaderTemplate),
					getShaderEventDuration(shaderTemplate),
					clonedMap);
				pushArray(newShaderTemplates, shaderEvent);
			}
			type[? "shaderTemplates"] = newShaderTemplates;
		}
	
		var texts = getShroomTemplateTexts(shroomTemplate);
		var text = getRandomValueFromArray(texts);
		var typeColor = type[? "name"] == "good" ? c_lime : c_red;
		var shroomGridElementInfo = createGridElementInfo(
			true,
			1.0,
			getTupleValue(text),
			typeColor);
	
		setPositionVertical(shroomPosition, getPositionVertical(shroomPosition));
		var gridElement = createGridElement(
			shroomPosition,
			cloneArray(getShroomTemplateSprite(shroomTemplate)),
			shroomGridElementInfo);
		
		var radius = fetchCollisionRadiusFromSprite(getGridElementSprite(gridElement));
		var speedValue = getRandomValueFromArray(getShroomTemplateSpeedValues(shroomTemplate));
		var state = shroomState;
		
		var text = createEmptyOptional();
		var updateHandler = function() {
			
			logger("///@todo updateHandler implement", LogType.DEBUG);	
		}
		
		var bulletCollisionHandler = function() {
			
			logger("///@todo bulletCollisionHandler implement", LogType.DEBUG);	
		}
		
		var playerCollisionHandler = function() {
		
			logger("///@todo playerCollisionHandler implement", LogType.DEBUG);
		}
		
		state[? "horizontalSpeed"] = argument_count > 2 ? argument[2] : 0;
		
		var shroom = createShroom(
			gridElement,
			radius,
			speedValue,
			state,
			text,
			updateHandler,
			bulletCollisionHandler,
			playerCollisionHandler
		);
		
		addToList(fetchShrooms(), shroom);
}

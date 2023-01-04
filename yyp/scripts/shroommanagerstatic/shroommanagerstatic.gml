///@function createShroomManager(layerId)
///@description Constructor.
///@param {Layer} [layerId]
///@return {ShroomManager} shroomManager
function createShroomManager() {

	var class = ShroomManager;
	var instanceLayer = argument_count > 0 ? argument[0] : getSystemLayer();
	
	var instance = defaultContextInstanceConstructor(class, "ShroomManager", instanceLayer);
	
	return instance;
}

///@function fetchShrooms()
///@description Return collection of Shroom.
///@return {List<Shroom>}
function fetchShrooms() {

	return getShroomManager().shrooms;
}

///@function getShroomManager();
///@description Getter.
///@return {Optional<ShroomManagerManager>} shroomManagerManager
function getShroomManager() {

	return global.shroomManagerContext;
}

///@function parseFieldsToShroomPosition(fields)
///@description GameEvent parser.
///@param {Map<String::Object>} fields
function parseFieldsToShroomPosition(argument0) {

	var fields = argument0;

	///@jsonFieldName "position"
	var position = getValueFromMap(fields, "position", createPosition(random(1000) / 1000, 0.0));
	position = !isArray(position) ? [ position, 0.0 ] : cloneArray(position);
	position = getArrayLength(position) < 1 ? createPosition(random(1000) / 1000, 0.0) : position;
	return position;
}

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

function makeShroom(config) {

	config = {
		horizontalRange: getDefaultValue(getStructVariable(config, "horizontalRange"), global.shroomVisuSpawnHorizontalRange),
		from: getDefaultValue(getStructVariable(config, "from"), getTupleKey(getDefaultValue(getStructVariable(config, "horizontalRange"), global.shroomVisuSpawnHorizontalRange)) * 100.0),
		to: getDefaultValue(getStructVariable(config, "to"), getTupleValue(getDefaultValue(getStructVariable(config, "horizontalRange"), global.shroomVisuSpawnHorizontalRange)) * 100.0),
		speedRange: getDefaultValue(getStructVariable(config, "speedRange"), global.shroomVisuSpawnSpeedRange),
		texture: getDefaultValue(getStructVariable(config, "texture"), getGridRenderer().shroom_texture_05),
		position: getDefaultValue(
            getStructVariable(config, "position"),
            createPosition(
			    (getDefaultValue(getStructVariable(config, "from"), getTupleKey(getDefaultValue(getStructVariable(config, "horizontalRange"), global.shroomVisuSpawnHorizontalRange)) * 100.0) 
				+ irandom(
					getDefaultValue(getStructVariable(config, "to"), getTupleValue(getDefaultValue(getStructVariable(config, "horizontalRange"), global.shroomVisuSpawnHorizontalRange)) * 100.0) 
					- getDefaultValue(getStructVariable(config, "from"), getTupleKey(getDefaultValue(getStructVariable(config, "horizontalRange"), global.shroomVisuSpawnHorizontalRange)) * 100.0)
				)) / 100.0,
			    0.003
            )
        ),
		horizontalSpeed: getDefaultValue(
            getStructVariable(config, "horizontalSpeed"), 
            choose(1, -1) * choose(0.00001, 0.0001)
        ),
		verticalSpeed: getDefaultValue(
            getStructVariable(config, "verticalSpeed"),
            random_range(
			    getPositionHorizontal(getDefaultValue(getStructVariable(config, "speedRange"), global.shroomVisuSpawnSpeedRange)), 
			    getPositionVertical(getDefaultValue(getStructVariable(config, "speedRange"), global.shroomVisuSpawnSpeedRange))
		    )
        ),
		features: {
			isShooting: getDefaultValue(getStructVariable(getStructVariable(config, "features"), "isShooting"), false),
			isZigzagMovement: getDefaultValue(getStructVariable(getStructVariable(config, "features"), "isZigzagMovement"), true),
			zigzagAmount: getDefaultValue(getStructVariable(getStructVariable(config, "features"), "zigzagAmount"), 0.0023),
			zigzagSpeed: getDefaultValue(getStructVariable(getStructVariable(config, "features"), "zigzagSpeed"), 0.13),
			bulletFollowPlayer: getDefaultValue(getStructVariable(getStructVariable(config, "features"), "bulletFollowPlayer"), true),
			slideAwayAfterLanding: getDefaultValue(getStructVariable(getStructVariable(config, "features"), "slideAwayAfterLanding"), false)
		}
        
	}
							
	logger("Spawn shroom: { x: {0}, y: {1}  }", LogType.INFO, 
		getPositionHorizontal(config.position), 
		getPositionVertical(config.position), 
		getAssetName(config.texture, AssetTexture)
	);
	spawnVisuShroom(config)
}

///@param {String} jsonString
function parseJsonShroomTemplates(jsonString) {

    parseShroomTemplate = function(jsonObject) {
        
        var template = {
            name: Core.Collections.Maps.get(jsonObject, "name"),
            texture: Core.Collections.Lists.toArray(Core.Collections.Maps.get(jsonObject, "texture")),
			spawnPosition: Core.Collections.Lists.toArray(Core.Collections.Maps.get(jsonObject, "spawnPosition")),
			baseSpeed: Core.Collections.Lists.toArray(Core.Collections.Maps.get(jsonObject, "baseSpeed")),
			features: Core.Collections.Maps.toStruct(Core.Collections.Maps.get(jsonObject, "features"))
        }
        return template;
    }    

    try {

        var gmJsonMap = Core.JSON.decode(jsonString);
		var gmJsonArray = Core.Collections.Maps.get(gmJsonMap, "default");
        for (var index = 0; index < Core.Collections.Lists.size(gmJsonArray); index++) {

            var gmJsonObject = Core.Collections.Lists.get(gmJsonArray, index);
            var template = parseShroomTemplate(gmJsonObject);
            logger("Parsed ShroomTemplate: {0}", LogType.INFO, template.name);
            saveInRepository(fetchShroomTemplateRepository(), template.name, template)
        }
		destroyDataStructure(gmJsonMap, Map);
    } catch (exception) {

        logger(exception.message, LogType.ERROR);
        printStackTrace();
    }
}

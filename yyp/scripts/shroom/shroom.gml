///@description Shroom entity

///@function createShroom(gridElement, radius, speedValue, state, text, updateHandler, bulletCollisionHandler, playerCollisionHandler)
///@description Constructor for Shroom entity.
///@param {GridElement} gridElement
///@param {Number} radius
///@param {Number} speedValue
///@param {Map<String::any>} state
///@param {Optional<String>} text
///@param {AssetScript} updateHandler
///@param {Optional<AssetScript>} bulletCollisionHandler
///@param {Optional<AssetScript>} playerCollisionHandler
///@return {Shroom} shroom 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.780Z}

function createShroom(gridElement, radius, speedValue, state, text, updateHandler, bulletCollisionHandler, playerCollisionHandler) {

	var shroom = createEntity(Shroom);

	setShroomGridElement(shroom, assertNoOptional(gridElement));
	setShroomRadius(shroom, assertNoOptional(radius));
	setShroomSpeedValue(shroom, assertNoOptional(speedValue));
	setShroomState(shroom, assertNoOptional(state));
	setShroomText(shroom, text);
	setShroomUpdateHandler(shroom, assertNoOptional(updateHandler));
	setShroomBulletCollisionHandler(shroom, bulletCollisionHandler);
	setShroomPlayerCollisionHandler(shroom, playerCollisionHandler);

	return shroom;
	
}
///@function serializeShroom(shroom)
///@description Serialize Shroom to JSON string.
///@param {Shroom} shroom
///@return {String} shroomJsonString 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.780Z}

function serializeShroom(shroom) {

	var jsonObject = createJsonObject();

	appendEntityToJsonObject(
		jsonObject,
		"gridElement",
		getShroomGridElement(shroom),
		"GridElement");
	
	appendFieldToJsonObject(
		jsonObject,
		"radius",
		getShroomRadius(shroom));	
	appendFieldToJsonObject(
		jsonObject,
		"speedValue",
		getShroomSpeedValue(shroom));	
	appendFieldToJsonObject(
		jsonObject,
		"state",
		getShroomState(shroom),
		Map);
	
	if (isOptionalPresent(getShroomText(shroom))) {
		appendFieldToJsonObject(
			jsonObject,
			"text",
			getShroomText(shroom));
	}
	
	appendFieldToJsonObject(
		jsonObject,
		"updateHandler",
		getShroomUpdateHandler(shroom));	
	if (isOptionalPresent(getShroomBulletCollisionHandler(shroom))) {
		appendFieldToJsonObject(
			jsonObject,
			"bulletCollisionHandler",
			getShroomBulletCollisionHandler(shroom));
	}
	
	if (isOptionalPresent(getShroomPlayerCollisionHandler(shroom))) {
		appendFieldToJsonObject(
			jsonObject,
			"playerCollisionHandler",
			getShroomPlayerCollisionHandler(shroom));
	}
	

	var shroomJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return shroomJsonString;
	
}

///@function deserializeShroom(jsonString)
///@description Deserialize Shroom from JSON String to Shroom entity.
///@param {String} jsonString
///@return {Shroom} shroom 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.781Z}

function deserializeShroom(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var gridElement = assertNoOptional(getJsonObjectFieldValue(jsonObject, "gridElement", Entity, "GridElement"));
	var radius = assertNoOptional(getJsonObjectFieldValue(jsonObject, "radius"));
	var speedValue = assertNoOptional(getJsonObjectFieldValue(jsonObject, "speedValue"));
	var state = assertNoOptional(getJsonObjectFieldValue(jsonObject, "state", Map));
	var text = getJsonObjectFieldValue(jsonObject, "text");
	var updateHandler = assertNoOptional(getJsonObjectFieldValue(jsonObject, "updateHandler"));
	var bulletCollisionHandler = getJsonObjectFieldValue(jsonObject, "bulletCollisionHandler");
	var playerCollisionHandler = getJsonObjectFieldValue(jsonObject, "playerCollisionHandler");

	destroyJsonObject(jsonObject);
	
	return createShroom(gridElement, radius, speedValue, state, text, updateHandler, bulletCollisionHandler, playerCollisionHandler);
	
}
///@function destroyShroom(shroom)
///@description Destroy Shroom entity.
///@param {Shroom} shroom
///@throws {Exception}
///@generated {2022-08-18T22:24:59.781Z}

function destroyShroom(shroom) {


	
	var gridElement = getShroomGridElement(shroom);
	var radius = getShroomRadius(shroom);
	var speedValue = getShroomSpeedValue(shroom);
	var state = getShroomState(shroom);
	var text = getShroomText(shroom);
	var updateHandler = getShroomUpdateHandler(shroom);
	var bulletCollisionHandler = getShroomBulletCollisionHandler(shroom);
	var playerCollisionHandler = getShroomPlayerCollisionHandler(shroom);
	
	destroyGridElement(gridElement);
	setShroomGridElement(shroom, null);
	
	destroyDataStructure(state, Map, "Unable to destroy Map state in Shroom");
	setShroomState(shroom, null);
	

	
}
///@function getShroomBulletCollisionHandler(shroom)
///@description Getter.
///@param {Shroom} shroom
///@return {Optional<AssetScript>} bulletCollisionHandler 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.781Z}

function getShroomBulletCollisionHandler(shroom) {

	return shroom[@ 6];
	
}

///@function getShroomGridElement(shroom)
///@description Getter.
///@param {Shroom} shroom
///@return {GridElement} gridElement 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.781Z}

function getShroomGridElement(shroom) {

	return shroom[@ 0];
	
}
///@function getShroomPlayerCollisionHandler(shroom)
///@description Getter.
///@param {Shroom} shroom
///@return {Optional<AssetScript>} playerCollisionHandler 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.781Z}

function getShroomPlayerCollisionHandler(shroom) {

	return shroom[@ 7];
	
}
///@function getShroomRadius(shroom)
///@description Getter.
///@param {Shroom} shroom
///@return {Number} radius 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.781Z}

function getShroomRadius(shroom) {

	return shroom[@ 1];
	
}
///@function getShroomSpeedValue(shroom)
///@description Getter.
///@param {Shroom} shroom
///@return {Number} speedValue 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.781Z}

function getShroomSpeedValue(shroom) {

	return shroom[@ 2];
	
}
///@function getShroomState(shroom)
///@description Getter.
///@param {Shroom} shroom
///@return {Map<String::any>} state 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.781Z}

function getShroomState(shroom) {

	return shroom[@ 3];
	
}

///@function getShroomText(shroom)
///@description Getter.
///@param {Shroom} shroom
///@return {Optional<String>} text 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.781Z}

function getShroomText(shroom) {

	return shroom[@ 4];
	
}
///@function getShroomUpdateHandler(shroom)
///@description Getter.
///@param {Shroom} shroom
///@return {AssetScript} updateHandler 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.781Z}

function getShroomUpdateHandler(shroom) {

	return shroom[@ 5];
	
}
///@function setShroomBulletCollisionHandler(shroom, bulletCollisionHandler)
///@description Setter.
///@param {Shroom} shroom
///@param {Optional<AssetScript>} bulletCollisionHandler
///@throws {Exception}
///@generated {2022-08-18T22:24:59.781Z}

function setShroomBulletCollisionHandler(shroom, bulletCollisionHandler) {

	shroom[@ 6] = bulletCollisionHandler;
	
}


///@function setShroomGridElement(shroom, gridElement)
///@description Setter.
///@param {Shroom} shroom
///@param {GridElement} gridElement
///@throws {Exception}
///@generated {2022-08-18T22:24:59.781Z}

function setShroomGridElement(shroom, gridElement) {

	shroom[@ 0] = gridElement;
	
}
///@function setShroomPlayerCollisionHandler(shroom, playerCollisionHandler)
///@description Setter.
///@param {Shroom} shroom
///@param {Optional<AssetScript>} playerCollisionHandler
///@throws {Exception}
///@generated {2022-08-18T22:24:59.781Z}

function setShroomPlayerCollisionHandler(shroom, playerCollisionHandler) {

	shroom[@ 7] = playerCollisionHandler;
	
}
///@function setShroomRadius(shroom, radius)
///@description Setter.
///@param {Shroom} shroom
///@param {Number} radius
///@throws {Exception}
///@generated {2022-08-18T22:24:59.781Z}

function setShroomRadius(shroom, radius) {

	shroom[@ 1] = radius;
	
}
///@function setShroomSpeedValue(shroom, speedValue)
///@description Setter.
///@param {Shroom} shroom
///@param {Number} speedValue
///@throws {Exception}
///@generated {2022-08-18T22:24:59.781Z}

function setShroomSpeedValue(shroom, speedValue) {

	shroom[@ 2] = speedValue;
	
}
///@function setShroomState(shroom, state)
///@description Setter.
///@param {Shroom} shroom
///@param {Map<String::any>} state
///@throws {Exception}
///@generated {2022-08-18T22:24:59.781Z}

function setShroomState(shroom, state) {

	shroom[@ 3] = state;
	
}

///@function setShroomText(shroom, text)
///@description Setter.
///@param {Shroom} shroom
///@param {Optional<String>} text
///@throws {Exception}
///@generated {2022-08-18T22:24:59.781Z}

function setShroomText(shroom, text) {

	shroom[@ 4] = text;
	
}
///@function setShroomUpdateHandler(shroom, updateHandler)
///@description Setter.
///@param {Shroom} shroom
///@param {AssetScript} updateHandler
///@throws {Exception}
///@generated {2022-08-18T22:24:59.781Z}

function setShroomUpdateHandler(shroom, updateHandler) {

	shroom[@ 5] = updateHandler;
	
}

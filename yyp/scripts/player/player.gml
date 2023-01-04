///@function createVisuPlayer(name, gridElement, status, state, inputHandler, horizontalSpeed, verticalSpeed, collisionRadius)
///@description Constructor for VisuPlayer entity.
///@param {String} name
///@param {GridElement} gridElement
///@param {PlayerStatus} status
///@param {Map<String::any>} state
///@param {Instance} inputHandler
///@param {Number} horizontalSpeed
///@param {Number} verticalSpeed
///@param {Number} collisionRadius
///@return {VisuPlayer} visuPlayer 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.640Z}
function createVisuPlayer(name, gridElement, status, state, inputHandler, horizontalSpeed, verticalSpeed, collisionRadius) {

	var visuPlayer = createEntity(VisuPlayer);

	setVisuPlayerName(visuPlayer, assertNoOptional(name));
	setVisuPlayerGridElement(visuPlayer, assertNoOptional(gridElement));
	setVisuPlayerStatus(visuPlayer, assertNoOptional(status));
	setVisuPlayerState(visuPlayer, assertNoOptional(state));
	setVisuPlayerInputHandler(visuPlayer, assertNoOptional(inputHandler));
	setVisuPlayerHorizontalSpeed(visuPlayer, assertNoOptional(horizontalSpeed));
	setVisuPlayerVerticalSpeed(visuPlayer, assertNoOptional(verticalSpeed));
	setVisuPlayerCollisionRadius(visuPlayer, assertNoOptional(collisionRadius));

	return visuPlayer;
}

///@function serializeVisuPlayer(visuPlayer)
///@description Serialize VisuPlayer to JSON string.
///@param {VisuPlayer} visuPlayer
///@return {String} visuPlayerJsonString 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.640Z}
function serializeVisuPlayer(visuPlayer) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"name",
		getVisuPlayerName(visuPlayer));	
	appendEntityToJsonObject(
		jsonObject,
		"gridElement",
		getVisuPlayerGridElement(visuPlayer),
		"GridElement");
	
	appendFieldToJsonObject(
		jsonObject,
		"status",
		getVisuPlayerStatus(visuPlayer));	
	appendFieldToJsonObject(
		jsonObject,
		"state",
		getVisuPlayerState(visuPlayer),
		Map);
	
	appendFieldToJsonObject(
		jsonObject,
		"inputHandler",
		getVisuPlayerInputHandler(visuPlayer));	
	appendFieldToJsonObject(
		jsonObject,
		"horizontalSpeed",
		getVisuPlayerHorizontalSpeed(visuPlayer));	
	appendFieldToJsonObject(
		jsonObject,
		"verticalSpeed",
		getVisuPlayerVerticalSpeed(visuPlayer));	
	appendFieldToJsonObject(
		jsonObject,
		"collisionRadius",
		getVisuPlayerCollisionRadius(visuPlayer));	

	var visuPlayerJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return visuPlayerJsonString;
}

///@function deserializeVisuPlayer(jsonString)
///@description Deserialize VisuPlayer from JSON String to VisuPlayer entity.
///@param {String} jsonString
///@return {VisuPlayer} visuPlayer 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.640Z}
function deserializeVisuPlayer(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var name = assertNoOptional(getJsonObjectFieldValue(jsonObject, "name"));
	var gridElement = assertNoOptional(getJsonObjectFieldValue(jsonObject, "gridElement", Entity, "GridElement"));
	var status = assertNoOptional(getJsonObjectFieldValue(jsonObject, "status"));
	var state = assertNoOptional(getJsonObjectFieldValue(jsonObject, "state", Map));
	var inputHandler = assertNoOptional(getJsonObjectFieldValue(jsonObject, "inputHandler"));
	var horizontalSpeed = assertNoOptional(getJsonObjectFieldValue(jsonObject, "horizontalSpeed"));
	var verticalSpeed = assertNoOptional(getJsonObjectFieldValue(jsonObject, "verticalSpeed"));
	var collisionRadius = assertNoOptional(getJsonObjectFieldValue(jsonObject, "collisionRadius"));

	destroyJsonObject(jsonObject);
	
	return createVisuPlayer(name, gridElement, status, state, inputHandler, horizontalSpeed, verticalSpeed, collisionRadius);
}

///@function destroyVisuPlayer(visuPlayer)
///@description Destroy VisuPlayer entity.
///@param {VisuPlayer} visuPlayer
///@throws {Exception}
///@generated {2021-08-25T13:56:53.640Z}
function destroyVisuPlayer(visuPlayer) {


	
	var name = getVisuPlayerName(visuPlayer);
	var gridElement = getVisuPlayerGridElement(visuPlayer);
	var status = getVisuPlayerStatus(visuPlayer);
	var state = getVisuPlayerState(visuPlayer);
	var inputHandler = getVisuPlayerInputHandler(visuPlayer);
	var horizontalSpeed = getVisuPlayerHorizontalSpeed(visuPlayer);
	var verticalSpeed = getVisuPlayerVerticalSpeed(visuPlayer);
	var collisionRadius = getVisuPlayerCollisionRadius(visuPlayer);
	
	destroyGridElement(gridElement);
	setVisuPlayerGridElement(visuPlayer, null);
	
	destroyDataStructure(state, Map, "Unable to destroy Map state in VisuPlayer");
	setVisuPlayerState(visuPlayer, null);
}

///@function getVisuPlayerName(visuPlayer)
///@description Getter.
///@param {VisuPlayer} visuPlayer
///@return {String} name 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.640Z}
function getVisuPlayerName(visuPlayer) {

	return visuPlayer[@ 0];
}

///@function getVisuPlayerGridElement(visuPlayer)
///@description Getter.
///@param {VisuPlayer} visuPlayer
///@return {GridElement} gridElement 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.640Z}
function getVisuPlayerGridElement(visuPlayer) {

	return visuPlayer[@ 1];
}

///@function getVisuPlayerStatus(visuPlayer)
///@description Getter.
///@param {VisuPlayer} visuPlayer
///@return {PlayerStatus} status 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.640Z}
function getVisuPlayerStatus(visuPlayer) {

	return visuPlayer[@ 2];	
}

///@function getVisuPlayerInputHandler(visuPlayer)
///@description Getter.
///@param {VisuPlayer} visuPlayer
///@return {Instance} inputHandler 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.640Z}
function getVisuPlayerInputHandler(visuPlayer) {

	return visuPlayer[@ 4];
	
}

///@function getVisuPlayerState(visuPlayer)
///@description Getter.
///@param {VisuPlayer} visuPlayer
///@return {Map<String::any>} state 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.640Z}
function getVisuPlayerState(visuPlayer) {

	return visuPlayer[@ 3];
	
}

///@function getVisuPlayerHorizontalSpeed(visuPlayer)
///@description Getter.
///@param {VisuPlayer} visuPlayer
///@return {Number} horizontalSpeed 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.640Z}

function getVisuPlayerHorizontalSpeed(visuPlayer) {

	return visuPlayer[@ 5];
	
}

///@function getVisuPlayerVerticalSpeed(visuPlayer)
///@description Getter.
///@param {VisuPlayer} visuPlayer
///@return {Number} verticalSpeed 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.640Z}

function getVisuPlayerVerticalSpeed(visuPlayer) {

	return visuPlayer[@ 6];
	
}

///@function getVisuPlayerCollisionRadius(visuPlayer)
///@description Getter.
///@param {VisuPlayer} visuPlayer
///@return {Number} collisionRadius 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.640Z}

function getVisuPlayerCollisionRadius(visuPlayer) {

	return visuPlayer[@ 7];
	
}

///@function setVisuPlayerName(visuPlayer, name)
///@description Setter.
///@param {VisuPlayer} visuPlayer
///@param {String} name
///@throws {Exception}
///@generated {2021-08-25T13:56:53.640Z}

function setVisuPlayerName(visuPlayer, name) {

	visuPlayer[@ 0] = name;
	
}

///@function setVisuPlayerGridElement(visuPlayer, gridElement)
///@description Setter.
///@param {VisuPlayer} visuPlayer
///@param {GridElement} gridElement
///@throws {Exception}
///@generated {2021-08-25T13:56:53.640Z}

function setVisuPlayerGridElement(visuPlayer, gridElement) {

	visuPlayer[@ 1] = gridElement;
	
}

///@function setVisuPlayerStatus(visuPlayer, status)
///@description Setter.
///@param {VisuPlayer} visuPlayer
///@param {PlayerStatus} status
///@throws {Exception}
///@generated {2021-08-25T13:56:53.640Z}

function setVisuPlayerStatus(visuPlayer, status) {

	visuPlayer[@ 2] = status;
	
}

///@function setVisuPlayerState(visuPlayer, state)
///@description Setter.
///@param {VisuPlayer} visuPlayer
///@param {Map<String::any>} state
///@throws {Exception}
///@generated {2021-08-25T13:56:53.640Z}

function setVisuPlayerState(visuPlayer, state) {

	visuPlayer[@ 3] = state;
	
}

///@function setVisuPlayerInputHandler(visuPlayer, inputHandler)
///@description Setter.
///@param {VisuPlayer} visuPlayer
///@param {Instance} inputHandler
///@throws {Exception}
///@generated {2021-08-25T13:56:53.640Z}

function setVisuPlayerInputHandler(visuPlayer, inputHandler) {

	visuPlayer[@ 4] = inputHandler;
	
}

///@function setVisuPlayerHorizontalSpeed(visuPlayer, horizontalSpeed)
///@description Setter.
///@param {VisuPlayer} visuPlayer
///@param {Number} horizontalSpeed
///@throws {Exception}
///@generated {2021-08-25T13:56:53.640Z}

function setVisuPlayerHorizontalSpeed(visuPlayer, horizontalSpeed) {

	visuPlayer[@ 5] = horizontalSpeed;
	
}

///@function setVisuPlayerVerticalSpeed(visuPlayer, verticalSpeed)
///@description Setter.
///@param {VisuPlayer} visuPlayer
///@param {Number} verticalSpeed
///@throws {Exception}
///@generated {2021-08-25T13:56:53.640Z}

function setVisuPlayerVerticalSpeed(visuPlayer, verticalSpeed) {

	visuPlayer[@ 6] = verticalSpeed;
	
}

///@function setVisuPlayerCollisionRadius(visuPlayer, collisionRadius)
///@description Setter.
///@param {VisuPlayer} visuPlayer
///@param {Number} collisionRadius
///@throws {Exception}
///@generated {2021-08-25T13:56:53.640Z}

function setVisuPlayerCollisionRadius(visuPlayer, collisionRadius) {

	visuPlayer[@ 7] = collisionRadius;
	
}
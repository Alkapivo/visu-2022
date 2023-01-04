///@description MouseAction entity

///@function createMouseAction(type, state, handler)
///@description Constructor for MouseAction entity.
///@param {String} type
///@param {Boolean} state
///@param {AssetScript} handler
///@return {MouseAction} mouseAction 
///@throws {Exception}
///@generated {2021-05-01T23:49:41.578Z}

function createMouseAction(type, state, handler) {

	var mouseAction = createEntity(MouseAction);

	setMouseActionType(mouseAction, assertNoOptional(type));
	setMouseActionState(mouseAction, assertNoOptional(state));
	setMouseActionHandler(mouseAction, assertNoOptional(handler));

	return mouseAction;
	
}
///@function serializeMouseAction(mouseAction)
///@description Serialize MouseAction to JSON string.
///@param {MouseAction} mouseAction
///@return {String} mouseActionJsonString 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.907Z}

function serializeMouseAction(mouseAction) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"type",
		getMouseActionType(mouseAction));	
	appendFieldToJsonObject(
		jsonObject,
		"state",
		getMouseActionState(mouseAction));	
	appendFieldToJsonObject(
		jsonObject,
		"handler",
		getMouseActionHandler(mouseAction));	

	var mouseActionJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return mouseActionJsonString;
	
}
///@function deserializeMouseAction(jsonString)
///@description Deserialize MouseAction from JSON String to MouseAction entity.
///@param {String} jsonString
///@return {MouseAction} mouseAction 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.908Z}

function deserializeMouseAction(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var type = assertNoOptional(getJsonObjectFieldValue(jsonObject, "type"));
	var state = assertNoOptional(getJsonObjectFieldValue(jsonObject, "state"));
	var handler = assertNoOptional(getJsonObjectFieldValue(jsonObject, "handler"));

	destroyJsonObject(jsonObject);
	
	return createMouseAction(type, state, handler);
	
}
///@function destroyMouseAction(mouseAction)
///@description Destroy MouseAction entity.
///@param {MouseAction} mouseAction
///@throws {Exception}
///@generated {2021-05-01T23:43:42.915Z}

function destroyMouseAction(mouseAction) {


	
	var type = getMouseActionType(mouseAction);
	var state = getMouseActionState(mouseAction);
	var handler = getMouseActionHandler(mouseAction);
	

	
}

///@function getMouseActionHandler(mouseAction)
///@description Getter.
///@param {MouseAction} mouseAction
///@return {AssetScript} handler 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.915Z}

function getMouseActionHandler(mouseAction) {

	return mouseAction[@ 2];
	
}
///@function getMouseActionState(mouseAction)
///@description Getter.
///@param {MouseAction} mouseAction
///@return {Boolean} state 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.915Z}

function getMouseActionState(mouseAction) {

	return mouseAction[@ 1];
	
}
///@function getMouseActionType(mouseAction)
///@description Getter.
///@param {MouseAction} mouseAction
///@return {String} type 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.915Z}

function getMouseActionType(mouseAction) {

	return mouseAction[@ 0];
	
}

///@function setMouseActionHandler(mouseAction, handler)
///@description Setter.
///@param {MouseAction} mouseAction
///@param {AssetScript} handler
///@throws {Exception}
///@generated {2021-05-01T23:49:41.579Z}

function setMouseActionHandler(mouseAction, handler) {

	mouseAction[@ 2] = handler;
	
}
///@function setMouseActionState(mouseAction, state)
///@description Setter.
///@param {MouseAction} mouseAction
///@param {Boolean} state
///@throws {Exception}
///@generated {2021-05-01T23:49:41.579Z}

function setMouseActionState(mouseAction, state) {

	mouseAction[@ 1] = state;
	
}
///@function setMouseActionType(mouseAction, type)
///@description Setter.
///@param {MouseAction} mouseAction
///@param {String} type
///@throws {Exception}
///@generated {2021-05-01T23:49:41.579Z}

function setMouseActionType(mouseAction, type) {

	mouseAction[@ 0] = type;
	
}

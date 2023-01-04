///@description MouseActionEvent entity

///@function createMouseActionEvent(type, state, viewX, viewY, guiX, guiY)
///@description Constructor for MouseActionEvent entity.
///@param {String} type
///@param {Boolean} state
///@param {Integer} viewX
///@param {Integer} viewY
///@param {Integer} guiX
///@param {Integer} guiY
///@return {MouseActionEvent} mouseActionEvent 
///@throws {Exception}
///@generated {2021-05-01T23:49:41.602Z}

function createMouseActionEvent(type, state, viewX, viewY, guiX, guiY) {

	var mouseActionEvent = createEntity(MouseActionEvent);

	setMouseActionEventType(mouseActionEvent, assertNoOptional(type));
	setMouseActionEventState(mouseActionEvent, assertNoOptional(state));
	setMouseActionEventViewX(mouseActionEvent, assertNoOptional(viewX));
	setMouseActionEventViewY(mouseActionEvent, assertNoOptional(viewY));
	setMouseActionEventGuiX(mouseActionEvent, assertNoOptional(guiX));
	setMouseActionEventGuiY(mouseActionEvent, assertNoOptional(guiY));

	return mouseActionEvent;
	
}
///@function serializeMouseActionEvent(mouseActionEvent)
///@description Serialize MouseActionEvent to JSON string.
///@param {MouseActionEvent} mouseActionEvent
///@return {String} mouseActionEventJsonString 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.999Z}

function serializeMouseActionEvent(mouseActionEvent) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"type",
		getMouseActionEventType(mouseActionEvent));	
	appendFieldToJsonObject(
		jsonObject,
		"state",
		getMouseActionEventState(mouseActionEvent));	
	appendFieldToJsonObject(
		jsonObject,
		"viewX",
		getMouseActionEventViewX(mouseActionEvent));	
	appendFieldToJsonObject(
		jsonObject,
		"viewY",
		getMouseActionEventViewY(mouseActionEvent));	
	appendFieldToJsonObject(
		jsonObject,
		"guiX",
		getMouseActionEventGuiX(mouseActionEvent));	
	appendFieldToJsonObject(
		jsonObject,
		"guiY",
		getMouseActionEventGuiY(mouseActionEvent));	

	var mouseActionEventJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return mouseActionEventJsonString;
	
}
///@function deserializeMouseActionEvent(jsonString)
///@description Deserialize MouseActionEvent from JSON String to MouseActionEvent entity.
///@param {String} jsonString
///@return {MouseActionEvent} mouseActionEvent 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.999Z}

function deserializeMouseActionEvent(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var type = assertNoOptional(getJsonObjectFieldValue(jsonObject, "type"));
	var state = assertNoOptional(getJsonObjectFieldValue(jsonObject, "state"));
	var viewX = assertNoOptional(getJsonObjectFieldValue(jsonObject, "viewX"));
	var viewY = assertNoOptional(getJsonObjectFieldValue(jsonObject, "viewY"));
	var guiX = assertNoOptional(getJsonObjectFieldValue(jsonObject, "guiX"));
	var guiY = assertNoOptional(getJsonObjectFieldValue(jsonObject, "guiY"));

	destroyJsonObject(jsonObject);
	
	return createMouseActionEvent(type, state, viewX, viewY, guiX, guiY);
	
}
///@function destroyMouseActionEvent(mouseActionEvent)
///@description Destroy MouseActionEvent entity.
///@param {MouseActionEvent} mouseActionEvent
///@throws {Exception}
///@generated {2021-05-01T23:43:42.999Z}

function destroyMouseActionEvent(mouseActionEvent) {


	
	var type = getMouseActionEventType(mouseActionEvent);
	var state = getMouseActionEventState(mouseActionEvent);
	var viewX = getMouseActionEventViewX(mouseActionEvent);
	var viewY = getMouseActionEventViewY(mouseActionEvent);
	var guiX = getMouseActionEventGuiX(mouseActionEvent);
	var guiY = getMouseActionEventGuiY(mouseActionEvent);
	

	
}
///@function getMouseActionEventGuiX(mouseActionEvent)
///@description Getter.
///@param {MouseActionEvent} mouseActionEvent
///@return {Integer} guiX 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.999Z}

function getMouseActionEventGuiX(mouseActionEvent) {

	return mouseActionEvent[@ 4];
	
}
///@function getMouseActionEventGuiY(mouseActionEvent)
///@description Getter.
///@param {MouseActionEvent} mouseActionEvent
///@return {Integer} guiY 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.999Z}

function getMouseActionEventGuiY(mouseActionEvent) {

	return mouseActionEvent[@ 5];
	
}
///@function getMouseActionEventState(mouseActionEvent)
///@description Getter.
///@param {MouseActionEvent} mouseActionEvent
///@return {Boolean} state 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.999Z}

function getMouseActionEventState(mouseActionEvent) {

	return mouseActionEvent[@ 1];
	
}
///@function getMouseActionEventType(mouseActionEvent)
///@description Getter.
///@param {MouseActionEvent} mouseActionEvent
///@return {String} type 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.999Z}

function getMouseActionEventType(mouseActionEvent) {

	return mouseActionEvent[@ 0];
	
}
///@function getMouseActionEventViewX(mouseActionEvent)
///@description Getter.
///@param {MouseActionEvent} mouseActionEvent
///@return {Integer} viewX 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.999Z}

function getMouseActionEventViewX(mouseActionEvent) {

	return mouseActionEvent[@ 2];
	
}
///@function getMouseActionEventViewY(mouseActionEvent)
///@description Getter.
///@param {MouseActionEvent} mouseActionEvent
///@return {Integer} viewY 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.999Z}

function getMouseActionEventViewY(mouseActionEvent) {

	return mouseActionEvent[@ 3];
	
}
///@function setMouseActionEventGuiX(mouseActionEvent, guiX)
///@description Setter.
///@param {MouseActionEvent} mouseActionEvent
///@param {Integer} guiX
///@throws {Exception}
///@generated {2021-05-01T23:49:41.604Z}

function setMouseActionEventGuiX(mouseActionEvent, guiX) {

	mouseActionEvent[@ 4] = guiX;
	
}
///@function setMouseActionEventGuiY(mouseActionEvent, guiY)
///@description Setter.
///@param {MouseActionEvent} mouseActionEvent
///@param {Integer} guiY
///@throws {Exception}
///@generated {2021-05-01T23:49:41.604Z}

function setMouseActionEventGuiY(mouseActionEvent, guiY) {

	mouseActionEvent[@ 5] = guiY;
	
}
///@function setMouseActionEventState(mouseActionEvent, state)
///@description Setter.
///@param {MouseActionEvent} mouseActionEvent
///@param {Boolean} state
///@throws {Exception}
///@generated {2021-05-01T23:49:41.604Z}

function setMouseActionEventState(mouseActionEvent, state) {

	mouseActionEvent[@ 1] = state;
	
}
///@function setMouseActionEventType(mouseActionEvent, type)
///@description Setter.
///@param {MouseActionEvent} mouseActionEvent
///@param {String} type
///@throws {Exception}
///@generated {2021-05-01T23:49:41.603Z}

function setMouseActionEventType(mouseActionEvent, type) {

	mouseActionEvent[@ 0] = type;
	
}
///@function setMouseActionEventViewX(mouseActionEvent, viewX)
///@description Setter.
///@param {MouseActionEvent} mouseActionEvent
///@param {Integer} viewX
///@throws {Exception}
///@generated {2021-05-01T23:49:41.604Z}

function setMouseActionEventViewX(mouseActionEvent, viewX) {

	mouseActionEvent[@ 2] = viewX;
	
}
///@function setMouseActionEventViewY(mouseActionEvent, viewY)
///@description Setter.
///@param {MouseActionEvent} mouseActionEvent
///@param {Integer} viewY
///@throws {Exception}
///@generated {2021-05-01T23:49:41.604Z}

function setMouseActionEventViewY(mouseActionEvent, viewY) {

	mouseActionEvent[@ 3] = viewY;
	
}

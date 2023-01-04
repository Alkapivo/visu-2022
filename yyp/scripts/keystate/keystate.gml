///@description KeyState entity

///@function createKeyState(check, pressed, released)
///@description Constructor for KeyState entity.
///@param {Boolean} check
///@param {Boolean} pressed
///@param {Boolean} released
///@return {KeyState} keyState 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.429Z}
function createKeyState(argument0, argument1, argument2) {

		var check = argument0;
		var pressed = argument1;
		var released = argument2;
	
		var keyState = createEntity(KeyState);

		setKeyStateCheck(keyState, assertNoOptional(check));
		setKeyStatePressed(keyState, assertNoOptional(pressed));
		setKeyStateReleased(keyState, assertNoOptional(released));

		return keyState;
	



}
///@function serializeKeyState(keyState)
///@description Serialize KeyState to JSON string.
///@param {KeyState} keyState
///@return {String} keyStateJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:41.075Z}
function serializeKeyState(argument0) {

		var keyState = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"check",
			getKeyStateCheck(keyState));	
		appendFieldToJsonObject(
			jsonObject,
			"pressed",
			getKeyStatePressed(keyState));	
		appendFieldToJsonObject(
			jsonObject,
			"released",
			getKeyStateReleased(keyState));	

		var keyStateJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return keyStateJsonString;
	



}
///@function deserializeKeyState(jsonString)
///@description Deserialize KeyState from JSON String to KeyState entity.
///@param {String} jsonString
///@return {KeyState} keyState 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.429Z}
function deserializeKeyState(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var check = assertNoOptional(getJsonObjectFieldValue(jsonObject, "check"));
		var pressed = assertNoOptional(getJsonObjectFieldValue(jsonObject, "pressed"));
		var released = assertNoOptional(getJsonObjectFieldValue(jsonObject, "released"));

		destroyJsonObject(jsonObject);
	
		return createKeyState(check, pressed, released);
	



}
///@function destroyKeyState(keyState)
///@description Destroy KeyState entity.
///@param {KeyState} keyState
///@throws {Exception}
///@generated {2020-09-28T21:11:15.429Z}
function destroyKeyState(argument0) {

		var keyState = argument0;
	
		var check = getKeyStateCheck(keyState);
		var pressed = getKeyStatePressed(keyState);
		var released = getKeyStateReleased(keyState);
	

	



}
///@function getKeyStateCheck(keyState)
///@description Getter.
///@param {KeyState} keyState
///@return {Boolean} check 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.429Z}
function getKeyStateCheck(argument0) {

		return argument0[@ 0];
	



}
///@function getKeyStatePressed(keyState)
///@description Getter.
///@param {KeyState} keyState
///@return {Boolean} pressed 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.429Z}
function getKeyStatePressed(argument0) {

		return argument0[@ 1];
	



}
///@function getKeyStateReleased(keyState)
///@description Getter.
///@param {KeyState} keyState
///@return {Boolean} released 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.429Z}
function getKeyStateReleased(argument0) {

		return argument0[@ 2];
	



}
///@function setKeyStateCheck(keyState, check)
///@description Setter.
///@param {KeyState} keyState
///@param {Boolean} check
///@throws {Exception}
///@generated {2020-09-28T21:11:15.429Z}
function setKeyStateCheck(argument0, argument1) {

		argument0[@ 0] = argument1;
	



}
///@function setKeyStatePressed(keyState, pressed)
///@description Setter.
///@param {KeyState} keyState
///@param {Boolean} pressed
///@throws {Exception}
///@generated {2020-09-28T21:11:15.429Z}
function setKeyStatePressed(argument0, argument1) {

		argument0[@ 1] = argument1;
	



}
///@function setKeyStateReleased(keyState, released)
///@description Setter.
///@param {KeyState} keyState
///@param {Boolean} released
///@throws {Exception}
///@generated {2020-09-28T21:11:15.429Z}
function setKeyStateReleased(argument0, argument1) {

		argument0[@ 2] = argument1;
	



}

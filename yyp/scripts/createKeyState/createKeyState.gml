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

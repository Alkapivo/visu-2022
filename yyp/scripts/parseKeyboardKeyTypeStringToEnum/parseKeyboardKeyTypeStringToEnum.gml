///@function parseKeyboardKeyTypeStringToEnum(keyboardKeyTypeString)
///@description Enum to String parser.
///@param {String} keyboardKeyTypeString
///@return {Optional<KeyboardKeyType>} keyboardKeyType
function parseKeyboardKeyTypeStringToEnum(argument0) {

		var keyboardKeyTypeString = argument0;
	
		var keyboardKeyType = null;
		switch (keyboardKeyTypeString) {
			case "38":
			    keyboardKeyType = KeyboardKeyType.KEY_UP;
			    break;
			case "40":
			    keyboardKeyType = KeyboardKeyType.KEY_DOWN;
			    break;
			case "37":
			    keyboardKeyType = KeyboardKeyType.KEY_LEFT;
			    break;
			case "39":
			    keyboardKeyType = KeyboardKeyType.KEY_RIGHT;
			    break;
			case "87":
			    keyboardKeyType = KeyboardKeyType.KEY_W;
			    break;
			case "65":
			    keyboardKeyType = KeyboardKeyType.KEY_A;
			    break;
			case "83":
			    keyboardKeyType = KeyboardKeyType.KEY_S;
			    break;
			case "68":
			    keyboardKeyType = KeyboardKeyType.KEY_D;
			    break;
			case "32":
			    keyboardKeyType = KeyboardKeyType.KEY_SPACE;
			    break;
			case "90":
			    keyboardKeyType = KeyboardKeyType.KEY_Z;
			    break;

		}
	
		return keyboardKeyType;
	



}

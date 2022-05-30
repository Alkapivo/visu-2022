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

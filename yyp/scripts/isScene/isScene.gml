///@function isScene(scene)
///@description Validator.
///@param {any} scene
///@return {Boolean} result
function isScene(argument0) {

		var scene = argument0;

		return isNumber(scene) ? room_exists(scene) : false;
	



}

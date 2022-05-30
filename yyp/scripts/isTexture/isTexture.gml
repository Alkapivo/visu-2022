///@function isTexture(texture)
///@description Validator.
///@param {any} texture
///@return {Boolean} result
function isTexture(argument0) {

		var texture = argument0;

		return isNumber(texture) ? sprite_exists(texture) : false;
	



}

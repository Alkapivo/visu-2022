///@function getCosNorm(normValue)
///@description Wrapper for cos(x), where
///@            x is in [0.0; 2.0] range, where 
///@            0 = cos(0), 1.0 = cos(pi), 2.0 = cos(2 * pi).
///@param {Number} normValue @throws {RuntimeException|AlgebraicException}
///@return {Number} cosNormValue
function getCosNorm(argument0) {

		var normValue = argument0;
	
		return cos((normValue mod 2.0) * pi);
	



}

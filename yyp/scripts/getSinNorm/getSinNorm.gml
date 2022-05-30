///@function getSinNorm(normValue)
///@description Wrapper for sin(x), where
///@            x is in [0.0; 2.0] range, where 
///@            0 = sin(0), 1.0 = sin(pi), 2.0 = sin(2 * pi).
///@param {Number} normValue @throws {RuntimeException}
///@return {Number} sinNormValue
function getSinNorm(argument0) {

		var normValue = argument0;
	
		return sin((normValue mod 2.0) * pi);
	



}

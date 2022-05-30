///@function calculateMat2Det(mat2)
///@description Calculate Determinent of Matrix 2x2.
///@param {Mat2} mat2
///@return {Number} det
function calculateMat2Det(argument0) {

		var mat2 = argument0;
	
		// Cramer method
		var firstRow = mat2[0];
		var secondRow = mat2[1];
	
		var det = firstRow[0] * secondRow[1] - firstRow[1] * secondRow[0];
	
		return det;
	



}

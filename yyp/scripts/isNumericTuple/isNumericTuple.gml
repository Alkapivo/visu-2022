///@function isNumericTuple(tuple)
///@description Validator.
///@param {Tuple<any::any>} tuple
///@return {Boolean} result
function isNumericTuple(argument0) {

		var tuple = argument0;
	
		if (!isEntity(tuple, Tuple)) {
			return false;	
		}
	
		if ((!isNumber(getTupleKey(tuple))) || 
			(!isNumber(getTupleValue(tuple)))) {
			return false;		
		}
	
		return true;
	



}

///@function isNumberInRange(number, from, to includeFrom, includeTo)
///@description Return true if number is in range from-to.
///@param {Number} number ///@throws {RuntimeException|AlgebraicException}
///@param {Number} from ///@throws {RuntimeException|AlgebraicException}
///@param {Number} to ///@throws {RuntimeException|AlgebraicException}
///@param {Boolean} [includeFrom=true]
///@param {Boolean} [includeTo=true]
///@return {Boolean} isInRange
function isNumberInRange() {

		var number = argument[0];
		var from = argument[1];
		var to = argument[2];
		var includeFrom = argument_count > 3 ? argument[3] : true;
		var includeTo = argument_count > 3 ? argument[3] : true;
	
		var isInRange = (includeFrom ? number >= from : number > from) && (includeTo ? number <= to : number < to)
	
		return isInRange;
	



}

///@function checkFact(factId, factValue)
///@descripiton Validator.
///@param {String} factId
///@param {Boolean} [factValue=true]
///@return {Boolean} is
function checkFact() {

		var factId = argument[0];
		var factValue = argument_count > 1 ? argument[1] : true;

		var fact = getFact(factId);
	
		return getFactValue(fact) == factValue;
	



}

///@function getFactNotfy(context)
///@description Safe getter for factNotify field used in instances by FactManager.
///@param {Instance} context
///@return {Boolean} factNotify
function getFactNotify(argument0) {

		var context = argument0;
	
		var factNotify = getInstanceVariable(context, FactNotify);
		if (!isOptionalPresent(factNotify)) {
		
			factNotify = false;
			setInstanceVariable(context, FactNotify, factNotify);
		}
	
		return factNotify;
	



}

///@function createFactIntent(name, value)
///@description Constructor for FactIntent entity.
///@param {String} name
///@param {Optional<Boolean>} value
///@return {FactIntent} factIntent 
///@throws {Exception}
///@generated {2021-01-04T19:45:18.590Z}
///@override
function createFactIntent(argument0, argument1) {

		var name = argument0;
		var value = argument1;
	
		var factIntent = createEntity(FactIntent);
	
	#region @override
		if (isTJsonBoolean(value)) {
	
			value = convertTJsonBooleanToBoolean(value);
		}
	#endregion

		setFactIntentName(factIntent, assertNoOptional(name));
		setFactIntentValue(factIntent, value);

		return factIntent;
	



}

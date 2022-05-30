///@function createFact(name, value, subscribers)
///@description Constructor for Fact entity.
///@param {String} name
///@param {Boolean} value
///@param {Optional<List<Instance>>} subscribers
///@return {Fact} fact 
///@throws {Exception}
///@generated {2021-01-04T19:45:18.507Z}
///@override
function createFact(argument0, argument1, argument2) {

		var name = argument0;
		var value = argument1;
		var subscribers = argument2;
	
		var fact = createEntity(Fact);
	
	#region @override
		if (isTJsonBoolean(value)) {
	
			value = convertTJsonBooleanToBoolean(value);
		}
	#endregion

		setFactName(fact, assertNoOptional(name));
		setFactValue(fact, assertNoOptional(value));
		setFactSubscribers(fact, subscribers);

		return fact;
	



}

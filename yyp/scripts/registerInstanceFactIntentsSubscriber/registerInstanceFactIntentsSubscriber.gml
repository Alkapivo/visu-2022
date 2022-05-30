///@function registerInstanceFactIntentsSubscriber(context, factIntents)
///@description Add instance to fact intents as fact subscriber.
///@param {Instance} context
///@param {FactIntent[]|any} factIntents
function registerInstanceFactIntentsSubscriber(argument0, argument1) {

		var context = argument0;
		var factIntents = argument1;
	
		if (isArray(factIntents)) {
		
			var factIntentsLength = getArrayLength(factIntents);
			for (var index = 0; index < factIntentsLength; index++) {
				
				var factIntent = factIntents[@ index];
				if (isEntity(factIntent, FactIntent)) {
				
					var factId = getFactIntentName(factIntent);
					addFactSubscriber(factId, context);
				}
			}
		}
	



}

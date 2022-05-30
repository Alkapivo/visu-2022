///@function updateFacts(factIntents)
///@description Setter.
///@param {FactIntent[]} factIntents
function updateFacts(argument0) {

		var factIntents = argument0;
	
		if (isArray(factIntents)) {
		
			var factIntentsLength = getArrayLength(factIntents);
			for (var index = 0; index < factIntentsLength; index++) {
			
				var factIntent = factIntents[@ index];
				if (isEntity(factIntent, FactIntent)) {
				
					var factId = getFactIntentName(factIntent);
					var factValue = getFactIntentValue(factIntent);
					updateFact(factId, factValue);
				} else {
				
					logger("Found invalid factIntent. { \"rawFactIntent\": \"{0}\" }", 
						LogType.ERROR, factIntent);
				}
			}	
		} else {
		
			logger("factIntents is type of FactIntent[]. { \"rawFactIntents\": \"{0}\" }", 
				LogType.ERROR, factIntents);
		}
	



}

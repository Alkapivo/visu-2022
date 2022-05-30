///@function checkFacts(requiredFacts)
///@description Validator.
///@param {FactIntent[]} requiredFacts
function checkFacts(argument0) {

		var requiredFacts = argument0;
	
		if (isArray(requiredFacts)) {
		
			var requiredFactsLength = getArrayLength(requiredFacts);
			for (var index = 0; index < requiredFactsLength; index++) {
			
				var requiredFact = requiredFacts[@ index];
				if (isEntity(requiredFact, FactIntent)) {
				
					var factId = getFactIntentName(requiredFact);
					var factValue = getFactIntentValue(requiredFact);
					if (!checkFact(factId, factValue)) {
					
						return false;
					}
				} else {
				
					logger("requiredFact is type of FactIntent. { \"rawRequiredFact\": \"{0}\" }", 
						LogType.ERROR, requiredFact);
				}
			}
		
			return true;
		} else {
		
			logger("requiredFacts is type of FactIntent[]. { \"rawFactIntents\": \"{0}\" }", 
				LogType.ERROR, requiredFacts);
		}
	
		return false;
	



}

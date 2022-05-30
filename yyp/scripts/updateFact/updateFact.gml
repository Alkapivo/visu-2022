///@function updateFact(factId, factValue);
///@description Setter.
///@param {String} factId
///@param {Boolean} factValue
///@return {Fact} fact
function updateFact(argument0, argument1) {
	
		var factId = argument0;
		var factValue = argument1;
	
		var fact = getFact(factId);
		setFactValue(fact, factValue);
	
		var subscribers = getFactSubscribers(fact);
		if (isDataStructure(subscribers, List)) {
		
			var subscribersSize = getListSize(subscribers);
			var isGCRequired = false;
			for (var index = 0; index < subscribersSize; index++) {
			
				var subscriber = subscribers[| index];
				if (worldInstanceExists(subscriber)) {
				
					notifyFactSubscriber(subscriber);
				} else {
				
					isGCRequired = true;
					subscribers[| index] = createEmptyOptional();
				}
			}
			if (isGCRequired) {
				reduceList(subscribers);
			}
		}

		return fact;
	



}

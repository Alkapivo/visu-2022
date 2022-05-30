///@function addFactSubscriber(factId, subscriber)
///@description Add subscriber to Fact::subscribers in factsRepository.
///@param {String} factId
///@param {T?WorldInstance} subscriber
///@return {Fact} fact
function addFactSubscriber(argument0, argument1) {

		var factId = argument0;
		var subscriber = argument1;
	
		var fact = getFact(factId);	
		var subscribers = getFactSubscribers(fact);
		if (!isDataStructure(subscribers, List)) {
			logger("Create new fact subscriber. { \"factId\": \"{0}\", \"subscriber\": \"{1}\" }",
				LogType.DEBUG, factId, getInstanceClassName(subscriber));
		
			subscribers = createList();
			setFactSubscribers(fact, subscribers);
		}
	
		if (!isOptionalPresent(findValueInList(subscribers, subscriber))) {
		
			addToList(subscribers, subscriber);	
		}
	
		return fact;
	



}

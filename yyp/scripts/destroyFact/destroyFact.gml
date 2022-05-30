///@function destroyFact(fact)
///@description Destroy Fact entity.
///@param {Fact} fact
///@throws {Exception}
///@generated {2021-05-01T23:43:37.608Z}

function destroyFact(fact) {


	
	var name = getFactName(fact);
	var value = getFactValue(fact);
	var subscribers = getFactSubscribers(fact);
	
	if (isOptionalPresent(subscribers)) {
		destroyDataStructure(subscribers, List, "Unable to destroy List subscribers in Fact");
	}
	setFactSubscribers(fact, null);
	

	
}

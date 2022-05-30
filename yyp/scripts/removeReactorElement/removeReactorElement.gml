///@function removeReactorElement(reactor)
///@description Remove current element from reactor by iterator.
///@param {Reactor<T::S>} reactor
function removeReactorElement(argument0) {
	
		var reactor = argument0;
	
		var data = getReactorData(reactor);
		var type = getReactorType(reactor);
	
		switch (type) {
			case ReactorType_LIST:
				var iterator = getReactorIterator(reactor);
				data[| iterator] = null;
				setReactorIsGCRequired(reactor, true);
				break;
			case ReactorType_MAP:
				var iterator = getReactorIterator(reactor);
				data[? iterator] = null;
				setReactorIsGCRequired(reactor, true);
				break;
			default:
				logger("Found unsupported reactor type. Raw: {0}", LogType.ERROR, type);
				break;
		}
	



}

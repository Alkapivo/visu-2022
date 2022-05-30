///@function getReactorFirstElement(reactor)
///@description Return first element of reactor. Method used in reactor for-each.
///@param {Reactor<T::S>} reactor
///@return {Optional<S>} element
function getReactorNextElement(argument0) {

		var reactor = argument0;
	
		var data = getReactorData(reactor);
		var type = getReactorType(reactor);
		var element = createEmptyOptional();
	
		switch (type) {
			case ReactorType_LIST:
				var iterator = getReactorIterator(reactor) + 1;
				var size = getListSize(data);
				if (iterator < size) {
					element = data[| iterator];	
				}
				setReactorIterator(reactor, iterator);
				break;
			case ReactorType_MAP:
				var iterator = getReactorIterator(reactor);
				var key = mapNext(data, iterator);
				element = data[? key];
				if (isUndefined(element)) {
					element = createEmptyOptional();	
				}
				setReactorIterator(reactor, key);
				break;
			default:
				logger("Found unsupported reactor type. Raw: {0}", LogType.ERROR, type);
				break;
		}
	
		return element;
	



}

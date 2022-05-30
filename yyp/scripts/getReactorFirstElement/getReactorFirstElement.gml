///@function getReactorFirstElement(reactor)
///@description Return first element of reactor. Method used in reactor for-each.
///@param {Reactor<T::S>} reactor
///@return {Optional<S>} element
function getReactorFirstElement(argument0) {

		var reactor = argument0;
	
		var data = getReactorData(reactor);
		var type = getReactorType(reactor);
		var element = createEmptyOptional();
	
		switch (type) {
			case ReactorType_LIST:
				var asd = getListSize(data);
				if (getListSize(data) > 0) {
					element = data[| 0];
					setReactorIterator(reactor, 0);
				}
				break;
			case ReactorType_MAP:
				var key = mapFirst(data);
				element = data[? key];
				setReactorIterator(reactor, key);
				break;
			default:
				logger("Found unsupported reactor type. Raw: {0}", LogType.ERROR, type);
				break;
		}
	
		return element;
	



}

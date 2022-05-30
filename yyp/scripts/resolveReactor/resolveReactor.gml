///@function resolveReactor(reactor)
///@description Remove empty elements from reactor.
///@param {Reactor<T::S>} reactor
function resolveReactor(argument0) {

		var reactor = argument0;
	
		var isGCRequired = getReactorIsGCRequired(reactor);
		if (isGCRequired) {
			var type = getReactorType(reactor);	
			var data = getReactorData(reactor);
		
			switch (type) {
				case ReactorType_LIST:
					reduceList(data);
					break;
				case ReactorType_MAP:
					reduceMap(data);
					break;
				default:
					logger("Found unsupported reactor. Raw: {0}", LogType.ERROR, type);
					break;
			}
		}


}

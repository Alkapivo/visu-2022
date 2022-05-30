///@function getReactorSize(reactor)
///@description Return number of elements in reactor.
///@param {Pipeline<T::S>} pipeline
///@return {Integer} size
function getReactorSize(argument0) {

		var reactor = argument0;
	
		var type = getReactorType(reactor);
		var data = getReactorData(reactor);
		var size = 0;
	
		switch (type) {
			case ReactorType_LIST:
				size = getListSize(data);
				break;
			case ReactorType_MAP:
				size = getListSize(data);
				break;
			default:
				logger("Found unsupported ReactorType. Raw: {0}", LogType.ERROR, type);
				break;
		}
	
		return size;
	



}

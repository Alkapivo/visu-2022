///@function clearReactor(reactor)
///@description Remove all elements from reactor.
///@param {Reactor<T>} reactor
///@return {Reactor<T>} reactor - @future, fluent api
function clearReactor(argument0) {

		var reactor = argument0;
	
		for (var element = getReactorFirstElement(reactor);
			 iteratorFinish(element);
			 element = getReactorNextElement(reactor)) {
				
			removeReactorElement(reactor);
		}
	
		return reactor;
	



}

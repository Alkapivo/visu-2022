///@function createReactor(name, data, type, elementType, iterator, isGCRequired)
///@description Constructor for Reactor entity.
///@param {Integer} name
///@param {Object} data
///@param {Integer} type
///@param {Class} elementType
///@param {Optional<Object>} iterator
///@param {Boolean} isGCRequired
///@return {Reactor} reactor 
///@throws {Exception}
///@generated {2020-10-13T17:18:45.132Z}
function createReactor(argument0, argument1, argument2, argument3, argument4, argument5) {

		var name = argument0;
		var data = argument1;
		var type = argument2;
		var elementType = argument3;
		var iterator = argument4;
		var isGCRequired = argument5;
	
		var reactor = createEntity(Reactor);

		setReactorName(reactor, assertNoOptional(name));
		setReactorData(reactor, assertNoOptional(data));
		setReactorType(reactor, assertNoOptional(type));
		setReactorElementType(reactor, assertNoOptional(elementType));
		setReactorIterator(reactor, iterator);
		setReactorIsGCRequired(reactor, assertNoOptional(isGCRequired));

		return reactor;
	



}

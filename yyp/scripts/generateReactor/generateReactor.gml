///@function generateReactor(name, type, elementType)
///@description Constructor for reactor<T::S>.
///@param {String} name
///@param {Class<T?DataStructure>} type
///@param {Class<S>} entityType
///@return {Optional<Reactor<T::S>>} pipeline return optional if type wasn't supported
///@throws {NotImplementedException}
function generateReactor(argument0, argument1, argument2) {

		var name = argument0;
		var type = argument1;
		var elementType = argument2;
	
		var reactor = createEmptyOptional();
		switch (type) {
			case ReactorType_LIST:
				reactor = createReactor(name, createList(), type, elementType, createEmptyOptional(), false);
				break;
			case ReactorType_MAP:
				reactor = createReactor(name, createMap(), type, elementType, createEmptyOptional(), false);
				break;
			default:
				throwException(
					createException(
						NotImplementedException,
						stringParams("Type \"{0}\" is not implemented.", type)
					)
				);
				break;
		}
	
		return reactor;
	



}

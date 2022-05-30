///@function addElementToReactor(reactor, element, key)
///@descripton Add element<S> to reactor<T::S>.
///@param {Reactor<T::S>} reactor
///@param {Entity<S>} element
///@param {String} [key]
///@throws {InvalidClassException}
function addElementToReactor() {

		///checkArgumentCount(2, argument_count, addElementToReactor);

		var reactor = argument[0];
		var element = argument[1];
		var key = argument_count > 2 ? argument[2] : createEmptyOptional();
	
		if (isEntity(reactor, Reactor)) {
			var type = getReactorType(reactor);	
			var elementType = getReactorElementType(reactor);
			var data = getReactorData(reactor);
			if (isEntity(element, elementType)) {
				switch (type) {
					case ReactorType_LIST:
						addToList(data, element);
						break;
					case ReactorType_MAP:
						addToMap(data, key, element);
						break;
					default:
						logger("Found unsupported reactor. Raw: {0}", LogType.ERROR, type);
						break;
				}
			} else {
				throwException(
					createException(
						InvalidClassException,
						stringParams("Trying to add invalid element to reactor of \"{0}\"", 
							getEntityClassName(type)
						)
					)
				);	
			}
		} else {
			throwException(
				createException(
					InvalidClassException,
					"Trying to add element to non-existsing reactor"
				)
			);
		}
	



}

///@function getEntityClass(entity)
///@description Getter.
///@param {?Entity} entity
///@return {Optional<Class<T?Entity>>} entityClass
///@throws {Exception}
function getEntityClass(argument0) {

		var entity = argument0;

		if (isArray(entity)) {
			var pointer = getArrayLength(entity) - 1;	
			if (pointer > 0) {
				return entity[pointer];
			} else {
				throwException(
					createException(
						ClassNotFoundException,
						stringParams("Trying to get Class from not-entity type. Raw: {0}", entity)
					)
				)
				return createEmptyOptional();
			}
		} else {
			throwException(
				createException(
					ClassNotFoundException,
					stringParams("Trying to get Class from not-entity type. Raw: {0}", entity)
				)
			);
			return createEmptyOptional();
		}
	



}

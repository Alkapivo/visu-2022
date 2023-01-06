///@function isEntity(entity, class)
///@description Validator.
///@param {?Entity} entity
///@param {Class<?Entity>} [class]
///@return {Boolean} validationResult
function isEntity(entity) {

	var class = argument_count > 1 ? argument[1] : createEmptyOptional();

	if (class == Struct) {		
		return isStruct(entity);
	}

	// Entity must be an array
	if (!isArray(entity)) {
		return false;	
	}
	
	if (!isOptionalPresent(class)) {
		var entityLength = getArrayLength(entity);
		// Entity length must be at least 2.
		if (entityLength > 1) {
			var entityClass = entity[entityLength - 1];
			// Entity label must be in entityPrototypes
			return isOptionalPresent(global.entityPrototypes[? entityClass]);
		} else {
			return false;
		}
	} else {
		
		// Entity length must be equal to entity prototype length
		if (getEntityPrototype(class) != (getArrayLength(entity) - 1)) {
			return false;	
		}
		
		// Class must be the same
		if (class != getEntityClass(entity)) {
			return false;	
		}
	}

	return true;
}

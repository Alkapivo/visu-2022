///@function createEntity(class)
///@description Construct entity container for specified class.
///@param {Class<?Entity>} class
///@return {?Entity} entity
///@throws {Exception.UndefinedException} 
function createEntity(argument0) {

		var class = argument0;

		var entityPrototype = assertNoOptional(getEntityPrototype(class));
		var entityContainer = createArray(entityPrototype + 1);
		entityContainer[@ entityPrototype] = class;
	
		return entityContainer;
	



}

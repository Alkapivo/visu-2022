///@function createGenericEntity(type, object)
///@description Constructor for GenericEntity entity.
///@param {EntityType} type
///@param {Entity} object
///@return {GenericEntity} genericEntity 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.211Z}
function createGenericEntity(argument0, argument1) {

		var type = argument0;
		var object = argument1;
	
		var genericEntity = createEntity(GenericEntity);

		setGenericEntityType(genericEntity, assertNoOptional(type));
		setGenericEntityObject(genericEntity, assertNoOptional(object));

		return genericEntity;
	



}

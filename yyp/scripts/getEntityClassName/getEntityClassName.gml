///@function getEntityClassName(class)
///@description Return class name of entity.
///@param {Class<?Entity>} class
///@return {Optional<String>} entityClassName
function getEntityClassName(argument0) {

		var class = argument0;

		var entityClassName = global.entityClassNames[? class];
	
		return isString(entityClassName) ? entityClassName : createEmptyOptional();
	



}

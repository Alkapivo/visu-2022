///@function getEntityFields(entityClass)
///@description Return an array of field names in specified entity class
///@param {Class<?Entity>} entityClass
///@return {Map<String::String>} fields - key is name, value is type
///@throws {Exception.UndefinedException}
function getEntityFields(argument0) {

		return assertNoOptional(global.entityFields[? argument0]);
	
	


}

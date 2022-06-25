///@function cloneEntity(entity)
///@description Create new entity by using serialization and deserialization method.
///@param {Entity<T>} entity
///@return {Optional<Entity<T>>} clonedEntity
///@throws {ClassNotFoundException|EntityImplementationNotFoundException|Exception} inherited exception from serialize/deserialize functions.
///@gml {^2.3}
function cloneEntity(entity) {

	clearException();	

	try {
		var serializeHandler = getEntitySerializeHandler(entity);
		var deserializeHandler = getEntityDeserializeHandler(entity);
	
		if (!isException()) {
			var serializedEntity = runScript(serializeHandler, entity);
		
			if (!isException()) {
				var clonedEntity = runScript(deserializeHandler, serializedEntity);		
			
				if (!isException()) {
					return clonedEntity;	
				}
			}
		}
	} catch (exception) {
		
		logger("{0}", LogType.ERROR, exception.message);
		printStackTrace();
		
	}
	
	return createEmptyOptional();
}

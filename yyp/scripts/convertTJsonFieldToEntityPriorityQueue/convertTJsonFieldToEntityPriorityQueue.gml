///@function convertTJsonFiedToEntityPriorityQueue(tjsonField, entityName)
///@description Converter from json to entity priority queue.
///@param {TJsonField} tjsonField
///@param {String} entityName
///@return {Optional<PriorityQueue<?Entity>>} entities
///@throws {Exception.ParseException}
function convertTJsonFieldToEntityPriorityQueue(argument0, argument1) {

		var tjsonField = argument0;
		var entityName = string(argument1);
	
		var scriptName = "deserialize" + string(entityName);
		var deserializeScript = getAssetIndex(scriptName, AssetScript);
		if (!isOptionalPresent(deserializeScript)) {
			throwException(createException(RuntimeException, 
				stringParams("Unable to convert tjsonField to Entity. Cannot find script \"{0}\"", scriptName),
				runtimeExceptionHandler));
		}
	
		if (tj_is_object(tjsonField)) {
			var priorities = tj_keys(tjsonField);
			var prioritiesLength = getArrayLength(priorities);
			var priorityQueue = createPriorityQueue();
			for (var index = 0; index < prioritiesLength; index++) {
				var priority = priorities[index];
				var tjsonObject = tj_get(tjsonField, priority);
				if (tj_is_object(tjsonObject)) {
					var jsonString = tj_encode(tjsonObject);
					var entity = runScript(deserializeScript, jsonString);
				
					if (isNumber(priority)) {
						addToPriorityQueue(priorityQueue, priority, entity);	
					} else {
						throwException(createException(ParseException, 
							stringParams("Unable to convert entity \"{0}\". Found invalid priority value: \"{1}\"", entityName, priority),
							null));
					}
				} else {
					throwException(createException(ParseException, 
						stringParams("Unable to convert entity \"{0}\". Tjson field wasn't recognized at key: {1}", entityName, priority),
						null));	
				}
			}
			return priorityQueue;
		}
	
		return createEmptyOptional();
	



}

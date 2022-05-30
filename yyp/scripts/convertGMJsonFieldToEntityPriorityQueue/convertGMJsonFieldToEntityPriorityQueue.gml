///@function convertGMJsonFiedToEntityMap(gmJsonField, entityName)
///@description Converter from json to entity priority queue.
///@param {GMJsonField} gmJsonField
///@param {String} entityName
///@return {Optional<PriorityQueue<?Entity>>} entities
///@throws {Exception.ParseException}
function convertGMJsonFieldToEntityPriorityQueue(argument0, argument1) {

		var gmJsonField = argument0;
		var entityName = string(argument1);
	
		var scriptName = "deserialize" + string(entityName);
		var deserializeScript = getAssetIndex(scriptName, AssetScript);
		if (!isOptionalPresent(deserializeScript)) {
			throwException(createException(RuntimeException, 
				stringParams("Unable to convert tjsonField to Entity. Cannot find script \"{0}\"", scriptName),
				runtimeExceptionHandler));
		}
	
		if (isDataStructure(gmJsonField, Map)) {
			var priorityQueue = createPriorityQueue();
			for (var priority = mapFirst(gmJsonField); iteratorFinish(priority); priority = mapNext(gmJsonField, priority)) {
				var gmJsonEntity = gmJsonField[? priority];
				if (isDataStructure(gmJsonEntity, Map)) {
					var jsonString = json_encode(gmJsonEntity);
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
						stringParams("Unable to convert entity \"{0}\". GMJson field wasn't recognized at key: {1}", entityName, priority),
						null));
				}
			}
			return priorityQueue;
		} else {
			return createEmptyOptional();
			/*
			throwException(createException(ParseException,
				stringParams("Unable to convert entities priority queue of \"{0}\". GMJson field wasn't recognized", entityName),
				runtimeExceptionHandler));
			*/
		}




}

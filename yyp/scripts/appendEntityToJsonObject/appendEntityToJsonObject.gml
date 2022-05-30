///@function appendEntityDataToJsonObject(jsonObject, key, entityData, entityClass, collectionType)
///@description Builder method for jsonObject
///@param {JsonObject} jsonObject
///@param {String} key
///@param {Entity} entityData
///@param {String} entityClass
///@param {Class<?DataStructure>} [collectionType]
///@return {JsonObject} jsonObject - @future, fluent api
///@throws {Exception}
function appendEntityToJsonObject() {

		///checkArgumentCount(3, argument_count, appendFieldToJsonObject);
	
		var jsonObject = argument[0];
		var key = argument[1];
		var entityData = argument[2];
		var entityClass = argument[3];
		var type = argument_count > 4 ? argument[4] : null;
	
		var decoder = getJsonObjectDecoder(jsonObject);
		var data = getJsonObjectData(jsonObject);
	
		switch (decoder) {
			case JsonDecoderType.GMJSON:
				var scriptName = "serialize" + capitalToUpperCase(entityClass);
				var serializeScript = getAssetIndex(scriptName, AssetScript);
				if (!isOptionalPresent(serializeScript)) {
					throwException(createException(RuntimeException, 
						stringParams("Unable to append entity to JsonObject. Cannot find script \"{0}\"", scriptName),
						runtimeExceptionHandler));
				}
				if (isOptionalPresent(type)) {
					switch (type) {
						case Array:
							var entityArray = entityData;
							var list = createList();
							var entityArrayLength = getArrayLength(entityArray);
							for (var index = 0; index < entityArrayLength; index++) {
								var entity = entityArray[@ index];
								var serializedEntity = runScript(serializeScript, entity);
								var deserializedEntity = json_decode(serializedEntity);
								addToList(list, deserializedEntity);
								ds_list_mark_as_map(list, index);
							}
							ds_map_add_list(data, key, list);
							break;
						case Map:
							var map = createMap();
							var entityMap = entityData
							for (var entityMapKey = mapFirst(entityMap); iteratorFinish(entityMapKey); entityMapKey = mapNext(entityMap, entityMapKey)) {
								var serializedEntity = runScript(serializeScript, entityMap[? entityMapKey]);
								var deserializedEntity = json_decode(serializedEntity);
								ds_map_add_map(map, entityMapKey, deserializedEntity);
							}
							ds_map_add_map(data, key, map);
							break;
						case List:
							var list = createList();
							var entityList = entityData;
							var entityListSize = getListSize(entityList);
							for (var index = 0; index < entityListSize; index++) {
								var serializedEntity = runScript(serializeScript, entityList[| index]);
								var deserializedEntity = json_decode(serializedEntity);
								addToList(list, deserializedEntity);
								ds_list_mark_as_map(list, index);
							}
							ds_map_add_list(data, key, list);
							break;
						case Stack:
							var list = createList();
							var entityStack = entityData;
							var tempStack = createStack();
							var entityStackSize = getStackSize(entityStack);
							for (var index = 0; index < entityStackSize; index++) {
								pushStack(tempStack, popStack(entityStack));
								var serializedEntity = runScript(serializeScript, getTopOfStack(tempStack));
								var deserializedEntity = json_decode(serializedEntity);
								addToList(list, deserializedEntity);
								ds_list_mark_as_map(list, index);
							}
							for (var index = 0; index < entityStackSize; index++) {
								pushStack(entityStack, popStack(tempStack));	
							}
							destroyStack(tempStack);
							ds_map_add_list(data, key, list);
							break;
						case Grid:
							var list = createList();
							var entityGrid = entityData;
							var gridWidth = getGridWidth(entityGrid);
							var gridHeight = getGridHeight(entityGrid);
						
							for (var yIndex = 0; yIndex < gridHeight; yIndex++) {
								var row = createList();
								for (var xIndex = 0; xIndex < gridWidth; xIndex++) {
									var serializedEntity = runScript(serializeScript, entityGrid[# xIndex, yIndex]);
									var deserializedEntity = json_decode(serializedEntity);
									addToList(row, deserializedEntity);
									ds_list_mark_as_map(row, xIndex);
								}
								addToList(list, row);
								ds_list_mark_as_list(list, yIndex);
							}
							ds_map_add_list(data, key, list);
							break;
						case Queue:
							var list = createList();
							var entityQueue = entityData;
							var tempQueue = createQueue();
							var entityQueueSize = getQueueSize(entityQueue);
							for (var index = 0; index < entityQueueSize; index++) {
								pushQueue(tempQueue, popQueue(entityQueue));
								var serializedEntity = runScript(serializeScript, getHeadOfQueue(tempQueue));
								var deserializedEntity = json_decode(serializedEntity);
								addToList(list, deserializedEntity);
								ds_list_mark_as_map(list, index);
							}
							for (var index = 0; index < entityQueueSize; index++) {
								pushQueue(entityStack, popQueue(tempQueue));	
							}
							destroyQueue(tempQueue);
							ds_map_add_list(data, key, list);
							break;
						case PriorityQueue:
							var map = createMap();
							var entityPriorityQueue = entityData;
							var tempStack = createStack();
							var entityPriorityQueueSize = getPriorityQueueSize(entityPriorityQueue);
							for (var index = 0; index < entityPriorityQueueSize; index++) {
								var entityPriorityQueueValue = findMaxInPriorityQueue(entityPriorityQueue);
								var priority = findPriorityByValueInPriorityQueue(entityPriorityQueue, entityPriorityQueueValue);
								popMaxPriorityQueue(entityPriorityQueue);
								pushStack(tempStack, [ priority, entityPriorityQueueValue ]);
								var serializedEntity = runScript(serializeScript, entityPriorityQueueValue);
								var deserializedEntity = json_decode(serializedEntity);
								ds_map_add_map(map, priority, entityPriorityQueueValue);
							}
							for (var index = 0; index < entityPriorityQueueSize; index++) {
								var entityPriorityQueueEntry = popStack(tempStack);
								addToPriorityQueue(entityPriorityQueue, entityPriorityQueueEntry[0], entityPriorityQueueEntry[1]);
							}
							destroyStack(tempStack);
							ds_map_add_map(data, key, map);
							break;
						default:
							logger("Found unsupported type. Raw: { \"type\": \"{0}\", \"key\": \"{1}\", \"entity\": \"{2}\" }", LogType.ERROR, type, key, entityData);
							data[? key] = entityData;;
							break;
					}
				} else {
					var serializedEntity = runScript(serializeScript, entityData);
					var deserializedEntity = json_decode(serializedEntity);
					ds_map_add_map(data, key, deserializedEntity);
				}
				break;
			case JsonDecoderType.TJSON:
				var scriptName = "serialize" + capitalToUpperCase(entityClass);
				var serializeScript = getAssetIndex(scriptName, AssetScript);
				if (isOptionalPresent(type)) {
					switch (type) {
						case Array:
							var entityArray = entityData;
							var entityArrayLength = getArrayLength(entityArray);
							var tjsonArray = createArray(entityArrayLength);
							for (var index = 0; index < entityArrayLength; index++) {
								var entity = entityArray[@ index];
								var serializedEntity = runScript(serializeScript, entity);
								var deserializedEntity = tj_decode(serializedEntity);
								tjsonArray[index] = deserializedEntity;
							}
							tj_set(data, key, tjsonArray);
							break;
						case Map:
							var entityMap = entityData;
							var tjsonObject = tj_object();
							for (var entityMapKey = mapFirst(entityMap); iteratorFinish(entityMapKey); entityMapKey = mapNext(entityMap, entityMapKey)) {
								var serializedEntity = runScript(serializeScript, entityMap[? entityMapKey]);
								var deserializedEntity = tj_decode(serializedEntity);
								tj_set(tjsonObject, entityMapKey, deserializedEntity);
							}
							tj_set(data, key, tjsonObject);
							break;
						case List:
							var entityList = entityData;
							var entityListSize = getListSize(entityList);
							var tjsonArray = createArray(entityListSize);
							for (var index = 0; index < entityListSize; index++) {
								var serializedEntity = runScript(serializeScript, entityList[| index]);
								var deserializedEntity = tj_decode(serializedEntity);
								tjsonArray[index] = deserializedEntity;
							}
							tj_set(data, key, tjsonArray);
							break;
						case Stack:
							var entityStack = entityData;
							var tempStack = createStack();
							var entityStackSize = getStackSize(entityStack);
							var tjsonArray = createArray(entityStackSize);
							for (var index = 0; index < entityStackSize; index++) {
								pushStack(tempStack, popStack(entityStack));
								var serializedEntity = runScript(serializeScript, getTopOfStack(tempStack));
								var deserializedEntity = tj_decode(serializedEntity);
								tjsonArray[index] = deserializedEntity;
							}
							for (var index = 0; index < entityStackSize; index++) {
								pushStack(entityStack, popStack(tempStack));	
							}
							destroyStack(tempStack);
							tj_set(data, key, tjsonArray);
							break;
						case Grid:
							var list = createList();
							var entityGrid = entityData;
							var gridWidth = getGridWidth(entityGrid);
							var gridHeight = getGridHeight(entityGrid);
							var tjsonArray = createArray(gridHeight);
							for (var yIndex = 0; yIndex < gridHeight; yIndex++) {
								var row = createArray(gridWidth);
								for (var xIndex = 0; xIndex < gridWidth; xIndex++) {
									var serializedEntity = runScript(serializeScript, entityGrid[# xIndex, yIndex]);
									var deserializedEntity = tj_decode(serializedEntity);
									row[xIndex] = deserializedEntity
								}
								tjsonArray[yIndex] = row;
							}
							tj_set(data, key, tjsonArray);
							break;
						case Queue:
							var entityQueue = entityData;
							var tempQueue = createQueue();
							var entityQueueSize = getQueueSize(entityQueue);
							var tjsonArray = createArray(entityQueueSize);
							for (var index = 0; index < entityQueueSize; index++) {
								pushQueue(tempQueue, popQueue(entityQueue));
								var serializedEntity = runScript(serializeScript, getHeadOfQueue(tempQueue));
								var deserializedEntity = tj_decode(serializedEntity);
								tjsonArray[index] = deserializedEntity;
							}
							for (var index = 0; index < entityQueueSize; index++) {
								pushQueue(entityStack, popQueue(tempQueue));	
							}
							destroyQueue(tempQueue);
							tj_set(data, key, tjsonArray);
							break;
						case PriorityQueue:
							var entityPriorityQueue = entityData;
							var tempStack = createStack();
							var entityPriorityQueueSize = getPriorityQueueSize(entityPriorityQueue);
							var tjsonObject = tj_object();
							for (var index = 0; index < entityPriorityQueueSize; index++) {
								var entityPriorityQueueValue = findMaxInPriorityQueue(entityPriorityQueue);
								var priority = findPriorityByValueInPriorityQueue(entityPriorityQueue, entityPriorityQueueValue);
								popMaxPriorityQueue(entityPriorityQueue);
								pushStack(tempStack, [ priority, entityPriorityQueueValue ]);
								var serializedEntity = runScript(serializeScript, entityPriorityQueueValue);
								var deserializedEntity = tj_decode(serializedEntity);
								tj_set(tjsonObject, priority, deserializedEntity);
							}
							for (var index = 0; index < entityPriorityQueueSize; index++) {
								var entityPriorityQueueEntry = popStack(tempStack);
								addToPriorityQueue(entityPriorityQueue, entityPriorityQueueEntry[0], entityPriorityQueueEntry[1]);
							}
							destroyStack(tempStack);
							tj_set(data, key, tjsonObject);
							break;
						default:
							logger("Found unsupported type. Raw: { \"type\": \"{0}\", \"key\": \"{1}\", \"entity\": \"{2}\" }", LogType.ERROR, type, key, entityData);
							tj_set(data, key, entityData);
							break;
					}
				} else {
					var serializedEntity = runScript(serializeScript, entityData);
					var deserializedEntity = tj_decode(serializedEntity);
					tj_set(data, key, deserializedEntity);
				}
				break;
		}
	
		return jsonObject;
	



}

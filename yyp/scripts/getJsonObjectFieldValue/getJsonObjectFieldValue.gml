///@function getJsonObjectFieldValue(jsonObject, key, type, entityName)
///@description Getter. 
///@param {JsonObject} jsonObject
///@param {String} key
///@param {?Class} [type]
///@param {String} [entityName]
///@return {Optional<Object>} fieldValue - return null if field wasn't found. If field is nested json structure then it will return new JsonObject|JsonArray. If type was passed then it will return that type (or empty collection if error occur).
function getJsonObjectFieldValue() {

		///checkArgumentCount(2, argument_count, getJsonObjectFieldValue);

		var jsonObject = argument[0];
		var key = argument[1];
		var type = argument_count > 2 ? argument[2] : null;
		var entityName = argument_count > 3 ? argument[3] : null;
	
		var decoder = getJsonObjectDecoder(jsonObject);
		var data = getJsonObjectData(jsonObject);
	
		switch (decoder) {
			case JsonDecoderType.GMJSON:
				var value = data[? key];
				if (isOptionalPresent(type)) {
					if (isOptionalPresent(entityName)) {
						switch (type) {
							case Entity:
								return convertGMJsonFieldToEntity(value, entityName);
								break;
							case Array:
								return convertGMJsonFieldToEntityArray(value, entityName);
								break;
							case List:
								return convertGMJsonFieldToEntityList(value, entityName);
								break;
							case Map:
								return convertGMJsonFieldToEntityMap(value, entityName);
								break;
							case Stack:
								return convertGMJsonFieldToEntityStack(value, entityName);
								break;
							case Grid:
								return convertGMJsonFieldToEntityGrid(value, entityName);
								break;
							case Queue:
								return convertGMJsonFieldToEntityQueue(value, entityName);
								break;
							case PriorityQueue:
								return convertGMJsonFieldToEntityPriorityQueue(value, entityName);
								break;
						}
					} else {
						switch (type) {
							case Array:
								return convertGMJsonFieldToArray(value);
								break;
							case List:
								return convertGMJsonFieldToList(value);
								break;
							case Map:
								return convertGMJsonFieldToMap(value);
								break;
							case Stack:
								return convertGMJsonFieldToStack(value);
								break;
							case Grid:
								return convertGMJsonFieldToGrid(value);
								break;
							case Queue:
								return convertGMJsonFieldToQueue(value);
								break;
							case PriorityQueue:
								return convertGMJsonFieldToPriorityQueue(value);
								break;
						}
					}
				}
			
				return value;
				break;
			case JsonDecoderType.TJSON:
				var value = tj_get(data, key);
				if (isOptionalPresent(type)) {
					if (isOptionalPresent(entityName)) {
						switch (type) {
							case Entity:
								return convertTJsonFieldToEntity(value, entityName);
								break;
							case Array:
								return convertTJsonFieldToEntityArray(value, entityName);
								break;
							case List:
								return convertTJsonFieldToEntityList(value, entityName);
								break;
							case Map:
								return convertTJsonFieldToEntityMap(value, entityName);
								break;
							case Stack:
								return convertTJsonFieldToEntityStack(value, entityName);
								break;
							case Grid:
								return convertTJsonFieldToEntityGrid(value, entityName);
								break;
							case Queue:
								return convertTJsonFieldToEntityQueue(value, entityName);
								break;
							case PriorityQueue:
								return convertTJsonFieldToEntityPriorityQueue(value, entityName);
								break;
						}
					} else {
						switch (type) {
							case Array:
								return convertTJsonFieldToArray(value);
								break;
							case List:
								return convertTJsonFieldToList(value);
								break;
							case Map:
								return convertTJsonFieldToMap(value);
								break;
							case Stack:
								return convertTJsonFieldToStack(value);
								break;
							case Grid:
								return convertTJsonFieldToGrid(value);
								break;
							case Queue:
								return convertTJsonFieldToQueue(value);
								break;
							case PriorityQueue:
								return convertTJsonFieldToPriorityQueue(value);
								break;
						}
					}
				}
			
				return value;
				break;
			default:
				logger("Found unrecognized JsonDecoderType. Memory leak possible! Raw data: {0}", LogType.ERROR, decoder);
				return createEmptyOptional();
				break;
		}
	



}

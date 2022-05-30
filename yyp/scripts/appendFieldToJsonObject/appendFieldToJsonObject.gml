///@function appendFieldToJsonObject(jsonObject, key, value, type)
///@description Builder method for jsonObject
///@param {JsonObject} jsonObject
///@param {String} key
///@param {Object} value
///@param {?Class} [type]
///@return {JsonObject} jsonObject - @future, fluent api
function appendFieldToJsonObject() {

		///checkArgumentCount(3, argument_count, appendFieldToJsonObject);
	
		var jsonObject = argument[0];
		var key = argument[1];
		var value = argument[2];
		var type = argument_count > 3 ? argument[3] : null;
	
		var decoder = getJsonObjectDecoder(jsonObject);
		var data = getJsonObjectData(jsonObject);
	
		switch (decoder) {
			case JsonDecoderType.GMJSON:
				if (isOptionalPresent(type)) {
					switch (type) {
						case Array:
							data[? key] = value;
							break;
						case Map:
							ds_map_add_map(data, key, cloneMap(value));
							break;
						case List:
							ds_map_add_list(data, key, cloneList(value));
							break;
						case Stack:
							var stack = convertStackToArray(value);
							data[? key] = stack;
							break;
						case Grid:
							var grid = convertGridToArray(value);
							data[? key] = grid;
							break;
						case Queue:
							var queue = convertQueueToArray(value);
							data[? key] = queue;
							break;
						case PriorityQueue:
							var priorityQueue = convertPriorityQueueToMap(value);
							ds_map_add_map(data, key, priorityQueue);
							break;
						default:
							logger("Found unsupported type. Raw: {0}", LogType.ERROR, type);
							data[? key] = value;
							break;
					}
				} else {
					data[? key] = value;
				}
				break;
			case JsonDecoderType.TJSON:
				if (isOptionalPresent(type)) {
					switch (type) {
						case Array:
							tj_set(data, key, value);
							break;
						case Map:
							var map = convertMapToTJsonObject(value);
							tj_set(data, key, map);
							break;
						case List:
							var list = convertListToArray(value);
							tj_set(data, key, list);
							break;
						case Stack:
							var stack = convertStackToArray(value);
							tj_set(data, key, stack);
							break;
						case Grid:
							var grid = convertGridToArray(value);
							tj_set(data, key, grid);
							break;
						case Queue:
							var queue = convertQueueToArray(value);
							tj_set(data, key, queue);
							break;
						case PriorityQueue:
							var priorityQueueMap = convertPriorityQueueToMap(value);
							var priorityQueue = convertMapToTJsonObject(priorityQueueMap);
							destroyMap(priorityQueueMap);
							tj_set(data, key, priorityQueue);
							break;
						default:
							var exceptionMessage = stringParams("Found unsupported type. Raw: { \"type\": \"{0}\", \"key\": \"{1}\", \"value\": \"{2}\" }", type, key, value);
							tj_set(data, key, value);
							throwException(createException(RuntimeException, exceptionMessage, null));
							break;
					}
				} else {
					tj_set(data, key, value);
				}
				break;
		}
	
		return jsonObject;
	



}

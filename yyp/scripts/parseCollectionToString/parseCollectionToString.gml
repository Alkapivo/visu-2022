///@function parseCollectionToString(collection, type)
///@description Covnert collection to debug output (not console, loggerWritter). Use for debugging.
///@param {?Collection} collection
///@param {?Type} type
///@return {String} parsedCollection
function parseCollectionToString(argument0, argument1) {

		var collection = argument0;
		var type = argument1;
		var result = "";
	
		switch (type) {
			case Array:
				if (isArray(collection)) {
					for (var index = 0; index < getArrayLength(collection); index++) {
						result += "[" + string(index) + "] " + string(collection[index]) + "\n";
					}
				} else {
					result = "Collection isn't an array";
				}
				break;
			case Grid:
				if (isDataStructure(collection, Grid)) {
				
				} else {
					result = "Collection isn't a grid";
				}
				break;
			case List:
				if (isDataStructure(collection, List)) {
					for (var index = 0; index < getListSize(collection); index++) {
						result += "[| " + string(index) + "] " + string(collection[|index]);
					}
				} else {
					result = "Collection isn't a list";
				}
				break;
			case Map:
				if (isDataStructure(collection, Map)) {
					for (var key = mapFirst(collection); iteratorFinish(key); key = mapNext(collection, key)) {
						result += "[? " + string(key) + "] " + string(collection[? key]);
					}
				} else {
					result = "Collection isn't a map";
				}
				break;
			case PriorityQueue:
				break;
			case Queue:
				break;
			case Stack:
				break;
		}

		return result;


}

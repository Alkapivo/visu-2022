///@function convertMapToTJsonObject(map)
///@description Convert Map to TJsonObject.
///@param {Map<String::?Primitive>} map
///@return {TJsonObject} tjsonObject
function convertMapToTJsonObject(argument0) {

		var map = argument0;
		var tjsonObject = tj_object();
	
		if (isDataStructure(map, Map)) {
			for (var key = mapFirst(map); iteratorFinish(key); key = mapNext(map, key)) {
				var value = map[? key];
				tj_set(tjsonObject, string(key), value);
			}
		} else {
			var exceptionMessage = "Unable to convert map to TJsonObject. Parameter wasn't recognized as map";
			throwException(createException(RuntimeException, exceptionMessage, null));
		}
	
		return tjsonObject;	


}

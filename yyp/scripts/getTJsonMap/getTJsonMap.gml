///@function getTJsonMap(tjsonObject, propertyName)
///@description Get DS Map from tjsonObject if present, otherwise return null
///@param {TJsonObject} tjsonObject
///@param {String} propertyName
///@return {Map<String::Object} map if present, otherwise return null
function getTJsonMap(argument0, argument1) {

		var tjsonObject = argument0;
		var mapKey = argument1;
	
		var tjsonMap = tj_get(tjsonObject, mapKey);
		if (isOptionalPresent(tjsonMap) && tj_is_object(tjsonMap)) {
		
			var map = createMap();
			var keys = tj_keys(tjsonMap);
			for (var index = 0; index < getArrayLength(keys); index++) {
				var key = keys[index];
				var value = tj_get(tjsonMap, key);
				value = isHtml5() ? value : (tj_is_bool(value) ? value == tj_true : value);	
				addToMap(map, key, value);
			}
			return map;
		} else {
			return null;
		}
	



}

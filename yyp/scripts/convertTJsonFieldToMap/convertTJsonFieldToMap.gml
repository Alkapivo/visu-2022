///@function convertTJsonFieldToMap(tjsonField)
///@description Converter. Extracted map is flat (not recursive)
///@param {TJsonField} tjsonField
///@return {Optional<Map<Primitive::Object>>} map
function convertTJsonFieldToMap(argument0) {

		var tjsonField = argument0;

		if (tj_is_object(tjsonField)) {
			var keys = tj_keys(tjsonField);
			var keysLength = getArrayLength(keys);
			var map = createMap();
			for (var index = 0; index < keysLength; index++) {
				var key = keys[index];
				var item = tj_get(tjsonField, key);
				map[? key] = item;
			}
			return map;
		}
	
		return createEmptyOptional();
	



}

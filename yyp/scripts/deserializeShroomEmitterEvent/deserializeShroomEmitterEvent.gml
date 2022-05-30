///@function deserializeShroomEmitterEvent(jsonString)
///@description Deserialize ShroomEmitterEvent from JSON String to ShroomEmitterEvent entity.
///@param {String} jsonString
///@return {ShroomEmitterEvent} shroomEmitterEvent 
///@throws {Exception}
///@generated {2021-01-17T08:40:16.876Z}
///@override
function deserializeShroomEmitterEvent(argument0) {

		var jsonString = argument0;

		var tjsonObject = tj_decode(jsonString);

		var duration = getTJsonValue(tjsonObject, "duration");
		var amount = getTJsonValue(tjsonObject, "amount");
		var interval = getTJsonValue(tjsonObject, "interval");
	#region override Map<String::Object>[]
		var tjsonArray = getTJsonValue(tjsonObject, "templates");
		var templates = [];
		var dd = getArrayLength(tjsonArray);
		for (var index = 0; index < getArrayLength(tjsonArray); index++) {
			var tjsonMap = tjsonArray[index];
			var map = createMap();
			var keys = tj_keys(tjsonMap);
			for (var keyIndex = 0; keyIndex < getArrayLength(keys); keyIndex++) {
				var key = keys[keyIndex];
				var value = tj_get(tjsonMap, key);
				addToMap(map, key, value);
			}
			pushArray(templates, map);
		}
	#endregion

		return createShroomEmitterEvent(duration, amount, interval, templates);


}

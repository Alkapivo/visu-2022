///@function removeEntitiesFromMap(map, keys, destroyScript)
///@description Remove items from map.
///@param {Map<Object<T>::Object<S>>} map
///@param {T[]} keys
///@param {AssetScript} [destroyScript] Entity destroy script
function removeEntitiesFromMap() {

		///checkArgumentCount(2, argument_count, removeEntitiesFromMap);
	
		var map = argument[0];
		var keys = argument[1];
		var keysSize = getArrayLength(keys);
		var destroyScript = argument_count > 2 ? argument[2] : createEmptyOptional();
		for (var index = 0; index < keysSize; index++) {
			var key = keys[@ index];
			var item = map[? key];
			if (isOptionalPresent(destroyScript)) {
				runScript(destroyScript, item);
			}
			removeFromMap(map, key);
		}
	



}

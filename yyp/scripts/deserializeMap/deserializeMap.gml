///@function deserializeMap(serializedMap)
///@description Return deserializedMap from string created by serializeMap.
///@param {String} serializedMap
///@return {Map<Object::Object>} deserializedMap
function deserializeMap(argument0) {

		var deserializedMap = createMap();
		ds_map_read(deserializedMap, argument0);
	
		return deserializedMap;
	



}

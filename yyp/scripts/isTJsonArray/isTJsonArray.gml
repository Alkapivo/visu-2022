///@function isTJsonArray(object)
///@description Validate if object is TJsonArray. Wrapper for tj_isArray
///@param {Object} object
///@return {Boolean} isTJsonArray
function isTJsonArray(argument0) {

		var tjIsArray = tj_is_array(argument0);
		if (!tjIsArray) {
			logger("Object \"{0}\" is not a JSONArray", LogType.ERROR, argument0);
		}
		return tjIsArray;


}

///@function isTJsonObject(object)
///@description Validate if object is TJsonObject. Wrapper for tj_is_object
///@param {Object} object
///@return {Boolean} isTJsonArray
function isTJsonObject(argument0) {

		var tjIsObject = tj_is_object(argument0);
		if (!tjIsObject) {
			logger("Object \"{0}\" is not a JSONObject", LogType.ERROR, argument0);
		}
		return tjIsObject;


}

///@function arrayMapContains(arrayMap, key)
///@description Check if any of ArrayMapItem contains passed value.
///@param {ArrayMap<Object<T>::<Object<S>>} arrayMap
///@param {T} key
///@return {Boolean} contains
function arrayMapContains(argument0, argument1) {

		var arrayMap = argument0;
		var key = argument1;

		return isOptionalPresent(getKeyIndexFromArrayMapByKey(arrayMap, key));
	



}

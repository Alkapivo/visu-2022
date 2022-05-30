///@function destroyWindowGridValue(windowGridValue)
///@description Destroy WindowGridValue entity.
///@param {WindowGridValue} windowGridValue
///@throws {Exception}
///@generated {2020-09-28T21:12:27.906Z}
function destroyWindowGridValue(argument0) {

		var windowGridValue = argument0;
	
		var data = getWindowGridValueData(windowGridValue);
		var type = getWindowGridValueType(windowGridValue);
		var color = getWindowGridValueColor(windowGridValue);
	
		destroyColor(color);
		setWindowGridValueColor(windowGridValue, null);
	

	



}

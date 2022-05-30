///@function createWindowGridValue(data, type, color)
///@description Constructor for WindowGridValue entity.
///@param {String} data
///@param {WindowGridValueType} type
///@param {Color} color
///@return {WindowGridValue} windowGridValue 
///@throws {Exception}
///@generated {2020-09-28T21:11:55.546Z}
function createWindowGridValue(argument0, argument1, argument2) {

		var data = argument0;
		var type = argument1;
		var color = argument2;
	
		var windowGridValue = createEntity(WindowGridValue);

		setWindowGridValueData(windowGridValue, assertNoOptional(data));
		setWindowGridValueType(windowGridValue, assertNoOptional(type));
		setWindowGridValueColor(windowGridValue, assertNoOptional(color));

		return windowGridValue;
	



}

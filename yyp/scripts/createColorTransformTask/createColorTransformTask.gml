///@function createColorTransformTask(fieldName, targetColor, changeFactor)
///@description Constructor for ColorTransformTask entity.
///@param {String} fieldName
///@param {Color} targetColor
///@param {Number} changeFactor
///@return {ColorTransformTask} colorTransformTask 
///@throws {Exception}
///@generated {2020-09-28T21:26:20.192Z}
function createColorTransformTask(argument0, argument1, argument2) {

		var fieldName = argument0;
		var targetColor = argument1;
		var changeFactor = argument2;
	
		var colorTransformTask = createEntity(ColorTransformTask);

		setColorTransformTaskFieldName(colorTransformTask, assertNoOptional(fieldName));
		setColorTransformTaskTargetColor(colorTransformTask, assertNoOptional(targetColor));
		setColorTransformTaskChangeFactor(colorTransformTask, assertNoOptional(changeFactor));

		return colorTransformTask;
	



}

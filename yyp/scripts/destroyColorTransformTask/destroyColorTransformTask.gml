///@function destroyColorTransformTask(colorTransformTask)
///@description Destroy ColorTransformTask entity.
///@param {ColorTransformTask} colorTransformTask
///@throws {Exception}
///@generated {2020-10-11T13:38:08.747Z}
function destroyColorTransformTask(argument0) {

		var colorTransformTask = argument0;
	
		var fieldName = getColorTransformTaskFieldName(colorTransformTask);
		var targetColor = getColorTransformTaskTargetColor(colorTransformTask);
		var changeFactor = getColorTransformTaskChangeFactor(colorTransformTask);
	
		destroyColor(targetColor);
		setColorTransformTaskTargetColor(colorTransformTask, null);
	

	



}

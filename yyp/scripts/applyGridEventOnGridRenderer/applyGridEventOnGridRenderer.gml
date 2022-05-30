///@function applyGridEventOnGridRenderer(gridEvent)
///@description Apply GridEvent on GridRenderer.
///@param {GridEvent} gridEvent
function applyGridEventOnGridRenderer(argument0) {

		var gridEvent = argument0;
	
		var fields = getGridEventFields(gridEvent);
		for (var field = mapFirst(fields); iteratorFinish(field); field = mapNext(fields, field)) {
		
			var value = fields[? field];
			if (isTJsonBoolean(value)) {
			
				value = convertTJsonBooleanToBoolean(value);	
			}
		
			if ((isArray(value)) && 
				(getArrayLength(value) == 0)) {
			
				logger("[GridEvent] Found invalid value for field {0}", LogType.WARNING, field);
				return;	
			}
		
			var changeFactor = getValueFromArray(value, 1, 1.0);
		
			if (stringContains(field, "color")) {
			
				var color = colorHashToColor(getValueFromArray(value, 0, "#FFFFFF"));
				var colorTransformTask = createColorTransformTask(field, color, changeFactor);
				sendGridRendererColorTransformTask(colorTransformTask);
			} else {
			
				if (isArray(value)) {
				
					var fieldValue = getValueFromArray(value, 0, 0.0);
					var fieldModifierTask = createFieldModifierTask(getGridRenderer(), field, fieldValue, changeFactor, 1, 0);
					sendFieldModifierTask(fieldModifierTask);
				} else {
			
					setInstanceVariable(getGridRenderer(), field, value);
				}
			}
		}
	



}

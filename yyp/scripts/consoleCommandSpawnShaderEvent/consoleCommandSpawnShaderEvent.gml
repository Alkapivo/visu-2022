///@function consoleCommandSpawnShaderEvent(parameters)
///@description Create ShaderEvent and then spawn ShaderTask.
///@param {String[]} parameters
function consoleCommandSpawnShaderEvent(argument0) {
	
		///@required
		var parameters = argument0;
		var parametersLength = parameters != null ? getArrayLength(parameters) : 0;
	
		if (parametersLength > 0) {
			var name = parameters[0];
			var duration = parametersLength > 1 ? parameters[1] : 1.0;
			var data = createMap();
		
			var stringBuffer = "";
			for (var index = 2; index < parametersLength; index++) {
				stringBuffer = stringBuffer + parameters[@ index];	
			}
		
			var fields = splitStringToArray(stringBuffer, ";");
			var fieldsLength = getArrayLength(fields);
		
			for (var index = 0; index < fieldsLength; index++) {
				var field = fields[@ index];
				if(field == ""){ continue;}
				var fieldModifier = splitStringToArray(field, "[");
				var fieldName = string_replace_all(fieldModifier[0], " ", "");
				var fieldValue = tj_decode("[" + fieldModifier[1]);
				data[? fieldName] = fieldValue;
			}
				
			var shaderEvent = createShaderEvent(name, duration, data);	
		
		#region Dispatch ShaderEvent (copied from TimelineManager :( )
			var shaderName = "shader" + getShaderEventName(shaderEvent);
			var shaderAsset = getAssetIndex(shaderName, AssetShader);
			if ((shaderAsset != null) && shader_is_compiled(shaderAsset)){
				var duration = getShaderEventDuration(shaderEvent);
				var state = getShaderEventData(shaderEvent) != null ? cloneMap(getShaderEventData(shaderEvent)) : createMap();
				var shaderTask = createShaderTask(shaderAsset, duration, state, 0.0, 0.7);
				var pipeline = isDataStructure(state, Map) ? getValueFromMap(state, "pipeline", "main") : "main";
				sendShaderTaskToShaderPipeline(shaderTask, pipeline);
			} else {
				logger("Cannot dispatch ShaderEvent: shader \"{0}\" wasn't {1}", LogType.WARNING,
					shaderName, shaderAsset == null ? "found" : "compiled");
			}
			destroyShaderEvent(shaderEvent);
		#endregion
		
		} else {
			logger(
				"usage:\n{0}\n{1}\n\n{2}", 
				LogType.DEBUG,
				"<shader_name> <duration> <shader_uniforms>",
				"<shader_uniform> -> <uniform_name>[<values>] - uniforms must be splitted by ;",
				"example: spawn_shader LED 10 brightness[1.0]; ledSize[10, 512, 0.6]"
			);
		}
	

		//spawn_shader LED 10 brightness[0,0,1,2] 


}

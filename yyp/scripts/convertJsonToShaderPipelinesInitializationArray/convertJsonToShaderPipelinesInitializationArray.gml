///@function convertJsonToShaderPipelinesInitializationArray(jsonString)
///@description Convert valid json to Array of Tuples, where key is shaderPipelineName and value is shaderPipelineLimit.
///@param {String} jsonString
///@return {Tuple<String::Integer>[]} initializationArray
function convertJsonToShaderPipelinesInitializationArray(argument0) {

		var jsonString = argument0;
		var tjsonArray = tj_decode(jsonString);
	
		// TODO capture tjson_error
		// TODO add try catch after GML update
		if (isTJsonArray(tjsonArray)) {
		
			var tjsonArrayLength = getArrayLength(tjsonArray);
			var initializationArray = createArray(tjsonArrayLength);
			for (var index = 0; index < tjsonArrayLength; index++) {
				var tjsonObject = tjsonArray[index];

				var name = getTJsonValue(tjsonObject, "name", null);
				var limit = getTJsonValue(tjsonObject, "limit", null);
			
				if ((name == null) || (limit == null)) {
					throwException(createException(ParseException, 
						stringParams("Cannot parse to shader pipelines initialization array at index {0}", index),
						runtimeExceptionHandler));
				}
			
				var tuple = createTuple(name, limit);
				initializationArray[index] = tuple;
			}
		
			return initializationArray;
		}
	
		throwException(createException(ParseException, 
			"Cannot parse to shader pipelines initialization array",
			runtimeExceptionHandler));
	



}

///@function runMethodIntents(methodIntents)
///@description Run collection of MethodIntent.
///@param {MethodIntent[]} methodIntents
///@throws {Exception}
function runMethodIntents(argument0) {

		var methodIntents = argument0;
	
		if (isArray(methodIntents)) {
		
			var methodIntentsLength = getArrayLength(methodIntents)
			for (var index = 0; index < methodIntentsLength; index++) {
		
				var methodIntent = methodIntents[@ index];
				runMethodIntent(methodIntent);
			}
		}



}

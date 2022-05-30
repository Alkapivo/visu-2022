///@function createInputRecordRecording(type)
///@param {String} type
function createInputRecordRecording(argument0) {

		var type = argument0;
	
		switch (type) {
			case "player":
				///@type {List<InputRecord>}
				var inputRecording = createList();
				return inputRecording;
				break;
			default:
				throwException(createException(NotImplementedException, 
					"createInputRecordRecording()::default not implemented", runtimeExceptionHandler));
				break;
		}


}

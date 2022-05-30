///@function writeStringToFile(data, filepath)
///@description Save String data to file
///@param {String} data
///@param {String} path
function writeStringToFile(argument0, argument1) {

		var data = argument0;
		var filepath = string(argument1);
	
		if (isHtml5()) {
			
			var responseString = webStorageSave(filepath, data);
			var response = decodeJson(responseString);
			var exception = catchException();
			if (!isOptionalPresent(exception) && isJsonObject(response)) {
				var code = getJsonObjectFieldValue(response, "status");
				var message = getJsonObjectFieldValue(response, "message");
				switch (code) {
					case 200:
						logger("File saved to webStorage: {0}, size: {1}", LogType.INFO,
							string_replace_all(filepath, "\\", "/"),
							getStringFileSizeAsFormattedString(data));
						break;
					case 403:
						logger("WebStorageException was thrown. WebStorage code: {0}. WebStorage message: {1}", LogType.ERROR,
							code, message);
						break;
					default:
						logger("WebStorage returned with unrecognized code. Raw: {0}", LogType.WARNING, code);
						break;
				}
				destroyJsonObject(response);
			} else {
				logger("WebStorage returned unparsable JSON. System exception: {0}. Raw response: {1}", 
					LogType.WARNING, getExceptionMessage(exception), responseString);
			}
			
		} else {
			var file = file_text_open_write(filepath);
			if (file == -1) {
				logger("Cannot write to file: {0}", LogType.ERROR, filepath);
			} else {
				file_text_write_string(file, data);
				file_text_close(file);
				logger("File saved to local: {0}, size: {1}", LogType.INFO,
					string_replace_all(filepath, "\\", "/"),
					getStringFileSizeAsFormattedString(data));
			}
		}
	
	
	



}

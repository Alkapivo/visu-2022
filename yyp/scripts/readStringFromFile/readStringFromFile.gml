///@function readStringFromFile(path, filename, storageType)
///@description Read file as string.
///@param {String} path 
///@param {String} filename 
///@param {StorageType} [storageType=StorageType.LOCAL] - used only for HTML5
///@return {Optional<String>} data;
function readStringFromFile(path, filename) {

	try {
		
		var finalPath = path + "/" + filename;
		var storageType = argument_count > 2 ? argument[2] : StorageType.LOCAL;
		if (isHtml5()) {
			switch (storageType) {
				case StorageType.LOCAL:
					var responseString = webStorageLoadFromServer(finalPath);
					var response = decodeJson(responseString);
					var exception = catchException();
					if (!isOptionalPresent(exception) && isJsonObject(response)) {
						var code = getJsonObjectFieldValue(response, "status");
						var message = getJsonObjectFieldValue(response, "message");
						var data = getJsonObjectFieldValue(response, "data");
						code = !isOptionalPresent(data) ? 403 : code;
						switch (code) {
							case 200:
								logger("File loaded from server: {0}, size: {1}", LogType.INFO,
									string_replace_all(finalPath, "\\", "/"),
									getStringFileSizeAsFormattedString(data));
								return data;
								break;
							default:
								logger("WebStorageException was thrown. WebStorage code: {1} WebStorage message: {2}", LogType.ERROR,
									finalPath, code, message);
								return createEmptyOptional();
								break;
						}
						destroyJsonObject(response);
					} else {
						logger("WebStorage returned unparsable JSON. System exception: {0}. Raw response: {1}", 
							LogType.WARNING, getExceptionMessage(exception), responseString);
					}
					break;
				case StorageType.WEB_LOCAL_STORAGE:
					var responseString = webStorageLoadFromLocalStorage(finalPath);
					var response = decodeJson(responseString);
					var exception = catchException();
					if (!isOptionalPresent(exception) && isJsonObject(response)) {
						var code = getJsonObjectFieldValue(response, "code");
						var message = getJsonObjectFieldValue(response, "message");
						var data = getJsonObjectFieldValue(response, "data");
						code = !isOptionalPresent(data) ? 403 : code;
						switch (code) {
							case 200:
								logger("File loaded from localStorage: {0}, size: {1}", LogType.INFO,
									string_replace_all(finalPath, "\\", "/"),
									getStringFileSizeAsFormattedString(data));
								return data;
								break;
							default:
								logger("WebStorageException was thrown. WebStorage code: {1} WebStorage message: {2}", LogType.ERROR,
									finalPath, code, message);
								return createEmptyOptional();
								break;
						}
						destroyJsonObject(response);
					} else {
						logger("WebStorage returned unparsable JSON. System exception: {0}. Raw response: {1}", 
							LogType.WARNING, getExceptionMessage(exception), responseString);
					}
					break;
				default:
					logger("Unsupported storage type found. Raw: {0}", LogType.ERROR, storageType);
					return createEmptyOptional();
					break;
			}
		} else {
		
			var file = file_text_open_read(finalPath);
			if (file == -1) {
				logger("Cannot open file \"{0}\"", LogType.ERROR, finalPath);
				//file_text_close(file)
				return createEmptyOptional();
			}
		
			var data = "";
			while (!file_text_eof(file)) {
				data += file_text_read_string(file);
				file_text_readln(file);
			}
			file_text_close(file)
		
			logger("File loaded from local: {0}, size: {1}", LogType.INFO,
					string_replace_all(finalPath, "\\", "/"), 
					getStringFileSizeAsFormattedString(data));
				
			return data;
		}
	} catch (exception) {
		
		logger("{0}", LogType.ERROR, exception.message);
		printStackTrace();
			
	}
}

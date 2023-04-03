///@function readStringFromFileDialog(filename, extension)
///@description Read file as string
///@param {String} [filename=""]
///@param {String} [extension=""]
///@return {Optional<String>} data;
function readStringFromFileDialog(filename, extension) {

	try {
		var finalPath = get_open_filename("|*." + string(extension), string(filename));
		var file = file_text_open_read(finalPath);
		if (file == -1) {
			logger("Cannot open file \"{0}\"", LogType.ERROR, finalPath);
			file_text_close(file)
			return createEmptyOptional();
		}
	
		var data = "";
		while (!file_text_eof(file)) {
			data += file_text_read_string(file);
			file_text_readln(file);
		}
		file_text_close(file);

		logger("File loaded from local: {0}, size: {1}", LogType.INFO,
			string_replace_all(finalPath, "\\", "/"), 
			getStringFileSizeAsFormattedString(data));

		return data;
	} catch (exception) {
		
		logger("{0}", LogType.ERROR, exception.message);
		printStackTrace();
			
	}
}


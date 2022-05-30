///@function readStringFromFileDialog(filename, extension)
///@description Read file as string
///@param {String} [filename=""]
///@param {String} [extension=""]
///@return {Optional<String>} data;
function readStringFromFileDialog() {

		// TODO Check if FileSaver.js is required

		var filename = argument_count > 0 ? argument[0] : "";
		var extension = argument_count > 1 ? argument[1] : "";

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
	



}

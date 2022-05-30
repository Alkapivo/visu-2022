///@function writeStringToFileDialog(data, filename, extension)
///@description Save String data to file
///@param {String} data
///@param {String} filename
///@param {String} extension
function writeStringToFileDialog(argument0, argument1, argument2) {

		// TODO Check if FileSaver.js is required
	
		var data = argument0;
		var filename = string(argument1);
		var extension = string(argument2);

		var filepath = get_save_filename("|*." + extension, filename);
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

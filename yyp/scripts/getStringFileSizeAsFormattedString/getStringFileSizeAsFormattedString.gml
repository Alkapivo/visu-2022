///@function getStringFileSizeAsFormattedString(data)
///@description Return Size of string with B, KB or MB prefix
///@param {String} data
///@return {String} formattedString
function getStringFileSizeAsFormattedString(argument0) {

		var data = argument0;
	
		var size = string_length(data);
		var prefix = size > 1024 ? "KB" : "B";
		size = size > 1024 ? size / 1024 : size;
		if (size > 1024) {
			prefix = "MB";
			size = size / 1024;
		}
		var decimal = 2;
		var length = string_length(string(floor(size)));
	
		return string_format(size, length, decimal) + string(prefix);


}

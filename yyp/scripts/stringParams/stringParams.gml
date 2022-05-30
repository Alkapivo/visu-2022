///@function stringParams(template, [params...])
///@description Create string with {} params. Ex: stringParams("String {0}x{1}", "100", "200") will return String "String 100x200".
///@param {String} template
///@param {Object} [params...]
function stringParams() {


		var template = argument[0];

		if (argument_count > 1) {
			for (var index = 1; index < argument_count; index++) {
				var subString = "{" + string(index - 1) + "}";
				var newString = string(argument[index]); 
				template = string_replace_all(template, subString, newString);
			}
		}
	
		return template;
	



}

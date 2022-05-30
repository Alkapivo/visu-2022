///@function consoleCommandGetMouseData(parameters)
///@description Command GetMouseData implementation
///@param {String[]} parameters
///@gmlPragma
function consoleCommandGetMouseData(argument0) {

		///@required
		var parameters = argument0;
	
		if (isHtml5()) {
			print(
				stringParams(
					"gui: {0}x{1}, view: {2}x{3}",
					getHtml5MouseGuiX(), getHtml5MouseGuiY(),
					getMouseViewX(), getMouseViewY()
				)
			);
		} else {
			print(
				stringParams(
					"gui: {0}x{1}, view: {2}x{3}",
					getMouseGuiX(), getMouseGuiY(),
					getMouseViewX(), getMouseViewY()
				)
			);
		}



}

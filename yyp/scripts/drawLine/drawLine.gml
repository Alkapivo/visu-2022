///@function drawLine(xBegin, yBegin, xEnd, yEnd, [width])
///@description Wrapper for drawLine
///@param {Number} xBegin
///@param {Number} yBegin
///@param {Number} xEnd
///@param {Number} yEnd
///@param {Number} [width]
function drawLine() {

		if (argument_count < 4) {
			logger("drawLine must have at least 4 arguments provided.", LogType.ERROR);
			return;	
		}

		var xBegin = argument[0];
		var yBegin = argument[1];
		var xEnd = argument[2];
		var yEnd = argument[3];
		var width = argument_count > 4 ? argument[4] : 1.0;
	
		// TODO add antyaliasing
		draw_line_width(
			xBegin,
			yBegin,
			xEnd,
			yEnd,
			width);
	



}

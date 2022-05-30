///@function renderText(text, coordX, coordY, textColor, alpha)
///@description Render text.
///@param {String} text
///@param {Integer} coordX
///@param {Integer} coordY
///@param {GMColor} [textColor=c_white]
///@param {Number} [alpha=1.0]
function renderText() {

		///checkArgumentCount(3, argument_count, renderText);

		var text = argument[0];
		var coordX = argument[1];
		var coordY = argument[2];
		var textColor = argument_count > 3 ? argument[3] : c_white
		var alpha = argument_count > 4 ? argument[4] : 1.0;
	
		text = string(text);
	
		draw_text_color(coordX, coordY, text, textColor, textColor, textColor, textColor, alpha);
	



}

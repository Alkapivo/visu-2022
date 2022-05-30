///@function renderTextOutline(text, coordX, coordY, textColor, outlineColor, alpha)
///@description Render text.
///@param {String} text
///@param {Integer} coordX
///@param {Integer} coordY
///@param {GMColor} [textColor=c_white]
///@param {GMColor} [outlineColor=c_black]
///@param {Number} [alpha=1.0]
function renderTextOutline() {

		///checkArgumentCount(3, argument_count, renderTextOutline);

		var text = argument[0];
		var coordX = argument[1];
		var coordY = argument[2];
		var textColor = argument_count > 3 ? argument[3] : c_white
		var outlineColor = argument_count > 4 ? argument[4] : c_black
		var alpha = argument_count > 5 ? argument[5] : 1.0;
	
		text = string(text);
	
		draw_text_color(coordX + 1, coordY + 1, text, outlineColor, outlineColor, outlineColor, outlineColor, alpha);  
		draw_text_color(coordX - 1, coordY - 1, text, outlineColor, outlineColor, outlineColor, outlineColor, alpha);  
		draw_text_color(coordX,     coordY + 1, text, outlineColor, outlineColor, outlineColor, outlineColor, alpha);  
		draw_text_color(coordX + 1, coordY    , text, outlineColor, outlineColor, outlineColor, outlineColor, alpha);  
		draw_text_color(coordX,     coordY - 1, text, outlineColor, outlineColor, outlineColor, outlineColor, alpha);  
		draw_text_color(coordX - 1, coordY    , text, outlineColor, outlineColor, outlineColor, outlineColor, alpha);  
		draw_text_color(coordX - 1, coordY + 1, text, outlineColor, outlineColor, outlineColor, outlineColor, alpha);  
		draw_text_color(coordX + 1, coordY - 1, text, outlineColor, outlineColor, outlineColor, outlineColor, alpha); 
	
		draw_text_color(coordX, coordY, text, textColor, textColor, textColor, textColor, alpha);
	



}

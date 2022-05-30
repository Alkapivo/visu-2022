///@function drawTextOutline(x, y, text, outlineColor, textColor)  
///@description wrapper for draw_text with outline effect
///@param {Integer} x
///@param {Integer} y
///@param {String} text
///@param {GMColor} [outlineColor=c_black]
///@param {GMColor} [textColor=c_white]
///@param {Integer} [alpha=1.0]
function drawTextOutline() {

		///checkArgumentCount(3, argument_count, drawTextOutline);

		var xx = argument[0];  
		var yy = argument[1]; 
		var text = argument[2];
		var outlineColor = argument_count > 3 ? argument[3] : c_black
		var textColor = argument_count > 4 ? argument[4] : c_white
		var alpha = argument_count > 5 ? argument[5] : 1.0;
	
	
		draw_text_color(xx + 1, yy + 1, text, outlineColor, outlineColor, outlineColor, outlineColor, alpha);  
		draw_text_color(xx - 1, yy - 1, text, outlineColor, outlineColor, outlineColor, outlineColor, alpha);  
		draw_text_color(xx,     yy + 1, text, outlineColor, outlineColor, outlineColor, outlineColor, alpha);  
		draw_text_color(xx + 1, yy    , text, outlineColor, outlineColor, outlineColor, outlineColor, alpha);  
		draw_text_color(xx,     yy - 1, text, outlineColor, outlineColor, outlineColor, outlineColor, alpha);  
		draw_text_color(xx - 1, yy    , text, outlineColor, outlineColor, outlineColor, outlineColor, alpha);  
		draw_text_color(xx - 1, yy + 1, text, outlineColor, outlineColor, outlineColor, outlineColor, alpha);  
		draw_text_color(xx + 1, yy - 1, text, outlineColor, outlineColor, outlineColor, outlineColor, alpha);  /*
		draw_text_color(xx + 2, yy + 2, text, outlineColor, outlineColor, outlineColor, outlineColor, alpha);  
		draw_text_color(xx - 2, yy - 2, text, outlineColor, outlineColor, outlineColor, outlineColor, alpha);  
		draw_text_color(xx,     yy + 2, text, outlineColor, outlineColor, outlineColor, outlineColor, alpha);  
		draw_text_color(xx + 2, yy    , text, outlineColor, outlineColor, outlineColor, outlineColor, alpha);  
		draw_text_color(xx,     yy - 2, text, outlineColor, outlineColor, outlineColor, outlineColor, alpha);  
		draw_text_color(xx - 2, yy    , text, outlineColor, outlineColor, outlineColor, outlineColor, alpha);  
		draw_text_color(xx - 2, yy + 2, text, outlineColor, outlineColor, outlineColor, outlineColor, alpha);  
		draw_text_color(xx + 2, yy - 2, text, outlineColor, outlineColor, outlineColor, outlineColor, alpha);
	*/
	
		draw_text_color(xx, yy, text, textColor, textColor, textColor, textColor, alpha);
	



}

///@function drawText(posotionX, positionY, text, font, halign, valign, c1, c2, c3, c4, alpha);
///@param positionX
///@param positionY
///@param text
///@param font
///@param fontHorizontalAlignment
///@param fontVerticalAlignment
///@param fontColorTopLeft
///@param fontColorTopRight
///@param fontColorBottomLeft
///@param fontColorBottomRight
///@param fontAlpha
function drawText(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10) {

		var positionX = argument0;
		var positionY = argument1;
		var text = argument2;
		var font = argument3;
		var fontHorizontalAlignment = argument4;
		var fontVerticalAlignment = argument5;
		var fontColorTopLeft = argument6;
		var fontColorTopRight= argument7;
		var fontColorBottomLeft = argument8
		var fontColorBottomRight = argument9;
		var fontAlpha = argument10;
		
		draw_set_font(font);
		draw_set_halign(fontHorizontalAlignment);
		draw_set_valign(fontVerticalAlignment);
		draw_text_color(
			positionX,
			positionY,
			text,
			fontColorTopLeft,
			fontColorTopRight,
			fontColorBottomLeft,
			fontColorBottomRight,
			fontAlpha);


}

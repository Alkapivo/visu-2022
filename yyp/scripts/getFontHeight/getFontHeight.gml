///@function getFontHeight(font)
///@description Wrapper for draw_set_font, string_height.
///@param {Font} font
///@return {Integer} fontHeight
function getFontHeight(argument0) {

		var font = argument0;
		var usedFont = draw_get_font();
	
		draw_set_font(font);
		var fontHeight = string_height("|");
		draw_set_font(usedFont);
	
		return fontHeight;



}

///@function getFontHeight(font)
///@description Wrapper for draw_set_font, string_height.
///@param {Font} font
///@return {Integer} fontHeight
function getFontHeight(font) {

	var usedFont = draw_get_font();
	
	draw_set_font(font);
	var fontHeight = string_height("|");
	draw_set_font(usedFont);
	
	return fontHeight;
}

///@function getFontWidth(font)
///@description Wrapper for draw_set_font, string_width.
///@param {Font} font
///@return {Integer} fontWidth
function getFontWidth(font) {

	var usedFont = draw_get_font();
	
	draw_set_font(font);
	var fontHeight = string_height("|");
	draw_set_font(usedFont);
	
	return fontHeight;
}

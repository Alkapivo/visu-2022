///@function getMouseGuiX)
///@description Get mouse position in relation to guiHeight
///@param {MouseDevice} [mouseDevice]
///@return {Integer} mouseGuiX
function getMouseGuiX() {

		var mouseDevice = argument_count > 0 ? argument[0] : 0;
	
		if (isHtml5()) {
			return getHtml5MouseGuiX(mouseDevice);	
		} else {
			var screenWidth = window_get_width();
			var screenMouseX = window_mouse_get_x();
			var ratio = (GuiWidth / screenWidth);
			return round(screenMouseX * ratio);
		}
	



}

///@function getMouseGuiY(mouseDevice)
///@description Get mouse position in relation to guiHeight
///@param {MouseDevice} [mouseDevice]
///@return {Integer} mouseGuiY
function getMouseGuiY() {

		var mouseDevice = argument_count > 0 ? argument[0] : 0;

		if (isHtml5()) {
			return getHtml5MouseGuiY(mouseDevice);
		} else {
			var screenHeight = window_get_height();
			var screenMouseY = window_mouse_get_y() - round(isHtml5() ? window_get_y() : 0);
			var ratio = (GuiHeight / screenHeight);
			return round(screenMouseY * ratio);
		}
	



}

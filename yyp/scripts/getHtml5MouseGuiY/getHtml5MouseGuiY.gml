///@function getHtml5MouseGuiY(mouseDevice)
///@description Get absolute
///@param {MouseDevice} mouseDevice
///@return {Number} guiY
function getHtml5MouseGuiY() {

		var mouseDevice = argument_count > 0 ? argument[0] : 0;

		var ratio = GuiHeight / global.realHeight;
		return (device_mouse_raw_y(mouseDevice) - jsUtilGetCanvasOffsetY()) * ratio;
	



}

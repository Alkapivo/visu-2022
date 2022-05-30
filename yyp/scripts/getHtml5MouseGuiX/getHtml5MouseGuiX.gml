///@function getHtml5MouseGuiX(mouseDevice)
///@description Get absolute
///@param {MouseDevice} mouseDevice
///@return {Number} guiY
function getHtml5MouseGuiX() {

		var mouseDevice = argument_count > 0 ? argument[0] : 0;

		var ratio = GuiWidth / global.realWidth;
		return (device_mouse_raw_x(mouseDevice) - jsUtilGetCanvasOffsetX()) * ratio;
	



}

///@function getMouseManagerMouseCursor(mouseCursor)
///@description Getter.
///@param {MouseCursor} mouseCursor
function setMouseManagerMouseCursor(argument0) {

		var mouseCursor = argument0;

		var mouseManager = getMouseManager();
	
		setInstanceVariable(mouseManager, FieldMouseManager_mouseCursor, mouseCursor);
	



}

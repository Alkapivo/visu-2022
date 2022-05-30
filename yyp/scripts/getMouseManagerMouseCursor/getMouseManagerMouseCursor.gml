///@function getMouseManagerMouseCursor()
///@description Getter.
///@return {Optional<MouseCursor>}
function getMouseManagerMouseCursor() {

		var mouseManager = getMouseManager();
	
		var mouseCursor = getInstanceVariable(mouseManager, FieldMouseManager_mouseCursor);
	
		return mouseCursor;
	



}

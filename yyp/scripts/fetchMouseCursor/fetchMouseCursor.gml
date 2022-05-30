///@function fetchMouseCursor()
///@description Get & initialize default mouse cursor.
///@return {MouseCursor} mouseCursor
function fetchMouseCursor() {

		var mouseCursor = getMouseManagerMouseCursor();
	
		if (!isEntity(mouseCursor, MouseCursor)) {
		
			mouseCursor = createMouseCursor(
				createPosition(
					getMouseViewX(),
					getMouseViewY()
				),
				createPosition(
					getMouseGuiX(),
					getMouseGuiY()
				),
				createEmptyOptional(),
				createEmptyOptional(),
				createEmptyOptional()
			);
		
			setMouseManagerMouseCursor(mouseCursor);
		}
	
		return mouseCursor;
	



}

///@function destroyMouseCursor(mouseCursor)
///@description Destroy MouseCursor entity.
///@param {MouseCursor} mouseCursor
///@throws {Exception}
///@generated {2021-05-01T23:43:42.797Z}

function destroyMouseCursor(mouseCursor) {


	
	var viewPosition = getMouseCursorViewPosition(mouseCursor);
	var guiPosition = getMouseCursorGuiPosition(mouseCursor);
	var texture = getMouseCursorTexture(mouseCursor);
	var type = getMouseCursorType(mouseCursor);
	var data = getMouseCursorData(mouseCursor);
	
	destroyPosition(viewPosition);
	setMouseCursorViewPosition(mouseCursor, null);
	
	destroyPosition(guiPosition);
	setMouseCursorGuiPosition(mouseCursor, null);
	
	if (isOptionalPresent(data)) {
		destroyMouseCursorData(data);
	}
	setMouseCursorData(mouseCursor, null);
	

	
}

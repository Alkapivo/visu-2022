///@function createMouseCursor(viewPosition, guiPosition, texture, type, data)
///@description Constructor for MouseCursor entity.
///@param {Position} viewPosition
///@param {Position} guiPosition
///@param {Optional<AssetTexture>} texture
///@param {Optional<CursorType>} type
///@param {Optional<MouseCursorData>} data
///@return {MouseCursor} mouseCursor 
///@throws {Exception}
///@generated {2021-05-01T23:49:41.517Z}

function createMouseCursor(viewPosition, guiPosition, texture, type, data) {

	var mouseCursor = createEntity(MouseCursor);

	setMouseCursorViewPosition(mouseCursor, assertNoOptional(viewPosition));
	setMouseCursorGuiPosition(mouseCursor, assertNoOptional(guiPosition));
	setMouseCursorTexture(mouseCursor, texture);
	setMouseCursorType(mouseCursor, type);
	setMouseCursorData(mouseCursor, data);

	return mouseCursor;
	
}

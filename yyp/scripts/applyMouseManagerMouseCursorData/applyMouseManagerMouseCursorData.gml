///@function applyMouseManagerMouseCursorData(entity, data)
///@description Update MouseManager::MouseCursor.data.
///@param {Entity<T>} entity
///@param {Optional<ArrayMap<String::any>>} [data=null]
function applyMouseManagerMouseCursorData() {

		var entity = argument[0];
		var data = argument_count > 1 ? argument[1] : createEmptyOptional();
	
		var mouseCursor = getMouseManagerMouseCursor();
		if (!isEntity(mouseCursor, MouseCursor)) {
			return false;	
		}
	
		var mouseCursorData = getMouseCursorData(mouseCursor);
		if (!isEntity(mouseCursorData)) {
			mouseCursorData = createMouseCursorData(
				createEmptyOptional(),
				createEmptyOptional()
			);
			setMouseCursorData(mouseCursor, mouseCursorData);
		}
	
		var entityClass = getEntityClass(entity);
		var object = createGenericEntity(entityClass, entity);
	
		setMouseCursorDataObject(mouseCursorData, object);
		setMouseCursorDataData(mouseCursorData, data);
	



}

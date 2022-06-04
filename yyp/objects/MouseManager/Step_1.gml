///@description stepBegin()
		
	#region {MouseCursor} mouseCursor
	if (isEntity(mouseCursor, MouseCursor)) {
		var texture = getMouseCursorTexture(mouseCursor);
		if (isTexture(texture)) {
			if (cursor_sprite != texture) {
				cursor_sprite = texture;	
			}
		} else {
			if (cursor_sprite != -1) {
				cursor_sprite = -1;	
			}
		}
		
		var currentType = window_get_cursor();
		var type = getMouseCursorType(mouseCursor);
		if (isOptionalPresent(type)) {
			if (currentType != type) {
				window_set_cursor(type);	
			}
		}
		
		if (global.enableCursor == 0.0) {
			
			cursor_sprite = asset_texture_cursor_cinema;
		}
		
		var viewPosition = getMouseCursorViewPosition(mouseCursor);
		setPositionHorizontal(viewPosition, getMouseViewX());
		setPositionVertical(viewPosition, getMouseViewY());
		
		var guiPosition = getMouseCursorGuiPosition(mouseCursor);
		setPositionHorizontal(guiPosition, getMouseGuiX());
		setPositionVertical(guiPosition, getMouseGuiY());
	}
	#endregion
		
	#region {Reactor<MouseAction>} mouseActionReactor
	for (var mouseAction = getReactorFirstElement(mouseActionReactor);
		 iteratorFinish(mouseAction);
		 mouseAction = getReactorNextElement(mouseActionReactor)) {
	
		var handler = getMouseActionHandler(mouseAction);
		var isAction = runScript(handler, mouseAction);
		if (isAction) {
			
			var mouseActionEvent = generateMouseActionEventFromMouseAction(mouseAction);
			sendMouseActionEvent(mouseActionEvent);
			
			var type = getMouseActionType(mouseAction);
			if (type == MouseActionType_LEFT_DROP) {
				setMouseCursorTexture(fetchMouseCursor(), cursor);
			}
		}
	}
	#endregion
	
	#region {Pipeline<MouseActionEvent>} mouseActionEventPipeline
	for (var mouseActionEvent = getPipelineFirstElement(mouseActionEventPipeline);
		 iteratorFinish(mouseActionEvent);
		 mouseActionEvent = getPipelineNextElement(mouseActionEventPipeline)) {
	
		var mouseActionEventType = getMouseActionEventType(mouseActionEvent);
		var mouseViewContainersOrderSize = getListSize(mouseViewContainersOrder);
		for (var index = mouseViewContainersOrderSize - 1; index >= 0; index--) {
			
			var mouseViewContainerName = mouseViewContainersOrder[| index];
			var mouseViewContainer = findInRepositoryById(mouseViewContainers, mouseViewContainerName);
			if (!isEntity(mouseViewContainer, MouseViewContainer)) {
				throwException(
					createException(
						InvalidEntityException,
						stringParams("Expected MouseViewContainer. { \"raw\": \"{0}\" }", mouseViewContainer)
					)
				);
			}
			
			var exception = catchException();
			if (isOptionalPresent(exception)) {
				removeFromRepositoryById(mouseViewContainer, mouseViewContainerName);
				continue;
			}
			
			var area = getMouseViewContainerArea(mouseViewContainer);
			var mouseGuiX = getMouseGuiX();
			var mouseGuiY = getMouseGuiY();
			if (coordsInRectangle(area, mouseGuiX, mouseGuiY)) {
				
				var result = resolveMouseViewContainerMouseAction(mouseViewContainer, mouseActionEvent);
				
				if (result) {
					break;
				}
			}
		}
	}
	#endregion
	

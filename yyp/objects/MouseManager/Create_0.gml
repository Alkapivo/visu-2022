///@description create()
	
	super();

	#region Fields
	
	#macro FieldMouseManager_mouseActionReactor "mouseActionReactor"
	#macro FieldMouseManager_mouseActionEventPipeline "mouseActionEventPipeline"
	#macro FieldMouseManager_mouseCursor "mouseCursor"
	#macro FieldMouseManager_mouseViewContainers "mouseViewContainers"
	#macro FieldMouseManager_mouseViewContainersOrder "mouseViewContainersOrder"
	
///@public:
	
	///@type {Optional<MouseCursor>}
	mouseCursor = createEmptyOptional();
	
	///@type {Integer}
	mouseDragThreshoold = 3;
	
	///@type {Boolean}
	mouseLeftDrag = false;
	
	///@type {Boolean}
	mouseLeftDrop = false;
	
	///@type {Boolean}
	mouseLeftPressed = false;
	
	///@type {Position}
	mouseLeftPressedPosition = createPosition(0, 0);
	
	///@type {Boolean}
	mouseRightDrag = false;
	
	///@type {Boolean}
	mouseRightDrop = false;
	
	///@type {Boolean}
	mouseRightPressed = false;
	
	///@type {Position}
	mouseRightPressedPosition = createPosition(0, 0);
		
///@private:

	///@type {Reactor<MouseAction>}
	mouseActionReactor = generateReactor("mouseActionReactor", List, MouseAction);
	
	///@type {Pipeline<MouseActionEvent>}
	mouseActionEventPipeline = generatePipeline("mouseActionEventPipeline", Queue, MouseActionEvent);
	
	///@type {Repository<MouseViewContainer>}
	mouseViewContainers = createRepository("mouseViewContainers", "MouseViewContainer", createMap());
	
	///@type {List<String>}
	mouseViewContainersOrder = createList();
	
	#endregion    

	#region initializeMouseActions()
	registerMouseAction(
		createMouseAction(
			MouseActionType_LEFT_DROP,
			true,
			mouseActionLeftDropHandler
		)
	);
	
	registerMouseAction(
		createMouseAction(
			MouseActionType_LEFT_PRESSED,
			true,
			mouseActionLeftPressedHandler
		)
	);
	
	registerMouseAction(
		createMouseAction(
			MouseActionType_LEFT_RELEASED,
			true,
			mouseActionLeftReleasedHandler
		)
	);
	
	registerMouseAction(
		createMouseAction(
			MouseActionType_LEFT_DRAG,
			true,
			mouseActionLeftDragHandler
		)
	);
	
	registerMouseAction(
		createMouseAction(
			MouseActionType_RIGHT_DROP,
			true,
			mouseActionRightDropHandler
		)
	);
	
	registerMouseAction(
		createMouseAction(
			MouseActionType_RIGHT_PRESSED,
			true,
			mouseActionRightPressedHandler
		)
	);
	
	registerMouseAction(
		createMouseAction(
			MouseActionType_RIGHT_RELEASED,
			true,
			mouseActionRightReleasedHandler
		)
	);
	
	registerMouseAction(
		createMouseAction(
			MouseActionType_RIGHT_DRAG,
			true,
			mouseActionRightDragHandler
		)
	);
	
	registerMouseAction(
		createMouseAction(
			MouseActionType_SCROLL_UP,
			true,
			mouseActionScrollUpHandler
		)
	);
	
	registerMouseAction(
		createMouseAction(
			MouseActionType_SCROLL_DOWN,
			true,
			mouseActionScrollDownHandler
		)
	);
	#endregion
	

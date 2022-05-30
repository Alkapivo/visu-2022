///@function createMouseAction(type, state, handler)
///@description Constructor for MouseAction entity.
///@param {String} type
///@param {Boolean} state
///@param {AssetScript} handler
///@return {MouseAction} mouseAction 
///@throws {Exception}
///@generated {2021-05-01T23:49:41.578Z}

function createMouseAction(type, state, handler) {

	var mouseAction = createEntity(MouseAction);

	setMouseActionType(mouseAction, assertNoOptional(type));
	setMouseActionState(mouseAction, assertNoOptional(state));
	setMouseActionHandler(mouseAction, assertNoOptional(handler));

	return mouseAction;
	
}

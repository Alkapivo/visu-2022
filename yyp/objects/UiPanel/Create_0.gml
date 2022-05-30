///@description	create()

	#region Fields
	
	#macro FieldUiPanel_name "name"
	#macro FieldUiPanel_area "area"
	#macro FieldUiPanel_uiManager "uiManager"
	#macro FieldUiPanel_isActive "isActive"
	#macro FieldUiPanel_uiActionEventPipeline "uiActionEventPipeline"
	#macro FieldUiPanel_mouseActionEventHandler "mouseActionEventHandler"
	#macro FieldUiPanel_stepHandler "stepHandler"
	#macro FieldUiPanel_renderHandler "renderHandler"
	#macro FieldUiPanel_prerenderHandler "prerenderHandler"
	#macro FieldUiPanel_uiActionEventHandler "uiActionEventHandler"
	
///@public:

	///@type {String}
	name = createEmptyOptional();

	///@type {Rectangle}
	area = createRectangle(0, 0, 0, 0);
	
	///@type {Optional<UiManager>}
	uiManager = createEmptyOptional();

///@private:

	///@type {Boolean}
	isActive = true;
	
	///@type {Pipeline<UiActionEvent>}
	uiActionEventPipeline = generatePipeline("uiActionEventPipeline", Queue, UiActionEvent);
	
	///@type {Optional<AssetScript~UiPanelMouseActionEventHandler>}
	mouseActionEventHandler = createEmptyOptional();
	
	///@type {Optional<AssetScript~UiPanelRenderHandler>}
	renderHandler = createEmptyOptional();
	
	///@type {Optional<AssetScript~UiPanelRenderHandler>}
	prerenderHandler = createEmptyOptional();
	
	///@type {Optional<AssetScript~UiPanelStepHandler>}
	stepHandler = createEmptyOptional();
	
	///@type {Optional<AssetScript~UiActionEventHandler>}
	uiActionEventHandler = createEmptyOptional();
	
	#endregion
	

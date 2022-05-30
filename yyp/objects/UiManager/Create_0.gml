///@description create()

	super();
	
	#region Fields
	
	#macro FieldUiManager_mouseViewContainer "mouseViewContainer"
	#macro FieldUiManager_mouseViewContainerStepHandler "mouseViewContainerStepHandler"
	#macro FieldUiManager_uiPanels "uiPanels"
	
///@public:
	
	
///@private:

	///@type {Optional<MouseViewContainer>}
	mouseViewContainer = createEmptyOptional();
	
	///@type {Optional<AssetScript~MouseViewContainerStepHandler}
	mouseViewContainerStepHandler = createEmptyOptional();

	///@type {List<UiPanel?>}
	uiPanels = createList();
	
	#endregion   
	
	
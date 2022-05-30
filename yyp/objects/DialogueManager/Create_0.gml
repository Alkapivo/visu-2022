///@description Initialize DialogueManager

	super();
	
	#region Fields
	
	#macro FieldDialogueManager_dialogueEventPipeline "dialogueEventPipeline"
	#macro FieldDialogueManager_currentDialogueContext "currentDialogueContext"
	#macro FieldDialogueManager_currentDialogueDisplayContext "currentDialogueDisplayContext"
	#macro FieldDialogueManager_dialogueMessagePipeline "dialogueMessagePipeline"
	
	global.__dialogueMobContext = null;
	#macro DialogueMobContext global.__dialogueMobContext
	
	#macro DialogueBarHeight 160
	#macro DialogueBarContentWidth 512
	#macro DialogueBarContentHeight (DialogueBarHeight * 0.7)
	#macro DialogueBarAuthorHeight (DialogueBarHeight * 0.3)
	
///@public:

	///@type {Queue<DialogueEvent>}
	dialogueEventPipeline = generatePipeline("dialogueEventPipeline", Queue, DialogueEvent);
	
	///@type {Optional<DialogueContext>}
	currentDialogueContext = createEmptyOptional();
	
	///@type {Optional<DialogueDisplayContext>}
	currentDialogueDisplayContext = createEmptyOptional();
	
	///@type {Optional<Dialogue>}
	currentDialogue = createEmptyOptional();
	
	///@type {Optional<DialogueNode>}
	currentDialogueNode = createEmptyOptional();
	
	///@type {Optional<String>}
	currentDialogueNodeChoices = createEmptyOptional();
	
	///@type {DialogueRenderState}
	dialogueRenderState = DialogueRenderState_IDLE;
	
	///@type {Optional<Surface>}
	dialogueRenderSurface = createEmptyOptional();
	
	///@type {Boolean}
	endEventDialogueContext= false;
	
	///@type {Number}
	barVerticalPosition = 0.0;
	
	///@type {Number}
	barVerticalPositionTarget = DialogueBarHeight;
	
	///@type {Pipeline<Tuple<String::GMColor>>}
	dialogueMessagePipeline = generatePipeline("dialogueMessagePipeline", Queue, Tuple);
	
///@private:
	
	///@type {Optional<Integer>}
	currentDialogueNodeChoicePointer = createEmptyOptional();
	
	///@type {Number}
	displayTimer = 0.0;
	
	///@type {Number}
	displaySpeed = getPropertyReal("dialogueManager.displaySpeed", 20 / GAME_FPS);
	
	///@type {Boolean}
	logDebug = getPropertyBoolean("dialogueManager.logDebug", false);
	
	#region initializeUiManager()
	var data = createArrayMap(
		[ 
			FieldUiManager_mouseViewContainer,
			FieldUiManager_mouseViewContainerStepHandler
		],
		[
			createMouseViewContainer(
				"dialogueUi", 
				createRectangle(0, 0, GuiWidth, GuiHeight), 
				[
					MouseActionType_LEFT_DRAG,
					MouseActionType_LEFT_DROP,
					MouseActionType_LEFT_PRESSED,
					MouseActionType_SCROLL_UP,
					MouseActionType_SCROLL_DOWN
				], 
				defaultUiManagerMouseActionEventHandler,
				this
			),
			dialogueManagerMouseViewContainerStepHandler
		]
	);
	initializeUiManager(this, data);
	#endregion
	
	tradeWindow = createEmptyOptional();	
	global.isDialog = false;
	global.npcDialog = createEmptyOptional();
	
	dialogueCooldown = 0;
	
	awaitMouseClick = false;
	
	IsTradePanel = false;
	#endregion
	

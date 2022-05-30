///@function dispatchDialogueEventStart(dialogueContext, dialogueEvent)
///@description Handler.
///@param {Optional<DialogueContext>} dialogueContext
///@param {DialogueEvent} dialogueEvent
///@throws {DialogueManagerException}
function dispatchDialogueEventStart(argument0, argument1) {

		var dialogueContext = argument0;
		var dialogueEvent = argument1;
	
		IsTradePanel = false;
		removeUiPanelFromUiManagerByClass(getDialogueManager(), TradePanel);
	
		var type = getDialogueEventType(dialogueEvent);
		var data = getDialogueEventData(dialogueEvent);
	
		var dialogueId = getValueFromArrayMap(data, "dialogueId");
		var dialogue = fetchDialogue(dialogueId);
		if (!isOptionalPresent(dialogue)) {
			defaultDialgoueEventExceptionHandler(dialogueEvent);
			return;
		}
	
		var dialogueMobContext = getValueFromArrayMap(data, "npc");
		DialogueMobContext = dialogueMobContext;
	
	#region Validation
		var currentDialogueContext = getDialogueContext();
		if (isEntity(currentDialogueContext, DialogueContext)) {
			throwException(
				createException(
					DialogueManagerException,
					stringParams("Dialogue couldn't be started. Another dialogue is running. " + 
						"{ \"intentDialogueId\": \"{0}\", \"currentDialogueId\": \"{1}\" }",
						dialogueId, getDialogueName(getDialogueContextDialogue(currentDialogueContext)))
				)
			);
			return;
		}
	#endregion
	
		var dialogueContext = createDialogueContext(dialogue, createEmptyOptional());
		registerCurrentDialogueContext(dialogueContext);
	
		var player = PlayerContext;
		var npc = DialogueMobContext;
	
	#region Setup actors position
		if ((worldInstanceExists(player)) && 
			(worldInstanceExists(npc))) {
		
			var playerDirection = getRightAngle(getAngleBetweenInstances(player, npc));
			setInstanceVariable(player, "mobDirection", playerDirection);
			var playerWalkStripTexture = getInstanceVariable(player, "walkStripTexture");
			if (isEntity(playerWalkStripTexture, StripTexture)) {
			
				animateStripTexture(player, playerWalkStripTexture, playerDirection);
			}
		
			var npcDirection = getRightAngle(getAngleBetweenInstances(npc, player));
			setInstanceVariable(npc, "mobDirection", npcDirection);
			var npcWalkStripTexture = getInstanceVariable(npc, "walkStripTexture");
			if (isEntity(npcWalkStripTexture, StripTexture)) {
			
				animateStripTexture(npc, npcWalkStripTexture, npcDirection);
			}
		
		}
	#endregion
	
		var gotoNodeEventData = createArrayMap(
			[ "nodeId" ],
			[ getDialogueStartNode(dialogue) ]
		);
	
		var dialogueEvent = createDialogueEvent(DialogueEventType_GOTO_NODE, gotoNodeEventData);
		sendDialogueEvent(dialogueEvent);
	
		sendWorldEvent(createWorldEvent(WorldEventType_STOP_GAME_LOOP, createMap()));



}

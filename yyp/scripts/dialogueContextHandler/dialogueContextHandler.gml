///@function dialogueContextHandler(dialogueContext, dialogueDisplayContext)
///@description Resolve dialogueContext. 
///@param {DialogueContext} dialogueContext
///@param {DialogueDisplayContext} dialogueDisplayContext
function dialogueContextHandler(dialogueContext, dialogueDisplayContext) {
		
	if (IsTradePanel) {
	
		return;
	}
	
	if (IsCutsceneMode) {
	
		return;
	}
	
	#region Resolve end dialogue event
	var dialogueManager = getDialogueManager();
	var barVerticalPosition = getInstanceVariable(dialogueManager, "barVerticalPosition");
	var barVerticalPositionTarget = getInstanceVariable(dialogueManager, "barVerticalPositionTarget");
	var endEventDialogueContext = getInstanceVariable(dialogueManager, "endEventDialogueContext");
	if (isEntity(endEventDialogueContext, DialogueContext)) {
	
		if (barVerticalPosition <= 8) {
		
			deregisterCurrentDialogueContext(endEventDialogueContext);
			sendWorldEvent(createWorldEvent(WorldEventType_START_GAME_LOOP, createMap()));
			setInstanceVariable(dialogueManager, "endEventDialogueContext", null);
			setInstanceVariable(dialogueManager, "barVerticalPosition", 0);
			setInstanceVariable(dialogueManager, "barVerticalPositionTarget", DialogueBarHeight);
		}
		
		return;
	} else {
		
		if (barVerticalPositionTarget == 0.0) {
			
			barVerticalPositionTarget = DialogueBarHeight;
			setInstanceVariable(dialogueManager, "barVerticalPositionTarget", barVerticalPositionTarget);
		}
	}
	
	if (abs(barVerticalPosition - barVerticalPositionTarget) > (barVerticalPositionTarget * 0.05)) {
	
		return;
	}
	#endregion
	
	///@require com.yoyogames.gms.util.string::string_height
	draw_set_font(MEAT_FONT_DIALOGUE_TEXT);
	
	#region Validation
	if (!isEntity(dialogueContext, DialogueContext)) {
		
		return;	
	}
	if (!isEntity(dialogueDisplayContext, DialogueDisplayContext)) {
		
		return;
	}
	
	var textLength = getDialogueDisplayContextTextLength(dialogueDisplayContext);
	var textPointer = getDialogueDisplayContextTextPointer(dialogueDisplayContext);
	var dialogueChoices = getDialogueDisplayContextChoices(dialogueDisplayContext);
	if (!isNumber(textLength)) {
		
		return;	
	}
		
	#endregion
	
	#region Update textPointer and text
	var dialogueContent = getDialogueDisplayContextText(dialogueDisplayContext);
	var dialogueContentWrapped = !stringContains(dialogueContent, "~") ? 
		wordwrapString(
			string_replace_all(dialogueContent, "@", "\n"), 
			DialogueBarContentWidth,
			"\n", 
			1
		) :
		dialogueContent;
	var textLength = string_length(dialogueContentWrapped);
	var textSpeed = 0.25; ///@todo macro
	var textPointer = clamp((string_char_at(dialogueContentWrapped, textPointer) == "\\" ? textPointer + 2 : textPointer + 1) + applyDeltaTime(textSpeed), 0.0, textLength);
	
	setDialogueDisplayContextTextPointer(dialogueDisplayContext, textPointer)
	setDialogueDisplayContextText(dialogueDisplayContext, dialogueContentWrapped)
	setDialogueDisplayContextTextLength(dialogueDisplayContext, textLength);
	#endregion
	
	#region Skip
	if (textPointer < textLength) {
		
		var isAction = (
			(keyboard_check_pressed(vk_space)) || 
			(keyboard_check_pressed(vk_enter)) ||
			(mouse_check_button_pressed(mb_left))
		);
		
		if (isAction) {
			
			setDialogueDisplayContextTextPointer(dialogueDisplayContext, textLength);
			return;
		}
	}
	#endregion
	
	#region Continue
	if ((textPointer >= textLength) &&
		(!isArray(dialogueChoices))) {
		
		var isAction = (
			(keyboard_check_pressed(vk_space)) || 
			(keyboard_check_pressed(vk_enter)) ||
			(mouse_check_button_pressed(mb_left)) || 
			(mouse_check_button_pressed(mb_right))
		);
		
		if (isAction) {
			
			var dialogueNode = fetchDialogueNode(
				getDialogueContextDialogue(dialogueContext), 
				getDialogueContextCurrentNode(dialogueContext)
			);
			if (isEntity(dialogueNode, DialogueNode)) {
								
				var nodeId = getDialogueNodeNextNode(dialogueNode)
				var dialogueEvent = createDialogueEvent(
					DialogueEventType_GOTO_NODE, 
					createArrayMap(
						[ "nodeId" ], 
						[ nodeId ]
					)
				);
				sendDialogueEvent(dialogueEvent);
			}
			return;
		}
	}
	#endregion
	
	#region Choose
	if ((isArray(dialogueChoices)) &&
		(textPointer == textLength)) {
		
		#region Sanitize choicePointer
		var choicePointer = getDialogueDisplayContextChoicePointer(dialogueDisplayContext)
		var choicesLength = getArrayLength(dialogueChoices);
		if (!isNumber(choicePointer)) {
			choicePointer = 0;
			setDialogueDisplayContextChoicePointer(dialogueDisplayContext, choicePointer);
		}
		#endregion
		
		#region Key up
		if ((keyboard_check_pressed(vk_up)) ||
			(keyboard_check_pressed(ord("W"))) ||
			(mouse_wheel_up())) {
		
			var choices = getDialogueDisplayContextChoices(dialogueDisplayContext);
			if (isArray(choices)) {
		
				var choicePointer = getDefaultValue(cast(getDialogueDisplayContextChoicePointer(dialogueDisplayContext), typeOf(Primitive, Integer)), 0);
				
		
				choicePointer = clamp(choicePointer - 1, -1, choicesLength);
				choicePointer = choicePointer < 0 ? choicesLength - 1 : choicePointer;
				setDialogueDisplayContextChoicePointer(dialogueDisplayContext, choicePointer);
				return;
			}
		}
		#endregion
	
			#region Key down
			if ((keyboard_check_pressed(vk_down)) ||
				(keyboard_check_pressed(ord("S"))) ||
				(mouse_wheel_down())) {
		
				var choices = getDialogueDisplayContextChoices(dialogueDisplayContext);
				if (isArray(choices)) {
		
					var choicePointer = getDefaultValue(cast(getDialogueDisplayContextChoicePointer(dialogueDisplayContext), typeOf(Primitive, Integer)), 0);
					var choicesLength = getArrayLength(choices);
		
					choicePointer = clamp(choicePointer + 1, 0, choicesLength);
					choicePointer = choicePointer >= choicesLength ? 0 : choicePointer;
					setDialogueDisplayContextChoicePointer(dialogueDisplayContext, choicePointer);
					return;
				}
			}
			#endregion
		
			#region Mouse click, mouse hover
			var dialogueChoicesWidth = 0;
			var dialogueChoicesHeight = 0;
			var dialogueChoicesLength = getArrayLength(dialogueChoices);
			var dialogueChoicesAvailableHeight = barVerticalPosition - (DialogueBarHeight * 0.2);
		
			for (var index = 0; index < dialogueChoicesLength; index++) {
		
				var dialogueChoice = dialogueChoices[@ index];
				var text = getDialogueChoiceText(dialogueChoice);
				if (stringContains(text, "~")) {
			
					var textPack = splitStringToArray(text, "~");
					if (getArrayLength(textPack) >= 2) {
				
						modifier = 	textPack[0];
						text = string_replace(textPack[1], modifier + "~", "");
					}
				}
		
				dialogueChoicesWidth = max(dialogueChoicesWidth, string_width(text));
				dialogueChoicesHeight = dialogueChoicesHeight + string_height(text);
			}
			dialogueChoicesHeight = clamp(dialogueChoicesHeight, 0, dialogueChoicesAvailableHeight);
	
			var dialogueChoicesXCoord = (GuiWidth / 2.0) - (dialogueChoicesWidth / 2.0);
			var dialogueChoicesYCoord = (GuiHeight - barVerticalPosition) + ((dialogueChoicesAvailableHeight - dialogueChoicesHeight) / 2.0);
			
			var heightAccumulator = 0;
			var mouseAction = mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right);
			if (getMouseGuiY() < (GuiHeight - barVerticalPositionTarget)) {
			
				mouseAction = false;
			}
		
			for (var index = 0; index < dialogueChoicesLength; index++) {
		
				var modifier = null;
				var dialogueChoice = dialogueChoices[@ index];
				var text = getDialogueChoiceText(dialogueChoice);
				if (stringContains(text, "~")) {
			
					var textPack = splitStringToArray(text, "~");
					if (getArrayLength(textPack) >= 2) {
				
						modifier = 	textPack[0];
						text = string_replace(textPack[1], modifier + "~", "");
					}
				}
			
				var textHeight =  string_height(text);
				var mouseGuiX = getMouseGuiX(),
				var mouseGuiY = getMouseGuiY()
				var isCollision = point_in_rectangle(
					mouseGuiX,
					mouseGuiY,
					dialogueChoicesXCoord - 96,
					dialogueChoicesYCoord + heightAccumulator,
					dialogueChoicesXCoord + 96 + dialogueChoicesWidth,
					dialogueChoicesYCoord + heightAccumulator + textHeight,
				);
			
				heightAccumulator = heightAccumulator + textHeight
			
				if (isCollision) {
				
					setDialogueDisplayContextChoicePointer(dialogueDisplayContext, index);
					break;
				}
			}
			#endregion
		
			#region Choose
			var isAction = (
				(keyboard_check_pressed(vk_space)) || 
				(keyboard_check_pressed(vk_enter)) || 
				(mouseAction)
			);
		
			if (isAction) && (isNumber(choicePointer)) {
			
				var dialogueEvent = createDialogueEvent(DialogueEventType_CHOOSE, createArrayMap(
					[ "choicePointer" ], [ choicePointer ]
				));
				sendDialogueEvent(dialogueEvent);
				return;
			}
			#endregion
		}
		#endregion
		
	var exception = catchException();
}

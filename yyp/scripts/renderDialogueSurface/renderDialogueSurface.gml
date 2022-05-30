///@function renderDialogueSurface(dialogueManager)
///@description Renderer.
///@param {DialogueManager} dialogueManager
function renderDialogueSurface(argument0) {
	
		var dialogueManager = argument0;
		
	#region Validation
		var dialogueDisplayContext = getDialogueDisplayContext();
		if (!isEntity(dialogueDisplayContext, DialogueDisplayContext)) {
		
			return;
		}
	#endregion
	
	#region Fetch {Number} barVerticalPosition, {Number} barVerticalPositionTarget
		var barVerticalPosition = injectInstanceVariable(dialogueManager, "barVerticalPosition", 0.0);
		var barVerticalPositionTarget = injectInstanceVariable(dialogueManager, "barVerticalPositionTarget", DialogueBarHeight);
		var barVerticalPositionFactor = DIALOGUE_BAR_POSITION_TARGET_FACTOR;
		var barVerticalPositionAcceleration = ((barVerticalPositionTarget - barVerticalPosition) / barVerticalPositionFactor);
		barVerticalPosition = lerp(barVerticalPosition, barVerticalPositionTarget, barVerticalPositionFactor);
	
		setInstanceVariable(dialogueManager, "barVerticalPosition", barVerticalPosition);
	
		var endEventDialogueContext = getInstanceVariable(dialogueManager, "endEventDialogueContext");
		var textAlpha = isEntity(endEventDialogueContext, DialogueContext) ? 
			clamp(barVerticalPosition - 32, 0, DialogueBarHeight - 32) / (DialogueBarHeight - 32) :
			clamp(barVerticalPosition - 32, 0, barVerticalPositionTarget - 32) / (barVerticalPositionTarget - 32);
	
	#endregion
		
	#region Render
		draw_set_font(MEAT_FONT_DIALOGUE_TEXT);
	
		var dialogueContentLineHeight = string_height("h");
		var authorLabel = getDialogueDisplayContextAuthor(dialogueDisplayContext)
		var dialogueContent = getDialogueDisplayContextText(dialogueDisplayContext)
		var dialogueContentWidth = string_width(dialogueContent);
		var dialogueContentHeight = string_height(dialogueContent);
		var dialogueContentDisplayWrapped = "";
		var dialogueChoices = getDialogueDisplayContextChoices(dialogueDisplayContext);
		var dialogueChoicesPointer = getDialogueDisplayContextChoicePointer(dialogueDisplayContext);
		var textPointer = getDialogueDisplayContextTextPointer(dialogueDisplayContext);
		var textLength = getDialogueDisplayContextTextLength(dialogueDisplayContext);	
		var player = PlayerContext;
		var npc = DialogueMobContext;
	
	#endregion
	
	#region Render player puppet
		var playerTexture = getInstanceVariable(player, "sprite_index");
		if ((isTexture(playerTexture)) && 
			(!IsTradePanel)) { 
			
			var playerTextureWidth = getTextureWidth(playerTexture);
			var playerTextureHeight = getTextureHeight(playerTexture);
			var playerTextureYOffset = sprite_get_yoffset(playerTexture);
			
			var playerPuppetScale = 4;
			var playerPuppetAlpha = (barVerticalPosition / barVerticalPositionTarget) * (authorLabel == "@Player" ? 1.0 : 0.8);
			var playerPuppetXCoord = (GuiWidth / 4.0);
			var playerPuppetYCoord = (GuiHeight - barVerticalPosition) + ((playerTextureYOffset / 2.0) * playerPuppetScale);
		
			renderTexture(
				playerTexture,
				playerPuppetXCoord,
				playerPuppetYCoord,
				0,
				playerPuppetScale,
				playerPuppetScale,
				playerPuppetAlpha
			);
		}
	#endregion
	
	#region Render npc puppet
		var npcTexture = getInstanceVariable(npc, "sprite_index");
		if ((isTexture(npcTexture)) && 
			(!IsTradePanel)) {			
		
			var npcTextureWidth = getTextureWidth(npcTexture);
			var npcTextureHeight = getTextureHeight(npcTexture);
			var npcTextureYOffset = sprite_get_yoffset(npcTexture);
			
			var npcPuppetScale = 4;
			var npcPuppetAlpha = (barVerticalPosition / barVerticalPositionTarget) * (authorLabel != "@Player" ? 1.0 : 0.8);
			var npcPuppetXCoord = GuiWidth - (GuiWidth / 4.0);
			var npcPuppetYCoord = (GuiHeight - barVerticalPosition) + ((npcTextureYOffset / 2.0) * npcPuppetScale);
			
			repeat(4) {
			
				renderTexture(
					npcTexture,
					npcPuppetXCoord,
					npcPuppetYCoord,
					0,
					npcPuppetScale,
					npcPuppetScale,
					npcPuppetAlpha
				);
			}
		}
	#endregion

	#region Render bars
		var topBarXBegin = 0;
		var topBarYBegin = 0;
		var topBarXEnd = GuiWidth;
		var topBarYEnd = barVerticalPosition;
		draw_rectangle_color(
			topBarXBegin,
			topBarYBegin,
			topBarXEnd,
			topBarYEnd,
			c_black,
			c_black,
			c_black,
			c_black,
			false
		);
	
		var bottomBarXBegin = 0;
		var bottomBarYBegin = GuiHeight - barVerticalPosition;
		var bottomBarXEnd = GuiWidth;
		var bottomBarYEnd = GuiHeight;
		draw_rectangle_color(
			bottomBarXBegin,
			bottomBarYBegin,
			bottomBarXEnd,
			bottomBarYEnd,
			c_black,
			c_black,
			c_black,
			c_black,
			false
		);
	#endregion
	
	#region Render @dialogue.display.author
		draw_set_halign(fa_center);
		draw_set_valign(fa_bottom);
		draw_set_font(MEAT_FONT_DIALOGUE_AUTHOR);
	
		var authorLabelXCoord = GuiWidth / 2.0;
		var authorLabelYCoord = DialogueBarAuthorHeight - (barVerticalPositionTarget - barVerticalPosition);
	
		if (!IsTradePanel) {
		
			var npcPrototype = getNpcPrototype(npc);
			var authorTranslation = authorLabel;
			if ((authorTranslation == "@NPC") && 
				(isEntity(npcPrototype, NpcPrototype))) {
		
				authorTranslation = getNpcPrototypeName(npcPrototype);
			}
		
			renderText(authorTranslation == "@Player" ? "Sir Culligan" : authorTranslation, authorLabelXCoord, authorLabelYCoord, c_gray, textAlpha);
		}
	#endregion
	
	#region Render @dialogue.content
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_font(MEAT_FONT_DIALOGUE_TEXT);
	
		var dialogueContentRendered = string_copy(dialogueContent, 0, textPointer);
		var dialogueContentXCoord = (GuiWidth / 2.0) - (dialogueContentWidth / 2.0)
		var dialogueContentYCoord = barVerticalPosition - DialogueBarAuthorHeight - (dialogueContentHeight / 2.0) - (dialogueContentLineHeight / 2.0);
	
		if (!IsTradePanel) {
		
			renderText(dialogueContentRendered, dialogueContentXCoord, dialogueContentYCoord - (dialogueContentHeight / 2.0), c_white, textAlpha);
		}
	
		draw_set_halign(fa_center);
		if ((textPointer >= textLength) &&
			(!isArray(dialogueChoices))) {
		
			var continueLabel = fetchTranslation("dialogue.continue");
			renderText(continueLabel, (GuiWidth / 2.0), barVerticalPosition - dialogueContentLineHeight - (dialogueContentLineHeight / 2.0), c_gray, textAlpha);
		}
	#endregion
	
	#region Render @dialogue.choices
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_font(MEAT_FONT_DIALOGUE_CHOICES);	
	
		if ((isArray(dialogueChoices)) &&
			(!IsTradePanel)) {
	
			if (textPointer >= textLength) {
				
				var dialogueChoicesWidth = 0;
				var dialogueChoicesHeight = 0;
				var dialogueChoicesLength = getArrayLength(dialogueChoices);
				var dialogueChoicesAvailableHeight = barVerticalPosition - (DialogueBarHeight * 0.2);
				for (var index = 0; index < dialogueChoicesLength - 1; index++) {
		
					var dialogueChoice = dialogueChoices[@ index];
					var text = getDialogueChoiceText(dialogueChoice);
					/*
					if (stringContains(text, "~")) {
			
						var textPack = splitStringToArray(text, "~");
						if (getArrayLength(textPack) >= 2) {
				
							modifier = 	textPack[0];
							text = string_replace(textPack[1], modifier + "~", "");
						}
					}
					*/
		
					dialogueChoicesWidth = max(dialogueChoicesWidth, string_width(text));
					dialogueChoicesHeight = dialogueChoicesHeight + string_height(text);
				}
				dialogueChoicesHeight = clamp(dialogueChoicesHeight, 0, dialogueChoicesAvailableHeight);
			
				var dialogueChoicesXCoord = (GuiWidth / 2.0) - (dialogueChoicesWidth / 2.0);
				var dialogueChoicesYCoord = (GuiHeight - barVerticalPosition) + ((dialogueChoicesAvailableHeight - dialogueChoicesHeight) / 2.0);
				var dialogueChoicesLength = getArrayLength(dialogueChoices);
			
			#region Render choicses loop
				var heightAccumulator = 0;
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
			
					var textHeight = string_height(text);
					renderText(
						text,
						dialogueChoicesXCoord,
						dialogueChoicesYCoord + heightAccumulator,
						modifier == "!" ? c_orange : (index == dialogueChoicesPointer ? c_yellow : c_white),
						textAlpha
					);
		
					var textHeight = string_height(text);
					/*
					if (isOptionalPresent(modifier)) {
			
						switch (modifier) {
							case "!":
								renderTexture(
									ide_loggerwriter_icon,
									dialogueChoicesXCoord - getTextureWidth(asset_texture_cross) - 16,
									dialogueChoicesYCoord + heightAccumulator
								)
								break;
							case "#":
								renderTexture(
									ide_controller_interface_icon,
									dialogueChoicesXCoord - getTextureWidth(asset_texture_cross) - 16,
									dialogueChoicesYCoord + heightAccumulator
								)
								break;
						}
					}
					*/
					
					if (getDialogueDisplayContextChoicePointer(dialogueDisplayContext) == index) {
						
						renderTexture(
							asset_texture_beaver_corpse_02,
							dialogueChoicesXCoord - getTextureWidth(asset_texture_cross) - 32,
							dialogueChoicesYCoord + heightAccumulator + (textHeight / 2.0)
						);	
					}
					
					heightAccumulator = heightAccumulator + textHeight;
				}
			#endregion
			}
		}
	#endregion
	



}

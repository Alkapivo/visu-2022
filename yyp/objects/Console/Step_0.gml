///@description Key Events
	
	#macro Key_TILDA 192
	
	var keyTilda = Key_TILDA;
	switch (os_type) {
	
		case os_windows:
		
			keyTilda = Key_TILDA;
			break;
		
		case os_linux:
		
			keyTilda = 50;
			break;
			
		case os_macosx:
		
			keyTilda = 50;
			break;
	}
	
	
	
	if (keyboard_check_pressed(keyTilda)) {
		
		if ((getPropertyBoolean("console.enable", false)) || 
			(isBeaverMode)) {
				
			consoleHeightAcc = isConsoleDisplayed ? 0 : consoleHeightMax;
			isConsoleDisplayed = !isConsoleDisplayed;
			keyboard_string = "";
		} else {
		
			consoleHeightAcc = 0;
			isConsoleDisplayed = false;
		}	
	}
	
	if ((keyboard_check_pressed(ord("B"))) &&
		(!isBeaverModeIntent) &&
		(!isBeaverMode)) {
		
		isBeaverModeIntent = true;
		keyboard_string = ""
	}
	
	if ((isBeaverModeIntent) && 
		(!isConsoleDisplayed) &&
		(string_length(keyboard_string) >= 7)) {
			
		if (keyboard_string == "beaverb") {
		
			isBeaverModeIntent = false;
			isBeaverMode = true;
			var not1 = "      Art by Joan G. Stark       ";
			var not2 = "         _,--\"\"--,_               \n" +
				"     _,,-\"          \             \n" +
				" ,-e\"                ;            \n" +
				"(*             \     |            \n" +
				" \o\     __,-\"  )    |            \n" +
				"  `,_   (((__,-\"     L___,,--,,__ \n" +
				"     ) ,---\  /\    / -- '' -'-' )\n" +
				"   _/ /     )_||   /---,,___  __/ \n" +
				"  \"\"\"\"     \"\"\"\"|_ /         \"\"    \n" +
				"               \"\"\"\"               \n";
			var not4 = "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&\n" +
				"&&&&&@@&&&&&@@@##(//***,*/%&&&&&&&@&&&@&\n" +
				"&&&@&@&&&@/,.....           ,&&&&&&@@@@&\n" +
				"&&&&&&&&*,.                   .&&&&&&&&&\n" +
				"&&&&&&(*.                       %&&&&&&&\n" +
				"&&&&&&/,.                /%%#%*  &&&&&&&\n" +
				"&&&&&&*..   /%%@@@&#.  ./%/*,.,. #%&@@@&\n" +
				"&&&&&&*,  *(((*,%(//..  */,((,     ,@@&@\n" +
				"&&&&&&,*   ,*,((%(#.. ..          */@@@@\n" +
				"&&&&* .,.           .,,  .         *@@@@\n" +
				"&&&&, * ,,.        ./&*(..,       .@@@@@\n" +
				"@&&&&&/. ,,,....    */*,/..**    .&@@@@@\n" +
				"&@&&&&&&#&*,,,,,,,,(*&&,/%@@/ ,   @@@@@@\n" +
				"&@&&&&&&&&&(*,.   ,,*%  ,.(#*.  .@@@@@@&\n" +
				"&&&&&&&&&&&&,  /*,,,,,#%%%%*,  . @@@@@@@\n" +
				"&&@&&&&&&&&&/.  *,/,,  ....  .,  @&@@@@@\n" +
				"&&&&&&&&&&&&&.  .,##%%######%*    @@@@@@\n";
			var not3 = "     BEAVER MODE: ACTIVATED      \n";
			sendNotification(not1, c_white);
			sendNotification(not2, c_red);
			sendNotification(not3, c_white);
		} else {
		
			isBeaverModeIntent = false;
		}
	}
	
	consoleHeight += ((consoleHeightAcc - consoleHeight) / 8);
	consoleHeight = clamp(consoleHeight, 0, consoleHeightMax);

	if (consoleHeight > 0) {
		
		#region PageUp PageDown
		if (keyboard_check_pressed(vk_pageup)) {
			if ((pageOffset < stackSize - 1) && 
				(stack[pageOffset + 1] != null)) {
				pageOffset++;	
			}
		}
		
		if (keyboard_check(vk_pageup)) {
			keyboardPressedTime++;
			if (keyboardPressedTime > (room_speed * 0.75) / getDeltaTimeValue()) {
				keyboardPressedTimeOffset++;
			}
			
			if (keyboardPressedTimeOffset >= 4 / getDeltaTimeValue()) {
				pageOffset++;
				keyboardPressedTimeOffset = 0;
			}
		}
				
		if (keyboard_check_pressed(vk_pagedown)) {
			if (pageOffset > 0) {
				pageOffset--;	
			}
		}
		
		if (keyboard_check(vk_pagedown)) {
			keyboardPressedTime++;
			if (keyboardPressedTime > room_speed) {
				keyboardPressedTimeOffset++;
			}
			
			if (keyboardPressedTimeOffset >= 10) {
				pageOffset--;
				keyboardPressedTimeOffset = 0;
			}
		}
		
		if (keyboard_check_released(vk_pageup)) {
			keyboardPressedTime = 0;	
			keyboardPressedTimeOffset = 0;
		}
		
		if (keyboard_check_released(vk_pagedown)) {
			keyboardPressedTime = 0;	
			keyboardPressedTimeOffset = 0;
		}
		#endregion
		
		if (keyboard_check_pressed(vk_up)) {
			if (commandHistoryPointer != null) {
				if (commandHistoryPointer > 0) {
					commandHistoryPointer--;
				}
				keyboard_string = commandHistory[| commandHistoryPointer];
			} else {
				commandHistoryPointer = getListSize(commandHistory) - 1;
				keyboard_string = commandHistory[| commandHistoryPointer];
			}
		}
		
		if (keyboard_check_pressed(vk_down)) {
			if (commandHistoryPointer != null) {
				if (commandHistoryPointer < getListSize(commandHistory) - 1) {
					commandHistoryPointer++;
					keyboard_string = commandHistory[| commandHistoryPointer];
				}
			}
		}
		
		if (keyboard_check_pressed(vk_left)) {
			var promptLength = string_length(keyboard_string);
			if (promptLength > 0) {
				var promptOffsetLength = string_length(promptOffset);
				promptOffset = string_copy(keyboard_string, promptLength, promptOffsetLength + 1) + promptOffset;
				prompt = string_delete(keyboard_string, promptLength, promptOffsetLength + 1);
			} else {
				promptOffset = "";	
			}
			keyboard_string = prompt;
			prompt = prompt + promptOffset;
		}
		
		if (keyboard_check(vk_left) && !keyboard_check_pressed(vk_left)) {
		
			
			if (timerFinished(keyboardPromptPressedTime)) {
				
				#region Action
				var promptLength = string_length(keyboard_string);
				if (promptLength > 0) {
					var promptOffsetLength = string_length(promptOffset);
					promptOffset = string_copy(keyboard_string, promptLength, promptOffsetLength + 1) + promptOffset;
					prompt = string_delete(keyboard_string, promptLength, promptOffsetLength + 1);
				} else {
					promptOffset = "";	
				}
				keyboard_string = prompt;
				prompt = prompt + promptOffset;
				#endregion
				
			} else {
				
				keyboardPromptPressedTime = incrementTimer(keyboardPromptPressedTime, 0.3);	
			}
		}
				
		if (keyboard_check_pressed(vk_right)) {
			var promptOffsetLength = string_length(promptOffset);
			if (promptOffsetLength > 0) {
				prompt = keyboard_string + string_char_at(promptOffset, 1);
				promptOffset = string_delete(promptOffset, 1, 1);
			} else {
				prompt = "";
				promptOffset = keyboard_string;	
			}
			keyboard_string = prompt;
			prompt = prompt + promptOffset;
		}
		
		if (keyboard_check(vk_right) && !keyboard_check_pressed(vk_right)) {
		
			
			if (timerFinished(keyboardPromptPressedTime)) {
				
				#region Action
				var promptOffsetLength = string_length(promptOffset);
				if (promptOffsetLength > 0) {
					prompt = keyboard_string + string_char_at(promptOffset, 1);
					promptOffset = string_delete(promptOffset, 1, 1);
				} else {
					prompt = "";
					promptOffset = keyboard_string;	
				}
				keyboard_string = prompt;
				prompt = prompt + promptOffset;
				#endregion
				
			} else {
				
				keyboardPromptPressedTime = incrementTimer(keyboardPromptPressedTime, 0.3);	
			}
		}
		
		if ((!keyboard_check(vk_left)) && 
			(!keyboard_check(vk_right))) {
			
			keyboardPromptPressedTime = 0.01;
		}
		
		#region Hint
		if (keyboard_check_pressed(vk_tab)) {
			tabPressCounter++;
			var query = keyboard_string + promptOffset;
			var commandFoundIndex = 0;
			var commandFound = false;
			
			if (!stringContains(query, " ")) {
				for (var command = mapFirst(global.consoleCommands); iteratorFinish(command); command = mapNext(global.consoleCommands, command)) {
				
					if (commandFound) {
						break;	
					}
				
					if (tabPressCounter > 1) {
						query = tabCommandHistory + promptOffset;
					}
				
					if (string_pos(query, command) == 1) {
						commandFoundIndex++
						if (commandFoundIndex == tabPressCounter) {
						
							if (tabCommandHistory == "") {
								tabCommandHistory = keyboard_string;
							}
						
							commandFound = true;
							keyboard_string = command;
							promptOffset = "";
						}
					}
				}		
			}
			
			if (!commandFound) {
				//keyboard_string = tabCommandHistory;
				tabPressCounter = 0;
				tabCommandHistory = "";
			}
		}
		#endregion
		
		if (keyboard_check_pressed(vk_enter)) {
			prompt = keyboard_string + promptOffset;
			
			pushStack(commandPipeline, prompt);
			addToList(commandHistory, prompt);
			
			#region CommandHistory clean up
			commandHistoryPointer = null;
			if (getListSize(commandHistory) > commandHistoryMaxLength) {
				var tempCommandHistory = cloneList(commandHistory);
				clearList(commandHistory);
				for (var index = commandHistoryMaxLength / 2; index < commandHistoryMaxLength; index++) {
					addToList(commandHistory, tempCommandHistory[| index]);
				}
				destroyList(tempCommandHistory);
			}
			#endregion
			
			keyboard_string = "";
			prompt = "";
			promptOffset = "";
			tabPressCounter = 0;
			tabCommandHistory = "";
		}
		
		if (keyboard_check(vk_backspace)) {
			tabPressCounter = 0;
			tabCommandHistory = "";	
		}
		
		if ((keyboard_check(vk_control)) && 
			(keyboard_check_pressed(ord("V")))) {
		
			if (clipboard_has_text()) {
				prompt = appendToString(prompt, clipboard_get_text());
				keyboard_string = prompt;
			}
		}
		
		#region Dispatch command
		var commandPipelineSize = getStackSize(commandPipeline);
		if (commandPipelineSize != 0) {
			repeat(commandPipelineSize) {
				var command = popStack(commandPipeline);
				addLogToConsoleStack(id, ">" + command);
								
				var parsedCommand = splitStringToArray(command, " ");
				var parsedCommandLength = getArrayLength(parsedCommand);
				if (parsedCommandLength > 0) {
					if (parsedCommandLength > 1) {
						var commandParameters = createArray(parsedCommandLength - 1, "");
						array_copy(commandParameters, 0, parsedCommand, 1, parsedCommandLength - 1);
						dispatchConsoleCommand(createConsoleCommand(parsedCommand[0], commandParameters));
					} else {
						if (parsedCommand[0] != "") {
							dispatchConsoleCommand(createConsoleCommand(parsedCommand[0], []));	
						}
					}	
				}
			}
		}
		#endregion
	}
	
	if (!isCommandHistoryLoaded) {
		var settingsRepository = getSettingsRepository();
		if (settingsRepository != null) {
			var settings = findInRepositoryById(getSettingsRepository(), "console");
			if (settings != null) {
				var attributes = getSettingsAttributes(settings);
				if (attributes != null) {
					var serializedCommandHistory = attributes[? "commandHistory"];
					if (serializedCommandHistory != null) {
						ds_list_read(commandHistory, serializedCommandHistory);
					}
				}
			}
		}
		isCommandHistoryLoaded = true;
	}
	

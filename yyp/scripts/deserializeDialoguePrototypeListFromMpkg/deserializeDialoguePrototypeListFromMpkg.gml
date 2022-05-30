///@function deserializeDialoguePrototypeListFromMpkg(dialoguePrototypesListString)
///@description Inline deserialize DialoguePrototype[] from json.
///@param {String} dialoguePrototypesListString
///@return {Optional<DialoguePrototype[]>} dialoguePrototypes
function deserializeDialoguePrototypeListFromMpkg(argument0) {

		var dialoguePrototypesListString = argument0;
	
		clearException();

		var dialoguePrototypes = createEmptyOptional();
		var jsonObject = json_decode(dialoguePrototypesListString);
	#region @tryCatch
		if (!isDataStructure(jsonObject, Map)) {
		
			throwException(
				createException(
					ParseException,
					"Unable to deserialize MpkgJsonString"
				)
			);
		
			return dialoguePrototypes;
		}
	#endregion
	
		var dialoguePrototypesList = jsonObject[? "dialoguePrototypes"];
	#region @tryCatch
		if (!isDataStructure(dialoguePrototypesList, List)) {
		
			throwException(
				createException(
					ParseException,
					"Unable to deserialize MpkgJsonString - \"dialoguePrototypes\" weren't found."
				)
			);
		
			return dialoguePrototypes;
		}
	#endregion
	
		var dialoguePrototypesListSize = getListSize(dialoguePrototypesList);
		dialoguePrototypes = createArray(dialoguePrototypesListSize, null);
		for (var index = 0; index < dialoguePrototypesListSize; index++) {
	
			var dialoguePrototypeMap = dialoguePrototypesList[| index];
		#region @tryCatch
			if (!isDataStructure(dialoguePrototypeMap, Map)) {
			
				throwException(
					createException(
						ParseException,
						stringParams("Unable to deserialize DialoguePrototype at index {0}", index)
					)
				);
			
				return createEmptyOptional();
			}
		#endregion
		
			var name = dialoguePrototypeMap[? "name"];
		#region @tryCatch
			if (!isString(name)) {
				throwException(
					createException(
						ParseException,
						stringParams("Unable to deserialize DialoguePrototype -> name at index {0}", index)
					)
				);
			
				return createEmptyOptional();	
			}
		#endregion
		
			var dialoguesLangPackMap = dialoguePrototypeMap[? "dialoguesLangPack"];
		#region @tryCatch
			if (!isDataStructure(dialoguePrototypeMap, Map)) {
			
				throwException(
					createException(
						ParseException,
						stringParams("Unable to deserialize DialoguePrototype -> dialoguesLangPack at index {0}", index)
					)
				);
			
				return createEmptyOptional();
			}
		#endregion
		
		#region Map<String::Dialogue>
			var dialoguesLangPack = createMap();
			for (var langCode = mapFirst(dialoguesLangPackMap);
				 iteratorFinish(langCode);
				 langCode = mapNext(dialoguesLangPackMap, langCode)) {
		
				var dialoguesLangPackRaw = dialoguesLangPackMap[? langCode];
			#region @tryCatch
				if (!isDataStructure(dialoguesLangPackRaw, Map)) {
				
					throwException(
						createException(
							ParseException,
							stringParams("Unable to deserialize DialoguePrototype -> dialoguesLangPack for code {0}", langCode)
						)
					);
			
					return createEmptyOptional();
				}
			#endregion
			
				var dialogueName = dialoguesLangPackRaw[? "name"];
				var startNode = dialoguesLangPackRaw[? "startNode"];
				var nodes = dialoguesLangPackRaw[? "nodes"];
			#region @tryCatch
				if (!isDataStructure(nodes, Map)) {
					throwException(
						createException(
							ParseException,
							stringParams("Unable to deserialize DialoguePrototype nodes -> dialoguesLangPack for code {0}", langCode)
						)
					);
			
					return createEmptyOptional();
				}
			#endregion
			
			#region Dialogue
				var dialogueNodes = createMap();
				for (var nodeId = mapFirst(nodes);
					 iteratorFinish(nodeId);
					 nodeId = mapNext(nodes, nodeId)) {
					 
					var node = nodes[? nodeId];
				#region @tryCatch
					if (!isDataStructure(node, Map)) {
						throwException(
							createException(
								ParseException,
								stringParams("Unable to deserialize DialoguePrototype nodes -> dialoguesLangPack for code {0}", langCode)
							)
						);
			
						return createEmptyOptional();
					}
				#endregion
				
					var author = node[? "author"];
					var nextNode = node[? "nextNode"];
					var text = node[? "text"];
					var action = node[? "action"];
				#region DialogueChoices
					var choices = node[? "choices"];
					var choicesArray = createEmptyOptional();
					if (isDataStructure(choices, List)) {
				
						choicesArray = createArray(getListSize(choices), null);
						for (var choicesListIndex = 0; choicesListIndex < getListSize(choices); choicesListIndex++) {
					
							var choice = choices[| choicesListIndex];
						#region @tryCatch
							if (!isDataStructure(choice, Map)) {
						
								throwException(
									createException(
										ParseException,
										stringParams("Unable to deserialize DialoguePrototype chocie -> dialoguesLangPack for code {0}", langCode)
									)
								);
			
								return createEmptyOptional();
							}
						#endregion
						
							var choiceNextNode = choice[? "nextNode"];
							var choiceText = choice[? "text"];
							var conditionData = choice[? "conditionData"];
							var dialogueChoice = createDialogueChoice(choiceNextNode, choiceText, conditionData);
							choicesArray[@ choicesListIndex] = dialogueChoice;
						}
					}
				#endregion
				
				#region DialogueBranches
					var branches = node[? "branches"];
					var dialogueBranches = createEmptyOptional();
					if (isDataStructure(branches, Map)) {
						
						dialogueBranches = cloneMap(branches);
					}
				#endregion
				
				#region Possibilities
					var possibilities = node[? "possibilities"];
				#endregion
				
				#region Chances
					var chance_1 = node[? "chance_1"];
					var chance_2 = node[? "chance_2"];
				#endregion
				
				#region Title
					var title = node[? "title"];
				#endregion
				
					var dialogueNode = createDialogueNode(author, nextNode, text, action, choicesArray, dialogueBranches, possibilities, chance_1, chance_2, title);
				#region @tryCatch
					if (isOptionalPresent(catchException())) {
					
						throwException(
							createException(
								ParseException,
								stringParams("Unable to deserialize DialogueNode chocie -> dialoguesLangPack for code {0} at index {1}", langCode, index)
							)
						);
					
						return createEmptyOptional();
					}
				#endregion
				
					addToMap(dialogueNodes, nodeId, dialogueNode);
				}
			
				var dialogue = createDialogue(dialogueName, startNode, dialogueNodes);
			#region @tryCatch
				if (!isEntity(dialogue, Dialogue)) {
					throwException(
						createException(
							ParseException,
							stringParams("Unable to deserialize DialoguePrototype Entity -> dialoguesLangPack for code {0}", langCode)
						)
					);
			
					return createEmptyOptional();
				}
			#endregion
			#endregion
			
				addToMap(dialoguesLangPack, langCode, dialogue);
			}
		#endregion
		
			var dialoguePrototype = createDialoguePrototype(name, dialoguesLangPack);
		#region @tryCatch
			if (isOptionalPresent(catchException())) {
				throwException(
					createException(
						ParseException,
						stringParams("Unable to deserialize DialoguePrototype at index {0}", index)
					)
				);
			
				return createEmptyOptional();
			}
		#endregion
				
			dialoguePrototypes[@ index] = dialoguePrototype;
		}
	
		destroyDataStructure(jsonObject, Map); 
	
		return dialoguePrototypes;
	



}

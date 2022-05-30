///@function dialogueActionPlayCutscene(data)
///@description Handler.
///@param {Map<String::Object>} data
///@return {Booolean} result
function dialogueActionPlayCutscene(argument0) {

		var data = argument0;
	
		var result = true;
	
		var cutsceneId = getFromMap(data, "cutscene");

		var cutsceneContext = getFromMap(CutsceneDictionary, cutsceneId);
		cutsceneContext = cloneEntity(cutsceneContext);
		if (isEntity(cutsceneContext, CutsceneContext)) {

			var uiManager = getCutsceneUiManager();
			var cutscenePanel = spawnUiPanel(uiManager, CutscenePanel);
			var newCutsceneContext = cloneEntity(cutsceneContext);
			setCutsceneContextEndHandler(
				newCutsceneContext,
				createMethodIntent(
					cutscenePanelContinueDialogueEvent,
					cutscenePanel,
					createEmptyOptional(),
					createEmptyOptional(),
					"cutscenePanelContinueDialogueEvent"
				)
			);
		
			setInstanceVariable(cutscenePanel, FieldCutscenePanel_cutsceneContext, newCutsceneContext);
		
			addUiPanelToUiManager(uiManager, cutscenePanel);
		}
	
		return result;
	



}

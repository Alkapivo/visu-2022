///@function destroyDialoguePrototype(dialoguePrototype)
///@description Destroy DialoguePrototype entity.
///@param {DialoguePrototype} dialoguePrototype
///@throws {Exception}
///@generated {2021-05-01T23:43:38.321Z}

function destroyDialoguePrototype(dialoguePrototype) {


	
	var name = getDialoguePrototypeName(dialoguePrototype);
	var dialoguesLangPack = getDialoguePrototypeDialoguesLangPack(dialoguePrototype);
	
	for (var key = mapFirst(dialoguesLangPack); iteratorFinish(key); key = mapNext(dialoguesLangPack, key)) {
		var entity = dialoguesLangPack[? key];
		destroyDialogue(entity);
	}
	destroyDataStructure(dialoguesLangPack, Map, "Unable to destroy Map dialoguesLangPack in DialoguePrototype");
	setDialoguePrototypeDialoguesLangPack(dialoguePrototype, null);
	

	
}

///@function createDialoguePrototype(name, dialoguesLangPack)
///@description Constructor for DialoguePrototype entity.
///@param {String} name
///@param {Map<String::Dialogue>} dialoguesLangPack
///@return {DialoguePrototype} dialoguePrototype 
///@throws {Exception}
///@generated {2021-05-01T23:49:39.629Z}

function createDialoguePrototype(name, dialoguesLangPack) {

	var dialoguePrototype = createEntity(DialoguePrototype);

	setDialoguePrototypeName(dialoguePrototype, assertNoOptional(name));
	setDialoguePrototypeDialoguesLangPack(dialoguePrototype, assertNoOptional(dialoguesLangPack));

	return dialoguePrototype;
	
}

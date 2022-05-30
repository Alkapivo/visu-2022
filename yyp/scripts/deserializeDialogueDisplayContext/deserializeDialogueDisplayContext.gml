///@function deserializeDialogueDisplayContext(jsonString)
///@description Deserialize DialogueDisplayContext from JSON String to DialogueDisplayContext entity.
///@param {String} jsonString
///@return {DialogueDisplayContext} dialogueDisplayContext 
///@throws {Exception}
///@generated {2021-05-01T23:43:38.242Z}

function deserializeDialogueDisplayContext(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var author = getJsonObjectFieldValue(jsonObject, "author");
	var text = assertNoOptional(getJsonObjectFieldValue(jsonObject, "text"));
	var textLength = assertNoOptional(getJsonObjectFieldValue(jsonObject, "textLength"));
	var textPointer = assertNoOptional(getJsonObjectFieldValue(jsonObject, "textPointer"));
	var choices = getJsonObjectFieldValue(jsonObject, "choices", Array);
	var choicePointer = getJsonObjectFieldValue(jsonObject, "choicePointer");

	destroyJsonObject(jsonObject);
	
	return createDialogueDisplayContext(author, text, textLength, textPointer, choices, choicePointer);
	
}

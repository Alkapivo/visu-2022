///@function deserializeDialogueNode(jsonString)
///@description Deserialize DialogueNode from JSON String to DialogueNode entity.
///@param {String} jsonString
///@return {DialogueNode} dialogueNode 
///@throws {Exception}
///@generated {2021-05-01T23:43:37.920Z}

function deserializeDialogueNode(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var author = getJsonObjectFieldValue(jsonObject, "author");
	var nextNode = getJsonObjectFieldValue(jsonObject, "nextNode");
	var text = getJsonObjectFieldValue(jsonObject, "text");
	var action = getJsonObjectFieldValue(jsonObject, "action");
	var choices = getJsonObjectFieldValue(jsonObject, "choices", Array, "DialogueChoice");
	var branches = getJsonObjectFieldValue(jsonObject, "branches", Map);
	var possibilities = getJsonObjectFieldValue(jsonObject, "possibilities");
	var chance_1 = getJsonObjectFieldValue(jsonObject, "chance_1");
	var chance_2 = getJsonObjectFieldValue(jsonObject, "chance_2");
	var title = getJsonObjectFieldValue(jsonObject, "title");

	destroyJsonObject(jsonObject);
	
	return createDialogueNode(author, nextNode, text, action, choices, branches, possibilities, chance_1, chance_2, title);
	
}

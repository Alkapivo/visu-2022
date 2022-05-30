///@function deserializeDialogue(jsonString)
///@description Deserialize Dialogue from JSON String to Dialogue entity.
///@param {String} jsonString
///@return {Dialogue} dialogue 
///@throws {Exception}
///@generated {2021-05-01T23:43:37.870Z}

function deserializeDialogue(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var name = assertNoOptional(getJsonObjectFieldValue(jsonObject, "name"));
	var startNode = assertNoOptional(getJsonObjectFieldValue(jsonObject, "startNode"));
	var nodes = assertNoOptional(getJsonObjectFieldValue(jsonObject, "nodes", Map, "DialogueNode"));

	destroyJsonObject(jsonObject);
	
	return createDialogue(name, startNode, nodes);
	
}

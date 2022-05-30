///@function deserializeButton(jsonString)
///@description Deserialize Button from JSON String to Button entity.
///@param {String} jsonString
///@return {Button} button 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.590Z}

function deserializeButton(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var label = assertNoOptional(getJsonObjectFieldValue(jsonObject, "label"));
	var data = assertNoOptional(getJsonObjectFieldValue(jsonObject, "data", Map));
	var texture = assertNoOptional(getJsonObjectFieldValue(jsonObject, "texture"));
	var position = assertNoOptional(getJsonObjectFieldValue(jsonObject, "position", Entity, "Rectangle"));
	var onClick = getJsonObjectFieldValue(jsonObject, "onClick");
	var onHover = getJsonObjectFieldValue(jsonObject, "onHover");

	destroyJsonObject(jsonObject);
	
	return createButton(label, data, texture, position, onClick, onHover);
	
}

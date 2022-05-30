///@function serializeButton(button)
///@description Serialize Button to JSON string.
///@param {Button} button
///@return {String} buttonJsonString 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.590Z}

function serializeButton(button) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"label",
		getButtonLabel(button));	
	appendFieldToJsonObject(
		jsonObject,
		"data",
		getButtonData(button),
		Map);
	
	appendFieldToJsonObject(
		jsonObject,
		"texture",
		getButtonTexture(button));	
	appendEntityToJsonObject(
		jsonObject,
		"position",
		getButtonPosition(button),
		"Rectangle");
	
	if (isOptionalPresent(getButtonOnClick(button))) {
		appendFieldToJsonObject(
			jsonObject,
			"onClick",
			getButtonOnClick(button));
	}
	
	if (isOptionalPresent(getButtonOnHover(button))) {
		appendFieldToJsonObject(
			jsonObject,
			"onHover",
			getButtonOnHover(button));
	}
	

	var buttonJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return buttonJsonString;
	
}

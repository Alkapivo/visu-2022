///@description Button entity

///@function createButton(label, data, texture, position, onClick, onHover)
///@description Constructor for Button entity.
///@param {String} label
///@param {Map<String::any>} data
///@param {AssetTexture} texture
///@param {Rectangle} position
///@param {Optional<AssetScript>} onClick
///@param {Optional<AssetScript>} onHover
///@return {Button} button 
///@throws {Exception}
///@generated {2021-05-01T23:49:41.450Z}

function createButton(label, data, texture, position, onClick, onHover) {

	var button = createEntity(Button);

	setButtonLabel(button, assertNoOptional(label));
	setButtonData(button, assertNoOptional(data));
	setButtonTexture(button, assertNoOptional(texture));
	setButtonPosition(button, assertNoOptional(position));
	setButtonOnClick(button, onClick);
	setButtonOnHover(button, onHover);

	return button;
	
}
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
///@function destroyButton(button)
///@description Destroy Button entity.
///@param {Button} button
///@throws {Exception}
///@generated {2021-05-01T23:43:42.590Z}

function destroyButton(button) {


	
	var label = getButtonLabel(button);
	var data = getButtonData(button);
	var texture = getButtonTexture(button);
	var position = getButtonPosition(button);
	var onClick = getButtonOnClick(button);
	var onHover = getButtonOnHover(button);
	
	destroyDataStructure(data, Map, "Unable to destroy Map data in Button");
	setButtonData(button, null);
	
	destroyRectangle(position);
	setButtonPosition(button, null);
	

	
}
///@function getButtonData(button)
///@description Getter.
///@param {Button} button
///@return {Map<String::any>} data 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.590Z}

function getButtonData(button) {

	return button[@ 1];
	
}
///@function getButtonLabel(button)
///@description Getter.
///@param {Button} button
///@return {String} label 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.590Z}

function getButtonLabel(button) {

	return button[@ 0];
	
}
///@function getButtonOnClick(button)
///@description Getter.
///@param {Button} button
///@return {Optional<AssetScript>} onClick 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.590Z}

function getButtonOnClick(button) {

	return button[@ 4];
	
}
///@function getButtonOnHover(button)
///@description Getter.
///@param {Button} button
///@return {Optional<AssetScript>} onHover 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.590Z}

function getButtonOnHover(button) {

	return button[@ 5];
	
}
///@function getButtonPosition(button)
///@description Getter.
///@param {Button} button
///@return {Rectangle} position 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.590Z}

function getButtonPosition(button) {

	return button[@ 3];
	
}
///@function getButtonTexture(button)
///@description Getter.
///@param {Button} button
///@return {AssetTexture} texture 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.590Z}

function getButtonTexture(button) {

	return button[@ 2];
	
}
///@function setButtonData(button, data)
///@description Setter.
///@param {Button} button
///@param {Map<String::any>} data
///@throws {Exception}
///@generated {2021-05-01T23:49:41.450Z}

function setButtonData(button, data) {

	button[@ 1] = data;
	
}
///@function setButtonLabel(button, label)
///@description Setter.
///@param {Button} button
///@param {String} label
///@throws {Exception}
///@generated {2021-05-01T23:49:41.450Z}

function setButtonLabel(button, label) {

	button[@ 0] = label;
	
}
///@function setButtonOnClick(button, onClick)
///@description Setter.
///@param {Button} button
///@param {Optional<AssetScript>} onClick
///@throws {Exception}
///@generated {2021-05-01T23:49:41.450Z}

function setButtonOnClick(button, onClick) {

	button[@ 4] = onClick;
	
}
///@function setButtonOnHover(button, onHover)
///@description Setter.
///@param {Button} button
///@param {Optional<AssetScript>} onHover
///@throws {Exception}
///@generated {2021-05-01T23:49:41.450Z}

function setButtonOnHover(button, onHover) {

	button[@ 5] = onHover;
	
}
///@function setButtonPosition(button, position)
///@description Setter.
///@param {Button} button
///@param {Rectangle} position
///@throws {Exception}
///@generated {2021-05-01T23:49:41.450Z}

function setButtonPosition(button, position) {

	button[@ 3] = position;
	
}
///@function setButtonTexture(button, texture)
///@description Setter.
///@param {Button} button
///@param {AssetTexture} texture
///@throws {Exception}
///@generated {2021-05-01T23:49:41.450Z}

function setButtonTexture(button, texture) {

	button[@ 2] = texture;
	
}

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

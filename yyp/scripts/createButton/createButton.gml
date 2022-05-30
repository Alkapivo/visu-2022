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

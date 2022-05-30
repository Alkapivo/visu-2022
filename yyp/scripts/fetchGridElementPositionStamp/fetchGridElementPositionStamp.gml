///@function fetchGridElementPositionStamp(instance)
///@description Convert two dimensional position into one number.
///@param {GridElement} gridElement
///@return {Number} positionStamp
function fetchGridElementPositionStamp(argument0) {

		var gridElement = argument0;
		var sprite = getGridElementSprite(gridElement);
		var spriteIndex = getSpriteAssetIndex(sprite);
		var spriteWidth = getSpriteAssetWidth(spriteIndex);
		var spriteHeight = getSpriteAssetHeight(spriteIndex);
		var spriteXOffset = sprite_get_xoffset(spriteIndex);
		var spriteYOffset = sprite_get_yoffset(spriteIndex);
		var position = getGridElementPosition(gridElement);
	
		var pixelXPosition = (global.guiWidth * getPositionHorizontal(position)) - spriteXOffset + spriteWidth
		var pixelYPosition = (global.guiHeight * getPositionVertical(position)) - spriteYOffset + spriteHeight;
		var positionStamp = pixelXPosition + global.guiWidth * pixelYPosition;
	
		return positionStamp;
	



}

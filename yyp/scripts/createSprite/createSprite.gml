///@function createSprite(assetIndex, currentFrame, xScale, yScale, alpha, angle, color)
///@description Constructor for Sprite entity.
///@param {AssetSprite} assetIndex
///@param {Number} currentFrame
///@param {Number} xScale
///@param {Number} yScale
///@param {Number} alpha
///@param {Number} angle
///@param {GMColor} color
///@return {Sprite} sprite 
///@throws {Exception}
///@generated {2020-12-03T01:55:40.813Z}
function createSprite(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {

		var assetIndex = argument0;
		var currentFrame = argument1;
		var xScale = argument2;
		var yScale = argument3;
		var alpha = argument4;
		var angle = argument5;
		var color = argument6;
	
		var sprite = createEntity(Sprite);

		setSpriteAssetIndex(sprite, assertNoOptional(assetIndex));
		setSpriteCurrentFrame(sprite, assertNoOptional(currentFrame));
		setSpriteXScale(sprite, assertNoOptional(xScale));
		setSpriteYScale(sprite, assertNoOptional(yScale));
		setSpriteAlpha(sprite, assertNoOptional(alpha));
		setSpriteAngle(sprite, assertNoOptional(angle));
		setSpriteColor(sprite, assertNoOptional(color));

		return sprite;
	



}

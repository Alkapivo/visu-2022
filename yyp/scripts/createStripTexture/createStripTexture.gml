///@function createStripTexture(asset, type, frames, animationSpeed)
///@description Constructor for StripTexture entity.
///@param {AssetSprite} asset
///@param {StripTextureType} type
///@param {Integer} frames
///@param {Number} animationSpeed
///@return {StripTexture} stripTexture 
///@throws {Exception}
///@generated {2020-12-03T01:55:40.961Z}
function createStripTexture(argument0, argument1, argument2, argument3) {

		var asset = argument0;
		var type = argument1;
		var frames = argument2;
		var animationSpeed = argument3;
	
		var stripTexture = createEntity(StripTexture);

		setStripTextureAsset(stripTexture, assertNoOptional(asset));
		setStripTextureType(stripTexture, assertNoOptional(type));
		setStripTextureFrames(stripTexture, assertNoOptional(frames));
		setStripTextureAnimationSpeed(stripTexture, assertNoOptional(animationSpeed));

		return stripTexture;
	



}

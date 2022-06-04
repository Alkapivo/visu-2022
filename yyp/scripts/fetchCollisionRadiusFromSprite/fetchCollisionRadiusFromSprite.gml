///@function fetchCollisionRadiusFromSprite(sprite)
///@description Get normalized circle radius from sprite.
///@param {Sprite} sprite
function fetchCollisionRadiusFromSprite(argument0) {

		var sprite = argument0;
	
		var spriteAsset = getSpriteAssetIndex(sprite);
		var dimension = getSpriteAssetWidth(spriteAsset);//min(getSpriteAssetWidth(spriteAsset), getSpriteAssetHeight(spriteAsset));
	
	#region hackYeah @visu Tutaj mozesz sie pobawic z hakami na kolizje ;)
		var zeroCollision = arrayContain(
			[],
			spriteAsset
		);
	
		if (zeroCollision) {
			dimension = 0;
		}
	#endregion
		
		return (dimension / BASE_SCALE_RESOLUTION) * 0.33;
	



}

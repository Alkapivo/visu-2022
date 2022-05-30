///@function setTextureSpeed(texture, textureSpeed, speedType)
///@description Setter. If textureSpeed wasn't provided then it will be calculated from GMAsset<Texture>.
///@future {GMAsset<Texture>} texture
///@param {AssetTexture>} texture
///@param {Number} [textureSpeed=texture.AssetTextureSpeedType]
///@param {Optional<AssetTextureSpeedType>} [speedType=spritespeed_framespersecond]
function setTextureSpeed() {
		
		///checkArgumentCount(1, argument_count, setTextureSpeed);
			
		var texture = argument[0];
		var textureSpeed = argument_count > 1 ? argument[1] : createEmptyOptional();
		var speedType = argument_count > 2 ? argument[2] : createEmptyOptional();
			
		if (!isTexture(texture)) {
			
			return;
		}
			
		if (!isNumber(textureSpeed)) {
				
			sprite_set_speed(
				texture, 
				sprite_get_speed(texture), 
				sprite_get_speed_type(texture)
			);
				
		} else {
				
			sprite_set_speed(
				texture, 
				textureSpeed,
				speedType == spritespeed_framespergameframe ? 
					speedType : 
					spritespeed_framespersecond
			);
		}
		
		


}

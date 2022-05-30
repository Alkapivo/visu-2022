///@function addResource(name, assetType, assetIndex)
///@description Add resource to ResourceManager
///@param {String} name
///@param {AssetType} assetType
///@param {Integer} assetIndex
function addResource(argument0, argument1, argument2) {

		var name = argument0;
		var assetType = argument1;
		var assetIndex = argument2;
		var resourceManager = getResourceManager();
		switch (assetType) {
			case AssetTexture:
				if (!mapContains(resourceManager.sprites, name)) {
					resourceManager.sprites[? name] = assetIndex;
				} else {
					logger("Sprite asset {0} already added (type: {1})", LogType.ERROR, name, assetType);
					sprite_delete(assetIndex);
				}
				break;
			case AssetSound:
				if (!mapContains(resourceManager.sprites, name)) {
					resourceManager.sounds[? name] = assetIndex;
				} else {
					logger("Audio asset {0} already added (type: {1})", LogType.ERROR, name, assetType);
					audio_destroy_stream(assetIndex);
				}
				break;
			default:
				logger("Cannot add asset {0}. Unsupported asset type (raw: {1})", LogType.ERROR, name, assetType);
				break;
		}



}

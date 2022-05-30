///@function getSpriteIndex(assetName)
///@description Getter
///@param {String} assetName
///@return {Optional<AssetTexture>} assetIndex
function getSpriteIndex(argument0) {

		var assetName = argument0;
	
		var assetIndex = asset_get_index(assetName);
		if (assetIndex == -1) {
			var resourceManager = getResourceManager();
			assetIndex = resourceManager.sprites[? assetName];
		}
	
		return assetIndex;
	



}

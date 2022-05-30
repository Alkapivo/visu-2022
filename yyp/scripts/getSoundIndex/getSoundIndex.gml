///@function getSoundIndex(assetName)
///@description Getter
///@param {String} assetName
///@return {Optional<AssetSound>} assetIndex
function getSoundIndex(argument0) {

		var assetName = argument0;
	
		var assetIndex = asset_get_index(assetName);
		if (assetIndex == -1) {
			var resourceManager = getResourceManager()
			assetIndex = resourceManager.sounds[? assetName];
		}
	
		return assetIndex;
	



}

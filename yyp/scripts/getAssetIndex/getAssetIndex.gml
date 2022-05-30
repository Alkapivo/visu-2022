///@function getAssetIndex(assetName, assetType, [defaultAsset])
///@description Get safely asset. Wrapper for isAsset
///@param {String} assetName
///@param {AssetType} assetType
///@param {Asset} [defaultAsset] default value is empty optional.
///@return {Optional<Asset>} assetIndex
///@gameMakerBug
function getAssetIndex() {

		if (argument_count < 2) {
			logger("getAssetIndex must have at least 2 arguments provided", LogType.ERROR);
			return undefined;
		}
	
		var assetName = argument[0];
		var assetType = argument[1];
	
	#region @gameMakerBug
		/**
			@gameMakerBug
			Description of the bug can be found in isAsset() script.
		 */
		if (isAsset(assetName, assetType)) {
			if (isHtml5() && assetType == AssetShader) {
				
				logger(stringParams("8===  {0} ===D", assetName), LogType.INFO);
				return getShader(assetName);
			}
			if (assetType == AssetTexture) {
				return getSpriteIndex(assetName);
			}
			if (assetType == AssetSound) {
				return getSoundIndex(assetName);	
			}
			return asset_get_index(assetName);	
		} else {
			return argument_count > 2 ? argument[2] : createEmptyOptional();	
		}
	#endregion

	


}

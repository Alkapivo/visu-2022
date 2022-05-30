///@function isAsset(assetName, assetType)
///@description Validate if asset with passed name and type exist. Wrapper for asset_get_index, asset_get_type
///@param {String} assetName
///@param {AssetType} assetType
///@return {Boolean} isAsset
///@gameMakerBug
function isAsset(argument0, argument1) {

		var assetName = string(argument0);
		var assetType = argument1;
	
	#region @gameMakerBug
		/**
			@gameMakerBug
			Common:
				- tilesets are recognized as type 4 but should be recognized as type 9
			Html5:
				- scripts are recognized as type -1 but should be recognized as type 6
				- shaders are not recognized at all
		*/
		assetType = assetType == 9 ? 4 : assetType;
	
		if (isHtml5()) {
			assetType = assetType == 6 ? -1 : assetType;
			if (assetType = AssetShader) {
				var shader = getShader(assetName);	
				if (shader != null) {
					return true;	
				} else {
					var found = false;
					switch (assetType) {
						case AssetTexture:
							found = getSpriteIndex(assetName) != null;
							break;
						case AssetSound:
							found = getSoundIndex(assetName) != null;
							break;
					}
					if (!found) {
						logger("Asset with name \"{0}\" doesn't exists", LogType.ERROR, assetName);
					}
					return found;
				}
			}
		}
	#endregion
	
		var assetIndex = asset_get_index(assetName);
		var validate = true;
	
		if (assetType == AssetTexture) {
			assetIndex = getSpriteIndex(assetName);
		}
		if (assetType == AssetSound) {
			assetIndex = getSoundIndex(assetName);
		}
	
		// TODO Dynamically imported asset will always have type -1
		if (assetIndex != -1) {
			/*
			var foundAssetType = asset_get_type(assetName);
			if (foundAssetType != assetType) {
				validate = false;
				logger("Asset with name \"{0}\" doesn't match type. Found: {1}, required: {2}", LogType.ERROR,
					assetName, foundAssetType, assetType);
			}
			*/
		} else {
			validate = false;
			logger("Asset with name \"{0}\" doesn't exists", LogType.ERROR, assetName);
		}
	
		return validate;


}

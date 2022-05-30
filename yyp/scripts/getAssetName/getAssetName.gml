///@function getAssetName(assetIndex, assetType)
///@description Return Name of Asset.
///@param {Asset} assetIndex
///@param {AssetType} assetType
///@return {String} assetName
function getAssetName(argument0, argument1) {

		var assetIndex = argument0;
		var assetType = argument1;
	
		var assetName = "";	
		switch (assetType) {
			case AssetFont:
				assetName = font_get_name(assetIndex);
		        break;
			case AssetClass:
				assetName = object_get_name(assetIndex.object_index);
		        break;
			case AssetPath:
				assetName = path_get_name(assetIndex);
		        break;
			case AssetRoom:
				assetName = room_get_name(assetIndex);
		        break;
			case AssetScript:
				assetName = script_get_name(assetIndex);
		        break;
			case AssetShader:
				assetName = shader_get_name(assetIndex);
		        break;
			case AssetSound:
				assetName = audio_get_name(assetIndex);
		        break;
			case AssetTexture:
				assetName = sprite_get_name(assetIndex);
		        break;
			case AssetTiles:
				assetName = tileset_get_name(assetIndex);
		        break;
			case AssetTimeline:
				assetName = timeline_get_name(assetIndex);
		        break;
			case AssetUnknown:
		        break;		
		}
	
		return assetName;


}

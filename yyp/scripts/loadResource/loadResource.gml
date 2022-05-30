///@function loadResource(name, type, path, options)
///@description
///@param {String} name
///@param {AssetType} type
///@param {String} path
///@param {Map<String::String>} [options]
function loadResource() {

		if (argument_count < 3) {
			logger("loadResourceSync must have at least 3 arguments provided");
			return;
		}
	
		var name = argument[0];
		var type = argument[1];
		var path = argument[2];
		var options = argument_count > 3 ? argument[3] : null;
	
		var assetIndex = asset_get_index(name);
		if (assetIndex != -1) {
			logger("Asset {0} already imported", LogType.DEBUG, name);
			return assetIndex;
		}
		//path = string_replace(working_directory + "data\\resource-package\\" + path, "/", "\\");
		var asset = null;
		switch (type) {
		
			case AssetTexture:
				asset = sprite_add(
					path,
					options, //@hack
					false,
					true,
					0,
					0);
				break;
			case AssetSound:
				asset = audio_create_stream(
					path);
				break;
			default:
				logger("Cannot load asset {0}. Unsupported asset type (raw: {1})", LogType.ERROR, name, type);
				break;
		}
		asset = asset == -1 ? null : asset;
	
		if (asset != null) {
			addResource(name, type, asset);	
		} else {
			logger("Asset is null", LogType.ERROR);	
		}
	
		return asset;
	
	
	




}

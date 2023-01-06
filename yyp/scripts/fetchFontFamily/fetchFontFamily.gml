///@fetchFontFamily(fontFamilyName, [defaultAssetFont])
///@description Return AssetFont collection.
///@param {String} fontFamilyName
///@param {AssetFont} defaultAssetFont
///@return {AssetFont[]} fontFamily
function fetchFontFamily() {

		if (argument_count < 1) {
			logger("fontFamily must have at least 1 argument provided", LogType.ERROR);
			return [ asset_font_ibm_ps2thin4, asset_font_ibm_ps2thin4, asset_font_ibm_ps2thin4, asset_font_ibm_ps2thin4 ];
		}
	
		var fontFamilyName = argument[0];
		var defaultAssetFont = argument_count < 2 ? [ asset_font_ibm_ps2thin4, asset_font_ibm_ps2thin4, asset_font_ibm_ps2thin4, asset_font_ibm_ps2thin4 ] : argument[1];
	
		var fontFamilyNames = [ "small", "medium", "large", "full" ];
		var fontFamily = createArray(4, asset_font_ibm_ps2thin4);
		var fontFamilyLength = getArrayLength(fontFamilyNames);
		for (var index = 0; index < fontFamilyLength; index++) {
			var assetFontName = fontFamilyName + "_" + fontFamilyNames[index];
			var assetFontIndex = getAssetIndex(assetFontName, AssetFont, fontFamily[index]);
			fontFamily[index] = assetFontIndex;
		}
	
		return fontFamily;
	
	


}

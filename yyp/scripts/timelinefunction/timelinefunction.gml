function midboozeDistantMemory() {

	var gridRenderer = getGridRenderer();
	
	gridRenderer.colorGridBackground = colorHashToGMColor("#ffffff");
	
	gridRenderer.xScale = 1.07;
	gridRenderer.yScale = 1.07;
	gridRenderer.colorPrimaryLines = colorHashToColor("#c93a49");
	gridRenderer.colorSecondaryLines = colorHashToColor("#f7e9ed");
	gridRenderer.primaryLinesWidth = 2;
	gridRenderer.channels = 4;
	gridRenderer.colorGridWheelTopLeft = colorHashToColor("#ffffff");
	gridRenderer.colorGridWheelTopRight = colorHashToColor("#ffffff");
	gridRenderer.colorGridWheelBottomRight = colorHashToColor("#ff0000");
	gridRenderer.colorGridWheelBottomLeft = colorHashToColor("#f2d5d8");
	gridRenderer.shroom_texture_01 = asset_texture_visu_shroom_01;
	gridRenderer.shroom_texture_02 = asset_texture_visu_shroom_02;
	gridRenderer.shroom_texture_03 = asset_texture_visu_shroom_03;
	gridRenderer.shroom_texture_04 = asset_texture_visu_shroom_04;
	gridRenderer.shroom_texture_05 = asset_texture_visu_shroom_05;
	gridRenderer.shroom_texture_06 = asset_texture_visu_shroom_06;
	gridRenderer.shroom_texture_07 = asset_texture_visu_shroom_07;
	gridRenderer.shroom_texture_08 = asset_texture_visu_shroom_08;
	gridRenderer.background_texture_01 = asset_texture_visu_bkg_1;
	gridRenderer.background_texture_02 = asset_texture_visu_bkg_2;
	gridRenderer.background_texture_03 = asset_texture_visu_bkg_3;
	gridRenderer.background_texture_04 = asset_texture_visu_bkg_4;
	gridRenderer.background_color_01 = colorHashToGMColor("#ffffff");
	gridRenderer.background_color_02 = colorHashToGMColor("#e63956");
	gridRenderer.background_color_03 = colorHashToGMColor("#d131f5");
	gridRenderer.background_color_04 = colorHashToGMColor("#ffffff");
}


function visuTrackDefaultHandler() {
	
	var gridRenderer = getGridRenderer();
	
	gridRenderer.xScale = getPropertyReal("gridRenderer.xScale", 1.07);
	gridRenderer.yScale = getPropertyReal("gridRenderer.yScale", 1.07);
	gridRenderer.primaryLinesWidth = getPropertyReal("gridRenderer.primaryLinesWidth", 2);
	gridRenderer.channels = getPropertyReal("gridRenderer.channels", 4);

	gridRenderer.shroom_texture_01 = getAssetIndex(getPropertyString("gridRenderer.shroom_texture_01", "asset_texture_visu_shroom_01"), asset_texture_empty);
	gridRenderer.shroom_texture_02 = getAssetIndex(getPropertyString("gridRenderer.shroom_texture_02", "asset_texture_visu_shroom_02"), asset_texture_empty);
	gridRenderer.shroom_texture_03 = getAssetIndex(getPropertyString("gridRenderer.shroom_texture_03", "asset_texture_visu_shroom_03"), asset_texture_empty);
	gridRenderer.shroom_texture_04 = getAssetIndex(getPropertyString("gridRenderer.shroom_texture_04", "asset_texture_visu_shroom_04"), asset_texture_empty);
	gridRenderer.shroom_texture_05 = getAssetIndex(getPropertyString("gridRenderer.shroom_texture_05", "asset_texture_visu_shroom_05"), asset_texture_empty);
	gridRenderer.shroom_texture_06 = getAssetIndex(getPropertyString("gridRenderer.shroom_texture_06", "asset_texture_visu_shroom_06"), asset_texture_empty);
	gridRenderer.shroom_texture_07 = getAssetIndex(getPropertyString("gridRenderer.shroom_texture_07", "asset_texture_visu_shroom_07"), asset_texture_empty);
	gridRenderer.shroom_texture_08 = getAssetIndex(getPropertyString("gridRenderer.shroom_texture_08", "asset_texture_visu_shroom_08"), asset_texture_empty);
	gridRenderer.background_texture_01 = getAssetIndex(getPropertyString("gridRenderer.background_texture_01", "asset_texture_visu_bkg_1"), asset_texture_empty);
	gridRenderer.background_texture_02 = getAssetIndex(getPropertyString("gridRenderer.background_texture_02", "asset_texture_visu_bkg_2"), asset_texture_empty);
	gridRenderer.background_texture_03 = getAssetIndex(getPropertyString("gridRenderer.background_texture_03", "asset_texture_visu_bkg_3"), asset_texture_empty);
	gridRenderer.background_texture_04 = getAssetIndex(getPropertyString("gridRenderer.background_texture_04", "asset_texture_visu_bkg_4"), asset_texture_empty);

	gridRenderer.colorPrimaryLines = colorHashToColor(getPropertyString("gridRenderer.colorPrimaryLines", "#c93a49"));
	gridRenderer.colorSecondaryLines = colorHashToColor(getPropertyString("gridRenderer.colorSecondaryLines", "#f7e9ed"));
	gridRenderer.colorGridBackground = colorHashToGMColor(getPropertyString("gridRenderer.colorGridBackground", "#000000"));
	gridRenderer.colorGridWheelTopLeft = colorHashToColor(getPropertyString("gridRenderer.colorGridWheelTopLeft", "#ffffff"));
	gridRenderer.colorGridWheelTopRight = colorHashToColor(getPropertyString("gridRenderer.colorGridWheelTopRight", "#ffffff"));
	gridRenderer.colorGridWheelBottomRight = colorHashToColor(getPropertyString("gridRenderer.colorGridWheelBottomRight", "#ff0000"));
	gridRenderer.colorGridWheelBottomLeft = colorHashToColor(getPropertyString("gridRenderer.colorGridWheelBottomLeft", "#f2d5d8"));
	gridRenderer.background_color_01 = colorHashToGMColor(getPropertyString("gridRenderer.background_color_01", "#ffffff"));
	gridRenderer.background_color_02 = colorHashToGMColor(getPropertyString("gridRenderer.background_color_02", "#e63956"));
	gridRenderer.background_color_03 = colorHashToGMColor(getPropertyString("gridRenderer.background_color_03", "#d131f5"));
	gridRenderer.background_color_04 = colorHashToGMColor(getPropertyString("gridRenderer.background_color_04", "#ffffff"));
}
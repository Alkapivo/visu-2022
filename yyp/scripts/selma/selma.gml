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
	gridRenderer.shroom_texture_01 = asset_texture_henerum_1;
	gridRenderer.shroom_texture_02 = asset_texture_henerum_2;
	gridRenderer.shroom_texture_03 = asset_texture_henerum_3;
	gridRenderer.shroom_texture_04 = asset_texture_henerum_4;
	gridRenderer.shroom_texture_05 = asset_texture_henerum_5;
	gridRenderer.shroom_texture_06 = asset_texture_henerum_6;
	gridRenderer.shroom_texture_07 = asset_texture_henerum_7;
	gridRenderer.shroom_texture_08 = asset_texture_henerum_8;
	gridRenderer.background_texture_01 = asset_texture_henerum_bkg_1;
	gridRenderer.background_texture_02 = asset_texture_henerum_bkg_2;
	gridRenderer.background_texture_03 = asset_texture_henerum_bkg_3;
	gridRenderer.background_texture_04 = asset_texture_henerum_bkg_4;
	gridRenderer.background_color_01 = colorHashToGMColor("#ffffff");
	gridRenderer.background_color_02 = colorHashToGMColor("#e63956");
	gridRenderer.background_color_03 = colorHashToGMColor("#d131f5");
	gridRenderer.background_color_04 = colorHashToGMColor("#ffffff");
}

function visuTrackDefaultHandler() {
	
}
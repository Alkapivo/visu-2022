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
	
}
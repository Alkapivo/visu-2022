///@function getHandheldRendererBarHeight(handheldRenderer)
///@description Getter.
///@param {HandheldRenderer}
///@return {Number} barHeight
function getHandheldRendererBarHeight(argument0) {

		var handheldRenderer = argument0;
	
		return handheldRenderer.handheldBarHeight;
	



}
///@function getHandheldRendererBarWidth(handheldRenderer)
///@description Getter.
///@param {HandheldRenderer}
///@return {Number} barWidth
function getHandheldRendererBarWidth(argument0) {

		var handheldRenderer = argument0;
	
		return handheldRenderer.handheldBarWidth
	



}
///@function getHandheldRendererOrientation(handheldRenderer)
///@description Getter.
///@param {HandheldRenderer}
///@return {ScreenOrientation} handheldOrientation
function getHandheldRendererOrientation(argument0) {

		var handheldRenderer = argument0;
	
		return handheldRenderer.handheldOrientation;
	



}
///@function getHandheldRendererSurface(handheldRenderer)
///@description Getter.
///@param {HandheldRenderer} handheldRenderer
///@return {Surface} handheldSurface
function getHandheldRendererSurface(argument0) {

		var handheldRenderer = argument0;
	
		return handheldRenderer.handheldSurface;
	



}
///@function getHandheldRendererTresholdRatio(handheldRenderer)
///@description Getter.
///@param {HandheldRenderer} handheldRenderer
///@return {Number} handheldOrientationVerticalTresholdRatio
function getHandheldRendererTresholdRatio(argument0) {

		var handheldRenderer = argument0;
	
		return handheldRenderer.handheldOrientationVerticalTresholdRatio;
	



}
///@function setHandheldRendererOrientation(handheldRenderer, orientation);
///@description Setter.
///@param {ScreenOrientation} orientation
function setHandheldRendererOrientation(argument0, argument1) {

		var handheldRenderer = argument0;
		var orientation = argument1;
	
		handheldRenderer.handheldOrientation = orientation;




}
///@function createHandheldRenderer(layerId)
///@description Constructor.
///@param {Layer} [layerId]
///@return {HandheldRenderer} handheldRenderer
function createHandheldRenderer() {

		var class = HandheldRenderer;
		var instanceLayer = argument_count > 0 ? argument[0] : getSystemLayer();
	
		var instance = defaultContextInstanceConstructor(class, "HandheldRenderer", instanceLayer);
	
		return instance;
	



}
///@function getHandheldRenderer()
///@description Getter.
///@return {Optional<HandheldRenderer>} handheldRenderer
function getHandheldRenderer() {

		return global.handheldRendererContext;
	



}
///@function updateHandheldRenderer(handheldRenderer, guiWidth, guiHeight);
///@descrtipion Update.
///@param {HandheldRenderer} handheldRenderer
///@param {Number} guiWidth
///@param {Number} guiHeight
function updateHandheldRenderer(argument0, argument1, argument2) {

		var handheldRenderer = argument0;
		var guiWidth = argument1;
		var guiHeight = argument2;
	
		// TODO Getters and setters
		var previousHandheldBarWidth = handheldRenderer.handheldBarWidth;
		var previousHandheldBarHeight = handheldRenderer.handheldBarHeight;
	
		var handheldOrientation = (guiWidth / guiHeight) > handheldRenderer.handheldOrientationVerticalTresholdRatio ?
			ScreenOrientation.HORIZONTAL : ScreenOrientation.VERTICAL;
		var handheldBarWidth = handheldOrientation == ScreenOrientation.HORIZONTAL ? 
			max(handheldRenderer.handheldBarHorizontalMaxWidth, guiWidth * handheldRenderer.handheldBarHorizontalWidthFactor) :
			guiWidth;
		var handheldBarHeight = handheldOrientation == ScreenOrientation.HORIZONTAL ?
			guiHeight :
			guiHeight * handheldRenderer.handhelBarVerticalHeightFactor;

		handheldRenderer.handheldOrientation = handheldOrientation;
		handheldRenderer.handheldBarWidth = handheldBarWidth;
		handheldRenderer.handheldBarHeight = handheldBarHeight;	
		handheldRenderer.handheldResizeState = (
			(handheldBarWidth != previousHandheldBarWidth) || 
			(handheldBarHeight != previousHandheldBarHeight)) ?
				RendererResizeState.REQUIRED : 
				RendererResizeState.IDLE;



}

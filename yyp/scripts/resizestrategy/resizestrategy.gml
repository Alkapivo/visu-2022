///@description ResizeStrategy entity

///@function createResizeStrategy(realWidth, realHeight, guiWidth, guiHeight, viewWidth, viewHeight)
///@description Constructor for ResizeStrategy entity.
///@param {Integer} realWidth
///@param {Integer} realHeight
///@param {Integer} guiWidth
///@param {Integer} guiHeight
///@param {Integer} viewWidth
///@param {Integer} viewHeight
///@return {ResizeStrategy} resizeStrategy 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.596Z}
function createResizeStrategy(argument0, argument1, argument2, argument3, argument4, argument5) {

		var realWidth = argument0;
		var realHeight = argument1;
		var guiWidth = argument2;
		var guiHeight = argument3;
		var viewWidth = argument4;
		var viewHeight = argument5;
	
		var resizeStrategy = createEntity(ResizeStrategy);

		setResizeStrategyRealWidth(resizeStrategy, assertNoOptional(realWidth));
		setResizeStrategyRealHeight(resizeStrategy, assertNoOptional(realHeight));
		setResizeStrategyGuiWidth(resizeStrategy, assertNoOptional(guiWidth));
		setResizeStrategyGuiHeight(resizeStrategy, assertNoOptional(guiHeight));
		setResizeStrategyViewWidth(resizeStrategy, assertNoOptional(viewWidth));
		setResizeStrategyViewHeight(resizeStrategy, assertNoOptional(viewHeight));

		return resizeStrategy;
	



}
///@function serializeResizeStrategy(resizeStrategy)
///@description Serialize ResizeStrategy to JSON string.
///@param {ResizeStrategy} resizeStrategy
///@return {String} resizeStrategyJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:41.139Z}
function serializeResizeStrategy(argument0) {

		var resizeStrategy = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"realWidth",
			getResizeStrategyRealWidth(resizeStrategy));	
		appendFieldToJsonObject(
			jsonObject,
			"realHeight",
			getResizeStrategyRealHeight(resizeStrategy));	
		appendFieldToJsonObject(
			jsonObject,
			"guiWidth",
			getResizeStrategyGuiWidth(resizeStrategy));	
		appendFieldToJsonObject(
			jsonObject,
			"guiHeight",
			getResizeStrategyGuiHeight(resizeStrategy));	
		appendFieldToJsonObject(
			jsonObject,
			"viewWidth",
			getResizeStrategyViewWidth(resizeStrategy));	
		appendFieldToJsonObject(
			jsonObject,
			"viewHeight",
			getResizeStrategyViewHeight(resizeStrategy));	

		var resizeStrategyJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return resizeStrategyJsonString;
	



}
///@function deserializeResizeStrategy(jsonString)
///@description Deserialize ResizeStrategy from JSON String to ResizeStrategy entity.
///@param {String} jsonString
///@return {ResizeStrategy} resizeStrategy 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.596Z}
function deserializeResizeStrategy(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var realWidth = assertNoOptional(getJsonObjectFieldValue(jsonObject, "realWidth"));
		var realHeight = assertNoOptional(getJsonObjectFieldValue(jsonObject, "realHeight"));
		var guiWidth = assertNoOptional(getJsonObjectFieldValue(jsonObject, "guiWidth"));
		var guiHeight = assertNoOptional(getJsonObjectFieldValue(jsonObject, "guiHeight"));
		var viewWidth = assertNoOptional(getJsonObjectFieldValue(jsonObject, "viewWidth"));
		var viewHeight = assertNoOptional(getJsonObjectFieldValue(jsonObject, "viewHeight"));

		destroyJsonObject(jsonObject);
	
		return createResizeStrategy(realWidth, realHeight, guiWidth, guiHeight, viewWidth, viewHeight);
	



}
///@function destroyResizeStrategy(resizeStrategy)
///@description Destroy ResizeStrategy entity.
///@param {ResizeStrategy} resizeStrategy
///@throws {Exception}
///@generated {2020-09-28T21:11:15.596Z}
function destroyResizeStrategy(argument0) {

		var resizeStrategy = argument0;
	
		var realWidth = getResizeStrategyRealWidth(resizeStrategy);
		var realHeight = getResizeStrategyRealHeight(resizeStrategy);
		var guiWidth = getResizeStrategyGuiWidth(resizeStrategy);
		var guiHeight = getResizeStrategyGuiHeight(resizeStrategy);
		var viewWidth = getResizeStrategyViewWidth(resizeStrategy);
		var viewHeight = getResizeStrategyViewHeight(resizeStrategy);
	

	



}
///@function getResizeStrategyGuiHeight(resizeStrategy)
///@description Getter.
///@param {ResizeStrategy} resizeStrategy
///@return {Integer} guiHeight 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.596Z}
function getResizeStrategyGuiHeight(argument0) {

		return argument0[@ 3];
	



}
///@function getResizeStrategyGuiWidth(resizeStrategy)
///@description Getter.
///@param {ResizeStrategy} resizeStrategy
///@return {Integer} guiWidth 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.596Z}
function getResizeStrategyGuiWidth(argument0) {

		return argument0[@ 2];
	



}
///@function getResizeStrategyRealHeight(resizeStrategy)
///@description Getter.
///@param {ResizeStrategy} resizeStrategy
///@return {Integer} realHeight 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.596Z}
function getResizeStrategyRealHeight(argument0) {

		return argument0[@ 1];
	



}
///@function getResizeStrategyRealWidth(resizeStrategy)
///@description Getter.
///@param {ResizeStrategy} resizeStrategy
///@return {Integer} realWidth 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.596Z}
function getResizeStrategyRealWidth(argument0) {

		return argument0[@ 0];
	



}
///@function getResizeStrategyViewHeight(resizeStrategy)
///@description Getter.
///@param {ResizeStrategy} resizeStrategy
///@return {Integer} viewHeight 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.596Z}
function getResizeStrategyViewHeight(argument0) {

		return argument0[@ 5];
	



}
///@function getResizeStrategyViewWidth(resizeStrategy)
///@description Getter.
///@param {ResizeStrategy} resizeStrategy
///@return {Integer} viewWidth 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.596Z}
function getResizeStrategyViewWidth(argument0) {

		return argument0[@ 4];
	



}
///@function setResizeStrategyGuiHeight(resizeStrategy, guiHeight)
///@description Setter.
///@param {ResizeStrategy} resizeStrategy
///@param {Integer} guiHeight
///@throws {Exception}
///@generated {2020-09-28T21:11:15.596Z}
function setResizeStrategyGuiHeight(argument0, argument1) {

		argument0[@ 3] = argument1;
	



}
///@function setResizeStrategyGuiWidth(resizeStrategy, guiWidth)
///@description Setter.
///@param {ResizeStrategy} resizeStrategy
///@param {Integer} guiWidth
///@throws {Exception}
///@generated {2020-09-28T21:11:15.596Z}
function setResizeStrategyGuiWidth(argument0, argument1) {

		argument0[@ 2] = argument1;
	



}
///@function setResizeStrategyRealHeight(resizeStrategy, realHeight)
///@description Setter.
///@param {ResizeStrategy} resizeStrategy
///@param {Integer} realHeight
///@throws {Exception}
///@generated {2020-09-28T21:11:15.596Z}
function setResizeStrategyRealHeight(argument0, argument1) {

		argument0[@ 1] = argument1;
	



}
///@function setResizeStrategyRealWidth(resizeStrategy, realWidth)
///@description Setter.
///@param {ResizeStrategy} resizeStrategy
///@param {Integer} realWidth
///@throws {Exception}
///@generated {2020-09-28T21:11:15.596Z}
function setResizeStrategyRealWidth(argument0, argument1) {

		argument0[@ 0] = argument1;
	



}
///@function setResizeStrategyViewHeight(resizeStrategy, viewHeight)
///@description Setter.
///@param {ResizeStrategy} resizeStrategy
///@param {Integer} viewHeight
///@throws {Exception}
///@generated {2020-09-28T21:11:15.596Z}
function setResizeStrategyViewHeight(argument0, argument1) {

		argument0[@ 5] = argument1;
	



}
///@function setResizeStrategyViewWidth(resizeStrategy, viewWidth)
///@description Setter.
///@param {ResizeStrategy} resizeStrategy
///@param {Integer} viewWidth
///@throws {Exception}
///@generated {2020-09-28T21:11:15.596Z}
function setResizeStrategyViewWidth(argument0, argument1) {

		argument0[@ 4] = argument1;
	



}

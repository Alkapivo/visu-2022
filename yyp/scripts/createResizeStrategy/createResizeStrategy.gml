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

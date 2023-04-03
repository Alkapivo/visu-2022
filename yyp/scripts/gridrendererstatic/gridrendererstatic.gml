///@return {Optional<GridRenderer>} gridRenderer
function getGridRenderer() {

	return global.gridRendererContext;
}

///@param {GridEvent} gridEvent
function sendGridEvent(gridEvent) {
	
	addElementToPipeline(getInstanceVariable(getGridRenderer(), GridRenderer_gridEventPipeline), gridEvent);
}


///@param {ColorTransformTask} colorTransformTask
function sendGridRendererColorTransformTask(colorTransformTask) {

	var colorTransformPipeline = getInstanceVariable(fetchGameController(), GridRenderer_colorTransformPipeline)
	if (isDataStructure(colorTransformPipeline, List)) {
		
		addToList(colorTransformPipeline, colorTransformTask);	
	}
}

///@function getGridRendererAngle()
///@description Getter.
///@return {Number} angle in degrees
function getGridRendererAngle() {

		return getGridRenderer().angle;
	



}
///@function getGridRendererEnableGridElementsRendering()
///@description Getter.
///@return {Boolean} enableGridElementsRendering
function getGridRendererEnableGridElementsRendering() {

		return getGridRenderer().enableGridElementsRendering;
	



}


function getGridRendererEnableGridRendering() {

	return getInstanceVariable(fetchGridRenderer(), "enableGridRendering");
}

function setGridRendererEnableGridRendering(value) {

	setInstanceVariable(fetchGridRenderer(), "enableGridRendering", value);
}

///@function getGridRendererEnableSeparatorsRendering()
///@description Getter.
///@return {Boolean} enableSeparatorsRendering
function getGridRendererEnableSeparatorsRendering() {

		return getGridRenderer().enableSeparatorsRendering;
	



}
///@function getGridRendererEnableSurfaceRendering()
///@description Getter.
///@return {Boolean} enableSurfaceRendering
function getGridRendererEnableSurfaceRendering() {

		return getGridRenderer().enableSurfaceRendering;
	



}
///@function getGridRendererGridElementPipeline()
///@description Getter.
///@return {PriorityQueue<GridElement>} gridElementPipeline
function getGridRendererGridElementPipeline() {

		return getGridRenderer().gridElementPipeline;
	



}
///@function getGridRendererIsGridFrameCleaned()
///@description Getter
///@return {Boolean} isGridFrameCleaned
function getGridRendererIsGridFrameCleaned() {

		return getGridRenderer().isGridFrameCleaned;
	



}
///@function getGridRendererIsGridWheelEnabled()
///@description Getter
///@return {Boolean} isGridWheelEnabled
function getGridRendererIsGridWheelEnabled() {

		return getGridRenderer().isGridWheelEnabled;
	



}
///@function getGridRendererSurface()
///@description Getter
///@return {Optional<Surface>} surface return null if surface doesn't exists.
function getGridRendererSurface() {

		var gridRenderer = getGridRenderer();
		var surface = gridRenderer.gridSurface;
	
		return isSurfaceValid(surface) ? surface : null;
	



}
///@function getGridRendererXScale()
///@description Getter.
///@return {Number} xScale
function getGridRendererXScale() {

		return getGridRenderer().xScale;
	



}
///@function getGridRendererYScale()
///@description Getter.
///@return {Number} yScale
function getGridRendererYScale() {

		return getGridRenderer().yScale;
	



}
///@function setGridRendererAngle(angle)
///@description Setter.
///@param {Number} angle
function setGridRendererAngle(argument0) {

		var _angle = argument0;

		var gridRenderer = getGridRenderer();
		gridRenderer.angle = _angle;
	



}
///@function getGridRendererEnableGridElementsRendering(enableGridElementsRendering)
///@description Getter.
///@param {Boolean} enableGridElementsRendering
function setGridRendererEnableGridElementsRendering(argument0) {

		var _enableGridElementsRendering = argument0;

		var gridRenderer = getGridRenderer();
		gridRenderer.enableGridElementsRendering = _enableGridElementsRendering;
	



}
///@function setGridRendererEnableSeparatorsRendering(enableSeparatorsRendering)
///@description Setter.
///@param {Boolean} enableSeparatorsRendering
function setGridRendererEnableSeparatorsRendering(argument0) {

		var _enableSeparatorsRendering = argument0;

		var gridRenderer = getGridRenderer()
		gridRenderer.enableSeparatorsRendering = _enableSeparatorsRendering;
	



}
///@function getGridRendererEnableSurfaceRendering(enableSurfaceRendering)
///@description Getter.
///@param {Boolean} enableSurfaceRendering
function setGridRendererEnableSurfaceRendering(argument0) {

		var _enableSurfaceRendering = argument0;

		var gridRenderer = getGridRenderer();
		gridRenderer.enableSurfaceRendering = _enableSurfaceRendering;
	



}
///@function setGridRendererIsGridFrameCleaned(isGridFrameCleaned)
///@description Setter.
///@param {Boolean} isGridFrameCleaned
function setGridRendererIsGridFrameCleaned(argument0) {

		var _isGridFrameCleaned = argument0;

		var gridRenderer = getGridRenderer();
		gridRenderer.isGridFrameCleaned = _isGridFrameCleaned;
	



}
///@function setGridRendererIsGridWheelEnabled(isGridWheelEnabled)
///@description Setter.
///@param {Boolean} isGridWheelEnabled
function setGridRendererIsGridWheelEnabled(argument0) {

		var _isGridWheelEnabled = argument0;

		var gridRenderer = getGridRenderer();
		gridRenderer.isGridWheelEnabled = _isGridWheelEnabled;
	



}
///@function setGridRendereSurface(surface)
///@description Setter.
///@param {Surface} surface
function setGridRendererSurface(argument0) {

		var surface = argument0;

		var gridRenderer = getGridRenderer();
		gridRenderer.gridSurface = surface;
	



}
///@function setGridRendererXScale(xScale)
///@description Setter.
///@param {Number} xScale
function setGridRendererXScale(argument0) {

		var _xScale = argument0;

		var gridRenderer = getGridRenderer();
		gridRenderer.xScale = _xScale;
	



}

///@function applyGridEventOnGridRenderer(gridEvent)
///@description Apply GridEvent on GridRenderer.
///@param {GridEvent} gridEvent
function applyGridEventOnGridRenderer(argument0) {

		var gridEvent = argument0;
	
		var fields = getGridEventFields(gridEvent);
		for (var field = mapFirst(fields); iteratorFinish(field); field = mapNext(fields, field)) {
		
			var value = fields[? field];
			if (isTJsonBoolean(value)) {
			
				value = convertTJsonBooleanToBoolean(value);	
			}
		
			if ((isArray(value)) && 
				(getArrayLength(value) == 0)) {
			
				logger("[GridEvent] Found invalid value for field {0}", LogType.WARNING, field);
				return;	
			}
		
			var changeFactor = getValueFromArray(value, 1, 1.0);
		
			if (stringContains(field, "color")) {
			
				var color = colorHashToColor(getValueFromArray(value, 0, "#FFFFFF"));
				var colorTransformTask = createColorTransformTask(field, color, changeFactor);
				sendGridRendererColorTransformTask(colorTransformTask);
			} else {
			
				if (isArray(value)) {
				
					var fieldValue = getValueFromArray(value, 0, 0.0);
					var fieldModifierTask = createFieldModifierTask(getGridRenderer(), field, fieldValue, changeFactor, 1, 0);
					sendFieldModifierTask(fieldModifierTask);
				} else {
			
					setInstanceVariable(getGridRenderer(), field, value);
				}
			}
		}
	



}
///@function checkCriclesCollision(sourceCirclePosition, sourceCircleRadius, targetCirclePosition, targetCircleRadius)
///@description Return true if source circle collide with target circle.
///@param {Number} sourceCirclePosition
///@param {Number} sourceCircleRadius
///@param {Number} targetCirclePosition
///@param {Number} targetCircleRadius
///@return {Boolean} isCollision
function checkCirclesCollision(argument0, argument1, argument2, argument3) {
	
		var sourceCirclePosition = argument0;
		var sourceCircleRadius = argument1;
		var targetCirclePosition = argument2;
		var targetCircleRadius = argument3;

		sourceCircleRadius *= clamp(fetchVerticalProjectionScale(sourceCirclePosition[1]), 0.4, 1.0);
		targetCircleRadius *= clamp(fetchVerticalProjectionScale(targetCirclePosition[1]), 0.4, 1.0);

		var distance = getDistanceBetweenPoints(sourceCirclePosition, targetCirclePosition);
		var circlesLength = sourceCircleRadius + targetCircleRadius;
		var isCollision = circlesLength >= distance;
	
		return isCollision
	



}
///@function createGridRenderer(layerId)
///@description Constructor.
///@param {Layer} [layerId]
///@return {GridRenderer} gridRenderer
function createGridRenderer() {

		var class = GridRenderer;
		var instanceLayer = argument_count > 0 ? argument[0] : getSystemLayer();
	
		var instance = defaultContextInstanceConstructor(class, "GridRenderer", instanceLayer);
	
		return instance;
	



}
///@function fetchCollisionRadiusFromSprite(sprite)
///@description Get normalized circle radius from sprite.
///@param {Sprite} sprite
function fetchCollisionRadiusFromSprite(argument0) {

		var sprite = argument0;
	
		var spriteAsset = getSpriteAssetIndex(sprite);
		var dimension = getSpriteAssetWidth(spriteAsset);//min(getSpriteAssetWidth(spriteAsset), getSpriteAssetHeight(spriteAsset));
	
	#region hackYeah @visu Tutaj mozesz sie pobawic z hakami na kolizje ;)
		var zeroCollision = arrayContain(
			[],
			spriteAsset
		);
	
		if (zeroCollision) {
			dimension = 0;
		}
	#endregion
		
		return (dimension / BASE_SCALE_RESOLUTION) * 0.33;
	



}
///@function fetchGridElementParticlePosition(gridElement, position)
function fetchGridElementParticlePositions(argument0, argument1) {

		var gridElement = argument0;
		var position = argument1;
	
		var gridRenderer = getGridRenderer();						
		var viewWidth = global.viewWidth;
		var viewHeight = global.viewHeight;
		var pixelOffsetTop = gridRenderer.offsetTop * viewHeight;
		var pixelOffsetBottom = gridRenderer.offsetBottom * viewHeight;	
		var pixelTopLineWidth = gridRenderer.topLineWidth * viewWidth;
		var pixelBottomLineWidth = gridRenderer.bottomLineWidth * viewWidth;
		var lineTopXCenter = viewWidth * gridRenderer.topLinePosition;
		var lineTopXBegin = lineTopXCenter - (pixelTopLineWidth * 0.5);
		var lineBottomXCenter = viewWidth * 0.5;
		var lineBottomXBegin = lineBottomXCenter - (pixelBottomLineWidth * 0.5);
		var pathYBegin = pixelOffsetTop;
		var pathYEnd = viewHeight - pixelOffsetBottom;
		var gridHeight = viewHeight - pixelOffsetTop - pixelOffsetBottom;
		var gridAngleLeft = gridHeight / (lineTopXCenter - ((viewWidth - pixelBottomLineWidth) * 0.5) - (pixelTopLineWidth * 0.5));
		var gridAngleRight = gridHeight / (viewWidth - lineTopXCenter - ((viewWidth - pixelBottomLineWidth) * 0.5) - (pixelTopLineWidth * 0.5));
			
		var pathXBegin = (getPositionHorizontal(position) * pixelTopLineWidth) + lineTopXBegin;
		var pathXEnd = (getPositionHorizontal(position) * pixelBottomLineWidth) + lineBottomXBegin;
		var pathYBegin = pixelOffsetTop;
		var pathYEnd = viewHeight - pixelOffsetBottom;
		var pathLength = getDistanceBetweenPoints([ pathXBegin, pathYBegin ], [ pathXEnd, pathYEnd ]);
		var pathDirection = getAngleBetweenPoints([pathXBegin, pathYBegin ],  [pathXEnd, pathYEnd ]);
		
		var sprite = getGridElementSprite(gridElement);
		var spriteAsset = getSpriteAssetIndex(sprite);
		var pixelSpriteWidth = getSpriteAssetWidth(spriteAsset);
		var pixelSpriteHeight = getSpriteAssetHeight(spriteAsset);
		var spriteWidth = pixelSpriteWidth / BASE_SCALE_RESOLUTION;
		var spriteHeight = pixelSpriteHeight / BASE_SCALE_RESOLUTION;
		
		var verticalProjectionPowerFactor = clamp(gridRenderer.gridAngle, 0.0, 1.0)		
		var targetScaleFactor = power(position[1], verticalProjectionPowerFactor);
			
		var targetHeight = (spriteHeight * gridHeight) * targetScaleFactor;
		var targetXBegin = pathXBegin + getXOnCircle(pathLength * getPositionVertical(position), pathDirection);
		var targetYBegin = pathYBegin + getYOnCircle(pathLength * getPositionVertical(position), pathDirection);
		var targetXEnd = targetXBegin + getXOnCircle(targetHeight, pathDirection);
		var targetYEnd = targetYBegin + getYOnCircle(targetHeight, pathDirection);
		var targetTopWidth = (
			(lineTopXCenter + ((targetYBegin - pixelOffsetTop) / gridAngleRight) + (pixelTopLineWidth * 0.5)) - 
			(lineTopXCenter - ((targetYBegin - pixelOffsetTop) / gridAngleLeft) - (pixelTopLineWidth * 0.5))) 
			* spriteWidth
		var targetBottomWidth = (
			(lineTopXCenter + ((targetYEnd - pixelOffsetTop) / gridAngleRight) + (pixelTopLineWidth * 0.5)) - 
			(lineTopXCenter - ((targetYEnd - pixelOffsetTop) / gridAngleLeft) - (pixelTopLineWidth * 0.5))) 
			* spriteWidth
	
		var positions = [
			[ (targetXBegin - (targetTopWidth * 0.5)) / global.viewWidth,  (targetYBegin / global.viewHeight) ],
			[ (targetXEnd + (targetBottomWidth * 0.5)) / global.viewWidth, (targetYEnd / global.viewHeight) ]
		]
	
		return positions;


}
///@function fetchGridElementPositionStamp(instance)
///@description Convert two dimensional position into one number.
///@param {GridElement} gridElement
///@return {Number} positionStamp
function fetchGridElementPositionStamp(argument0) {

		var gridElement = argument0;
		var sprite = getGridElementSprite(gridElement);
		var spriteIndex = getSpriteAssetIndex(sprite);
		var spriteWidth = getSpriteAssetWidth(spriteIndex);
		var spriteHeight = getSpriteAssetHeight(spriteIndex);
		var spriteXOffset = sprite_get_xoffset(spriteIndex);
		var spriteYOffset = sprite_get_yoffset(spriteIndex);
		var position = getGridElementPosition(gridElement);
	
		var pixelXPosition = (global.guiWidth * getPositionHorizontal(position)) - spriteXOffset + spriteWidth
		var pixelYPosition = (global.guiHeight * getPositionVertical(position)) - spriteYOffset + spriteHeight;
		var positionStamp = pixelXPosition + global.guiWidth * pixelYPosition;
	
		return positionStamp;
	



}
///@function fetchMovedVerticalPositionOnGrid(currentPosition, elementSpeed, gridHeight)
///@description Calculate next normalized Y position
///@param {Number} currentPosition (normalized)
///@param {Number} elementSpeed (normalized)
///@return {Number} nextPosition (normalized)
function fetchMovedVerticalPositionOnGrid(argument0, argument1) {

		var currentPosition = argument0;
		var elementSpeed = argument1;
	
		var verticalProjectionScale = fetchVerticalProjectionScale(currentPosition);
		var nextPosition = currentPosition + elementSpeed * verticalProjectionScale * getDeltaTimeValue();
	
		return nextPosition;
	



}
///@function fetchVerticalProjectionScale(verticalPosition)
///@description Return scale factor on grid
///@param {Number} verticalPosition
///@return {Number} scaleFactor
function fetchVerticalProjectionScale(verticalPosition) {

	var gridRenderer = getGridRenderer();
	if (!isOptionalPresent(gridRenderer)) {
		return 1.0;
	}
		
	var gridAngle = gridRenderer.gridAngle;
	var verticalProjectionPowerFactor = clamp(gridAngle, 0.0, 1.0);		
	var verticalProjectionScale = power(verticalPosition, verticalProjectionPowerFactor);
	
	if (is_nan(verticalProjectionScale)) {
		verticalProjectionScale = 0.1
	}
	
	return clamp(verticalProjectionScale, 0.001, 1.0);
}

///@function sendGridElementRenderRequest(gridElement)
///@description Send gridElement to GridRenderer gridElementPipeline.
///@param {?GridElement} gridElement
function sendGridElementRenderRequest(gridElement) {
		
	if (isOptionalPresent(getGridRenderer())) {
		var positionStamp = fetchGridElementPositionStamp(gridElement);
		var gridElementPipeline = getGridRendererGridElementPipeline();
	
		addToPriorityQueue(gridElementPipeline, positionStamp, gridElement);
	}
	
	if (isOptionalPresent(getPlaygroundController())) {
		var positionStamp = fetchGridElementPositionStamp(gridElement);
		var gridElementPipeline = getPlaygroundController().GMObject.state.grid.elements
		
		addToPriorityQueue(gridElementPipeline, positionStamp, gridElement);
	}
}

///@function fetchGridElementParticlePosition(gridElement, position)
function fetchGridElementParticlePosition(gridElement, position) {

	if (isOptionalPresent(getPlaygroundController())) {
		
		var gridPosition = getGridElementPosition(gridElement);
		var positions = {
			xStart: getPositionHorizontal(gridPosition) - 0.00,
			yStart: getPositionVertical(gridPosition) - 0.00,
			xEnd: getPositionHorizontal(gridPosition) + 0.00,
			yEnd: getPositionVertical(gridPosition) + 0.00,
		}
		return positions;
	}

	var gridRenderer = getGridRenderer();
	var viewWidth = ViewWidth;
	var viewHeight = ViewHeight;
	var pixelOffsetTop = gridRenderer.offsetTop * viewHeight;
	var pixelOffsetBottom = gridRenderer.offsetBottom * viewHeight;	
	var pixelTopLineWidth = gridRenderer.topLineWidth * viewWidth;
	var pixelBottomLineWidth = gridRenderer.bottomLineWidth * viewWidth;
	var lineTopXCenter = viewWidth * gridRenderer.topLinePosition;
	var lineTopXBegin = lineTopXCenter - (pixelTopLineWidth * 0.5);
	var lineBottomXCenter = viewWidth * 0.5;
	var lineBottomXBegin = lineBottomXCenter - (pixelBottomLineWidth * 0.5);
	var pathYBegin = pixelOffsetTop;
	var pathYEnd = viewHeight - pixelOffsetBottom;
	var gridHeight = viewHeight - pixelOffsetTop - pixelOffsetBottom;
	var gridAngleLeft = gridHeight / (lineTopXCenter - ((viewWidth - pixelBottomLineWidth) * 0.5) - (pixelTopLineWidth * 0.5));
	var gridAngleRight = gridHeight / (viewWidth - lineTopXCenter - ((viewWidth - pixelBottomLineWidth) * 0.5) - (pixelTopLineWidth * 0.5));
			
	var pathXBegin = (getPositionHorizontal(position) * pixelTopLineWidth) + lineTopXBegin;
	var pathXEnd = (getPositionHorizontal(position) * pixelBottomLineWidth) + lineBottomXBegin;
	var pathYBegin = pixelOffsetTop;
	var pathYEnd = viewHeight - pixelOffsetBottom;
	var pathLength = getDistanceBetweenPoints([ pathXBegin, pathYBegin ], [ pathXEnd, pathYEnd ]);
	var pathDirection = getAngleBetweenPoints([pathXBegin, pathYBegin ],  [pathXEnd, pathYEnd ]);
		
	var sprite = getGridElementSprite(gridElement);
	var spriteAsset = getSpriteAssetIndex(sprite);
	var pixelSpriteWidth = getSpriteAssetWidth(spriteAsset);
	var pixelSpriteHeight = getSpriteAssetHeight(spriteAsset);
	var spriteWidth = pixelSpriteWidth / BASE_SCALE_RESOLUTION;
	var spriteHeight = pixelSpriteHeight / BASE_SCALE_RESOLUTION;
		
	var verticalProjectionPowerFactor = clamp(gridRenderer.gridAngle, 0.0, 1.0)		
	var targetScaleFactor = power(position[1], verticalProjectionPowerFactor);
			
	var targetHeight = (spriteHeight * gridHeight) * targetScaleFactor;
	var targetXBegin = pathXBegin + getXOnCircle(pathLength * getPositionVertical(position), pathDirection);
	var targetYBegin = pathYBegin + getYOnCircle(pathLength * getPositionVertical(position), pathDirection);
	var targetXEnd = targetXBegin + getXOnCircle(targetHeight, pathDirection);
	var targetYEnd = targetYBegin + getYOnCircle(targetHeight, pathDirection);
	var targetTopWidth = (
		(lineTopXCenter + ((targetYBegin - pixelOffsetTop) / gridAngleRight) + (pixelTopLineWidth * 0.5)) - 
		(lineTopXCenter - ((targetYBegin - pixelOffsetTop) / gridAngleLeft) - (pixelTopLineWidth * 0.5))) 
		* spriteWidth
	var targetBottomWidth = (
		(lineTopXCenter + ((targetYEnd - pixelOffsetTop) / gridAngleRight) + (pixelTopLineWidth * 0.5)) - 
		(lineTopXCenter - ((targetYEnd - pixelOffsetTop) / gridAngleLeft) - (pixelTopLineWidth * 0.5))) 
		* spriteWidth
	
	var positions = {
		xStart: (targetXBegin - (targetTopWidth * 0.5)) / ViewWidth,
		yStart: (targetYBegin / ViewHeight),
		xEnd: (targetXEnd + (targetBottomWidth * 0.5)) / ViewWidth, 
		yEnd: (targetYEnd / ViewHeight)
	}
	return positions;
}


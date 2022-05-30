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

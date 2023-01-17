///@description create()

	
	
	#macro DEFAULT_FIELD_MODIFIER_DURATION 1.0
	registerContext(this);
	initializeShaderWave(this);
	
	#region Fields
	
	#macro GridRenderer_gridEventPipeline "gridEventPipeline"
	#macro GridRenderer_colorTransformPipeline "colorTransformPipeline"
	
///@public:

	///@type {Boolean}
	enableGridRendering = false;

	///@type {Boolean}
	enableGridElementsRendering = true;
	
	///@type {Boolean}
	enableSeparatorsRenderering = true;
	
	///@type {Boolean}
	enableSurfaceRendering = true;
	
	///@type {Surface}
	gridSurface = createSurface(ViewWidth, ViewHeight, false);
	
	///@type {Surface}
	gridWireSurface = createSurface(ViewWidth, ViewHeight, false);
	
	///@type {Surface}
	gridWireframeSurface = createSurface(ViewWidth, ViewHeight, false);
	
	///@type {Number}
	gridWireframeSurfaceAlpha = 1.0;

	///@type {Surface}
	gridElementSurface = createSurface(ViewWidth, ViewHeight, false);
	
	///@type {PriorityQueue<GridElement>}
	gridElementPipeline = createPriorityQueue();
	
	///@type {Pipeline<GridEvent>}
	gridEventPipeline = generatePipeline(GridRenderer_gridEventPipeline, Stack, GridEvent);
	
	///@type {Number} normalized
	topLineWidth = 0.33;
	
	///@type {Number} normalized
	topLinePosition = 0.5;
	
	///@type {Number}
	topLinePositionFactor = global.topLinePositionFactorValues[0];

	///@type {Number} normalized
	bottomLineWidth = 0.75
	
	///@type {Number} normalized
	bottomLinePosition = 0.5;

	///@type {Number}
	bottomLinePositionFactor = global.bottomLinePositionFactorValues[0];

	///@type {Number}
	channels = 1;
	
	///@type {Number} normalized
	offsetTop = 0.0;
	
	///@type {Number} normalized
	offsetBottom = 0.0;

	///@type {Number} const, normalized
	separatorSpeed = 0.005;
	
	///@type {Number} unit is Hz
	separatorFrameFrequency = 0.33;
	
	///@type {Color}
	colorPrimaryLines = colorHashToColor("#9d23ad");
	
	///@type {Color}
	colorSecondaryLines = colorHashToColor("#a31049");
	
	///@type {Color}
	colorGridBackground = c_black;
	
	///@type {Number}
	primaryLinesWidth = 8.0;
	
	///@type {Number}
	secondaryLinesWidth = 5.0;
	
	///@type {Number} degrees
	angle = 360.0 * 6;
	
	///@type {Number}
	angleFactor = 1.0;
	
	///@type {Number}
	xScale = 0.95;
	
	///@type {Number}
	yScale = 0.95;
	
	///@type {Boolean}
	isGridWheelEnabled = false;
	
	///@type {Boolean}
	isGridFrameCleaned = true;
	
	///@type {Boolean}
	gridWheelSpeed = 0.008;
	
	///@type {Color}
	colorGridWheelTopLeft = colorHashToColor("#ffffff");
	
	///@type {Color}
	colorGridWheelTopRight = colorHashToColor("#ffffff");
	
	///@type {Color}
	colorGridWheelBottomRight = colorHashToColor("#ffffff");
	
	///@type {Color}
	colorGridWheelBottomLeft = colorHashToColor("#ffffff");
	
	///@type {Boolean}
	swingGrid = false;
	
	///@type {Number}
	screens = 1.0;
	
	///@type {Number}
	screensFactor = global.screensFactorValues[0];
	
	///@type {Number}
	verticalScreens = 1.0;
	
	///@type {Number}
	horizontalScreens = 1.0;
	
	///@type {Number}
	wavePulseAmount = 0.0;
	
	///@type {Number}
	wavePulseMinAmount = 20.0;
	
	///@type {Number}
	wavePulseFriction = 2.5;
	
	///@type {Number}
	wavePulseDistortion = 180.0;
	
	///@type {Number}
	wavePulseSpeed = 1.0;
	
	///@type {Number}
	cameraShake = 0.0;
	
	///@type {Number}
	cameraShakeFactor = 0.5;
	
	///@type {Boolean}
	isFlat = false;

///@private:

	///@type {Number}
	gridAngle = 0.0;
			
	///@type {Integer}
	separatorFrameTimer = 0;
	
	///@type {Stack<Number>}
	separators = createStack();
	
	///@type {Stack<Number>}
	separatorsBuffer = createStack();
	
	///@type {List<ColorTransformTask>
	colorTransformPipeline = createList();

	///@type {Color[]}
	gridColorWheel = [
		cloneArray(colorGridWheelTopLeft),
		cloneArray(colorGridWheelTopRight),
		cloneArray(colorGridWheelBottomRight),
		cloneArray(colorGridWheelBottomLeft)
	];
	
	///@type {Color[]}
	gridColorWheelTable = [
		colorGridWheelTopLeft,
		colorGridWheelTopRight,
		colorGridWheelBottomRight,
		colorGridWheelBottomLeft
	]
	
	///@type {Integer[]}
	gridColorWheelPointers = [ 1, 2, 3, 0 ];
	
	angleTheta = 0.0;
	
	///@type {Sprite}
	markerGood = createSprite(asset_texture_empty, 0.0, 1.0, 1.0, 1.0, 0.0, c_white);
	
	///@type {Sprite}
	markerBad = createSprite(asset_texture_empty, 0.0, 1.0, 1.0, 1.0, 0.0, c_white);
	
	blendModes = [
	    bm_zero,
	    bm_one,
	    bm_src_colour,
	    bm_inv_src_colour,
	    bm_src_alpha,
	    bm_inv_src_alpha,
	    bm_dest_alpha,
	    bm_inv_dest_alpha,
	    bm_dest_colour,
	    bm_inv_dest_colour,
	    bm_src_alpha_sat,
	]

	firstBlendPointer = 1;
	secondBlendPointer = 3;
	blendModesLength = getArrayLength(blendModes);
	
	cameraData = {
		guiX: GuiWidth / 2,
		guiY: GuiHeight / 2,
		zoom: 1.0
	}
	
	playerGridElement = null;
	
	#endregion
	
	GMObject = {
		create: method(this, function() {
			
			logger("Load \"{0}\" function", LogType.INFO, "visu-default-timeline");
			visuTrackDefaultHandler();
			try {
		
				var functionName = getPropertyString("base-timeline-function", "visuTrackDefaultHandler");
				var baseTimelineFunction = getAssetIndex(
					functionName,
					AssetScript
				);
		
				logger("Load \"{0}\" base function", LogType.INFO, functionName);
				baseTimelineFunction();
			} catch (exception) {
		
				logger("{0}", LogType.ERROR, exception.message);
				printStackTrace();
			}
		}),
		gridEventPipelineDispatcher: method(this, function(pipeline) {
		
			for (var gridEvent = getPipelineFirstElement(pipeline);
				 iteratorFinish(gridEvent);
				 gridEvent = getPipelineNextElement(pipeline)) {
	
				var fields = getGridEventFields(gridEvent);
				if (isDataStructure(fields, Map)) {
				
					var fieldsSize = getMapSize(fields);
					for (var fieldName = mapFirst(fields);
						 iteratorFinish(fieldName);
						 fieldName = mapNext(fields, fieldName)) {

						var fieldModifier = fields[? fieldName];
						if (!isEntity(fieldModifier, FieldModifier)) {

						    logger("Found invalid FieldModifier at index {0}.", LogType.WARNING, index);
							continue;
						}
			
						switch (getFieldModifierType(fieldModifier)) {

							#region Number
						    case "Number":

						        var fieldModifierDuration = getFieldModifierDuration(fieldModifier);
						        fieldModifierDuration = isNumber(fieldModifierDuration) ? 
									fieldModifierDuration : DEFAULT_FIELD_MODIFIER_DURATION;
					
								var fieldModifierValue = getFieldModifierValue(fieldModifier);
								if (isNumber(fieldModifierValue)) {
					
									sendFieldModifierTask(createFieldModifierTask(
										getGridRenderer(), 
										getFieldModifierName(fieldModifier), 
										fieldModifierValue,
										fieldModifierDuration, 
										1, 
										0
									));
								} else {
						
									logger("Found invalid FieldModifier.type Number. { \"value\": \"{0}\" }", LogType.WARNING, getFieldModifierValue(fieldModifier));
								}
						        break;
							#endregion
							#region Color
						    case "Color":

						        var fieldModifierDuration = getFieldModifierDuration(fieldModifier);
						        fieldModifierDuration = isNumber(fieldModifierDuration) ? 
									fieldModifierDuration : DEFAULT_FIELD_MODIFIER_DURATION;
								fieldModifierValue = colorHashToColor(getFieldModifierValue(fieldModifier));
								if (isEntity(fieldModifierValue, Color)) {
					
									sendGridRendererColorTransformTask(
										createColorTransformTask(
											getFieldModifierName(fieldModifier), 
											fieldModifierValue, 
											fieldModifierDuration
										)
									);
								} else {
						
									logger("Found invalid FieldModifier.type Color. { \"value\": \"{0}\" }", LogType.WARNING, getFieldModifierValue(fieldModifier));
								}
						        break;
							#endregion
							#region Boolean
						    case "Boolean":

						        setInstanceVariable(getGridRenderer(), getFieldModifierName(fieldModifier), getFieldModifierValue(fieldModifier));
						        break;
							#endregion
							default:
				
								logger("Found unsupported FieldModifier.type. { \"type\": \"{0}\" }", LogType.WARNING, getFieldModifierType(fieldModifier))
								break;
						}
					}
				}
			
				destroyGridEvent(gridEvent);
			}
		}),
		preRender: method(this, function() {

			var viewWidth = ViewWidth;
			var viewHeight = ViewHeight;
			var pixelOffsetTop = this.offsetTop * viewHeight;
			var pixelOffsetBottom = this.offsetBottom * viewHeight;	
			var pixelTopLineWidth = this.topLineWidth * viewWidth;
			var pixelBottomLineWidth = this.bottomLineWidth * viewWidth;
			var lineTopXCenter = viewWidth * this.topLinePosition;
			var lineTopXBegin = lineTopXCenter - (pixelTopLineWidth * 0.5);
			var lineTopXEnd = lineTopXCenter + (pixelTopLineWidth * 0.5);
			var lineBottomXCenter = viewWidth * this.bottomLinePosition;
			var lineBottomXBegin = lineBottomXCenter - (pixelBottomLineWidth * 0.5);
			var lineBottomXEnd = lineBottomXCenter + (pixelBottomLineWidth * 0.5);
			var pathYBegin = pixelOffsetTop;
			var pathYEnd = viewHeight - pixelOffsetBottom;
			var gridHeight = viewHeight - pixelOffsetTop - pixelOffsetBottom;
			var gridAngleLeft = gridHeight / (lineTopXCenter - ((viewWidth - pixelBottomLineWidth) * 0.5) - (pixelTopLineWidth * 0.5));
			var gridAngleRight = gridHeight / (viewWidth - lineTopXCenter - ((viewWidth - pixelBottomLineWidth) * 0.5) - (pixelTopLineWidth * 0.5));
		
			#region Surface Target: gridWireframeSurface
			this.gridWireframeSurface = getSurface(this.gridWireframeSurface, ViewWidth, ViewHeight, true);
			gpuSetSurfaceTarget(this.gridWireframeSurface);
			if (this.isGridFrameCleaned) {
				draw_clear_alpha(c_black, 0.0);
			}
		
			if (this.enableGridRendering) {
	
				#region Top line
				gpuSetColorInScope(this.isGridWheelEnabled ? COLOR_WHITE : this.colorPrimaryLines);
				drawLine(
					lineTopXBegin, 
					pixelOffsetTop, 
					lineTopXEnd, 
					pixelOffsetTop,
					this.primaryLinesWidth);
				#endregion
		
				#region Down line
				gpuSetColorInScope(this.isGridWheelEnabled ? COLOR_WHITE : this.colorPrimaryLines);
				drawLine(
					lineBottomXBegin, 
					viewHeight - pixelOffsetBottom, 
					lineBottomXEnd, 
					viewHeight - pixelOffsetBottom,
					this.primaryLinesWidth
				);
				#endregion
	
				#region Channels
				gpuSetColorInScope(this.isGridWheelEnabled ? COLOR_WHITE : this.colorPrimaryLines);
				var topChannelWidth = pixelTopLineWidth / this.channels;
				var bottomChannelWidth = pixelBottomLineWidth / this.channels;
				for (var index = 0; index < this.channels; index++) {
					drawLine(
						lineTopXBegin + index * topChannelWidth,
						pixelOffsetTop,
						lineBottomXBegin + index * bottomChannelWidth,
						viewHeight - pixelOffsetBottom,
						this.primaryLinesWidth
					);
				}
				drawLine(
					lineTopXEnd,
					pixelOffsetTop,
					lineBottomXEnd,
					viewHeight - pixelOffsetBottom,
					this.primaryLinesWidth
				);
				#endregion

				#region Separators

				gpuSetColorInScope(this.isGridWheelEnabled ? COLOR_WHITE : this.colorSecondaryLines);
				
				#region Separators Timer
				var normalizedFrequency = this.separatorFrameFrequency * GAME_FPS;
				this.separatorFrameTimer = incrementTimer(this.separatorFrameTimer, normalizedFrequency, 1.0);
				if ((this.separatorFrameTimer == 0.0)
					|| (isStackEmpty(this.separators))) {
		
					pushStack(this.separators, sign(this.separatorSpeed) == 1.0 ? 1.0 / viewHeight : 1.0);
				}
				#endregion
	
				#region Draw separators
				var separatorsSize = getStackSize(this.separators);
				var verticalProjectionPowerFactor = clamp(1 + this.gridAngle, 1.0, 2.0);
				repeat (separatorsSize) {
					var separator = popStack(this.separators);
					separator = fetchMovedVerticalPositionOnGrid(separator, this.separatorSpeed);

					var separatorProjectedPosition = power(separator, verticalProjectionPowerFactor);
					if ((separator > 0.0)
						&& (separator < 1.0)) {
							
						pushStack(this.separatorsBuffer, separator);
						var pixelSeparator = separatorProjectedPosition * viewHeight;
						if (this.enableSeparatorsRenderering) {
							if ((pixelSeparator >= pixelOffsetTop)
								&& (pixelSeparator <= viewHeight - pixelOffsetBottom)) {
								drawLine(
									lineTopXCenter - ((pixelSeparator - pixelOffsetTop) / gridAngleLeft) - (pixelTopLineWidth * 0.5),
									pixelSeparator,
									lineTopXCenter + ((pixelSeparator - pixelOffsetTop) / gridAngleRight) + (pixelTopLineWidth * 0.5),
									pixelSeparator,
									this.secondaryLinesWidth
								);
							}	
						}
					}
				}
				#endregion
	
				copyStack(this.separators, this.separatorsBuffer);
				clearStack(this.separatorsBuffer);

				#endregion
			}
		
			gpuResetSurfaceTarget();
			#endregion
	
			#region Surface Target: gridWireSurface
			this.gridWireSurface = getSurface(this.gridWireSurface, ViewWidth, ViewHeight, true);
			gpuSetSurfaceTarget(this.gridWireSurface);
		
			if (this.wavePulseAmount > this.wavePulseMinAmount) {
			
				drawClear(COLOR_TRANSPARENT);
				gpuSetShader(shaderWave);
			
					gpuSetShaderUniformFloat(this.shaderWaveUniformAmount, this.wavePulseAmount);
					gpuSetShaderUniformFloat(this.shaderWaveUniformDistortion, this.wavePulseDistortion);
					gpuSetShaderUniformFloat(this.shaderWaveUniformSpeed, this.wavePulseSpeed);
					gpuSetShaderUniformFloat(this.shaderWaveUniformTime, global.gameplayTimePrecise);
					renderSurface(this.gridWireframeSurface, 0.0, 0.0, 1.0, 1.0, 0.0, this.gridWireframeSurfaceAlpha);
				gpuResetShader();
			} else {
			
				drawClear(COLOR_TRANSPARENT);
				renderSurface(this.gridWireframeSurface, 0.0, 0.0, 1.0, 1.0, 0.0, this.gridWireframeSurfaceAlpha);
			}
		
			gpuResetSurfaceTarget();
			#endregion
	
			#region Surface Target: gridSurface
			this.gridSurface = getSurface(this.gridSurface, ViewWidth, ViewHeight, true);
			gpuSetSurfaceTarget(this.gridSurface);
		
			drawClear(COLOR_TRANSPARENT);
	
			#region Render grid
			if (this.isGridWheelEnabled) {
		
				#region Transform colors in gridColorWheel
				var gridColorWheelLength = getArrayLength(this.gridColorWheel);
				for (var index = 0; index < gridColorWheelLength; index++) {
					var colorPointer = this.gridColorWheelPointers[index];
					if (transformColor(this.gridColorWheel[@ index], this.gridColorWheelTable[colorPointer], this.gridWheelSpeed)) {
						//printArray(this.gridColorWheelTable[index]);
						this.gridColorWheelPointers[index] = colorPointer + 1 > 3 ? 0 : colorPointer + 1;
					}	
				}
				#endregion
		
				#region Destructuring gridColorWheel
				var colors = [
					colorToGMColor(this.gridColorWheel[0]),
					colorToGMColor(this.gridColorWheel[1]),
					colorToGMColor(this.gridColorWheel[2]),
					colorToGMColor(this.gridColorWheel[3])
				]
				#endregion
		
				renderSurface(this.gridWireSurface, 0, 0, 1.0, 1.0, 0.0, 1.0, colors);				
			} else {
			
				renderSurface(this.gridWireSurface, 0, 0);
			}
			#endregion
	
			#region GridElement Pipeline
		
				if (this.enableGridElementsRendering) {
			
					/*
					if (keyboard_check_pressed(ord("I"))) {
						this.firstBlendPointer = clamp(this.firstBlendPointer + 1, 0, this.blendModesLength - 1);
						logger("firstBlendPointer {0}", LogType.DEBUG, this.firstBlendPointer);
					}
					if (keyboard_check_pressed(ord("K"))) {
						this.firstBlendPointer = clamp(this.firstBlendPointer- 1, 0, this.blendModesLength - 1);
						logger("firstBlendPointer {0}", LogType.DEBUG, this.firstBlendPointer);
					}
					
					if (keyboard_check_pressed(ord("O"))) {
						this.secondBlendPointer = clamp(this.secondBlendPointer + 1, 0, this.blendModesLength - 1);
						logger("secondBlendPointer {0}", LogType.DEBUG, this.secondBlendPointer);
					}
					if (keyboard_check_pressed(ord("L"))) {
						this.secondBlendPointer = clamp(this.secondBlendPointer - 1, 0, this.blendModesLength - 1);
						logger("secondBlendPointer {0}", LogType.DEBUG, this.secondBlendPointer);
					}
					*/
					
					var restoreBlendMode = false;
					gpu_set_blendmode_ext(this.blendModes[this.firstBlendPointer], this.blendModes[this.secondBlendPointer]);
					var dimension = max(viewWidth, viewHeight);
					var gridElementPipelineSize = getPriorityQueueSize(this.gridElementPipeline);
					var playerGridElement = createEmptyOptional();
					for (var index = 0; index < gridElementPipelineSize; index++) {
		
						var gridElement = popMinPriorityQueue(this.gridElementPipeline);
					
						if (restoreBlendMode) {
							restoreBlendMode = false;
							gpu_set_blendmode_ext(this.blendModes[this.firstBlendPointer], this.blendModes[this.secondBlendPointer]);
						}
						
						#region Calculate GridElement Coordinates
						var position = getGridElementPosition(gridElement);
						var pathXBegin = (getPositionHorizontal(position) * pixelTopLineWidth) + lineTopXBegin;
						var pathXEnd = (getPositionHorizontal(position) * pixelBottomLineWidth) + lineBottomXBegin;
						var pathLength = getDistanceBetweenCoords(pathXBegin, pathYBegin, pathXEnd, pathYEnd);
						var pathDirection = getAngleBetweenCoords(pathXBegin, pathYBegin, pathXEnd, pathYEnd);
				
						var sprite = getGridElementSprite(gridElement);
						var spriteAsset = getSpriteAssetIndex(sprite);
						var pixelSpriteWidth = getSpriteAssetWidth(spriteAsset);
						var pixelSpriteHeight = getSpriteAssetHeight(spriteAsset);
						var spriteWidth = pixelSpriteWidth / BASE_SCALE_RESOLUTION;
						var spriteHeight = pixelSpriteHeight / BASE_SCALE_RESOLUTION;
					
						if (spriteAsset == asset_texture_visu_player) {
							restoreBlendMode = true;
							gpu_set_blendmode(bm_normal)
							playerGridElement = gridElement;
						}
		
						var verticalProjectionPowerFactor = clamp(this.gridAngle, 0.0, 1.0)		
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
						#endregion 
		
						#region Draw GridElement
						var polygon2D = [
						    [ targetXBegin - (targetTopWidth * 0.5),  targetYBegin ],
						    [ targetXBegin + (targetTopWidth * 0.5),  targetYBegin ],
						    [ targetXEnd + (targetBottomWidth * 0.5), targetYEnd   ],
						    [ targetXEnd - (targetBottomWidth * 0.5), targetYEnd   ]
						];
    
						var spriteScale = targetScaleFactor * (1.0 - (this.offsetTop + this.offsetBottom));
			
						var verticalPosition = getPositionVertical(getGridElementPosition(gridElement));
						var equation = (this.gridAngle * 2.0) * power(verticalPosition, 2) - this.gridAngle + 1.0;
			
						var tempSimpleSpriteScale = position[1] + 0.5;
						var scaleFactor = 0.9;
						var simpleSpriteScale = min(1.0, max(1 + scaleFactor - position[1], 0.0));
						var spriteBlend = c_white;
						if (restoreBlendMode) {
						
							renderTexture(
								asset_texture_visu_player_glow,
								targetXBegin + ((targetXEnd - targetXBegin) / 2.0),
								targetYEnd,
								0,
								simpleSpriteScale,
								simpleSpriteScale,
								1.0
							);
						
							this.cameraData.guiX = targetXBegin + ((targetXEnd - targetXBegin) / 2.0);
							this.cameraData.guiY = targetYEnd;
						}
					
						if (this.isFlat) {
					
							drawSprite(
								sprite,
								targetXBegin + ((targetXEnd - targetXBegin) / 2.0),
								targetYEnd,
								simpleSpriteScale,
								simpleSpriteScale,
								1.0,
								0.0,
								c_white
							);
						} else {
					
							drawSpritePolygon(
								sprite,
								polygon2D,
								1.0
							);
						}
						#endregion
					}
					
					
					gpu_set_blendmode(bm_normal);
				}
				if (isEntity(playerGridElement, GridElement)) {
						var gridElement = playerGridElement;
						
						#region Calculate GridElement Coordinates
						var position = getGridElementPosition(gridElement);
						var pathXBegin = (getPositionHorizontal(position) * pixelTopLineWidth) + lineTopXBegin;
						var pathXEnd = (getPositionHorizontal(position) * pixelBottomLineWidth) + lineBottomXBegin;
						var pathLength = getDistanceBetweenCoords(pathXBegin, pathYBegin, pathXEnd, pathYEnd);
						var pathDirection = getAngleBetweenCoords(pathXBegin, pathYBegin, pathXEnd, pathYEnd);
				
						var sprite = getGridElementSprite(gridElement);
						var spriteAsset = getSpriteAssetIndex(sprite);
						var pixelSpriteWidth = getSpriteAssetWidth(spriteAsset);
						var pixelSpriteHeight = getSpriteAssetHeight(spriteAsset);
						var spriteWidth = pixelSpriteWidth / BASE_SCALE_RESOLUTION;
						var spriteHeight = pixelSpriteHeight / BASE_SCALE_RESOLUTION;
					
						gpu_set_blendmode(bm_normal)
		
						var verticalProjectionPowerFactor = clamp(this.gridAngle, 0.0, 1.0)		
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
						#endregion 
		
						#region Draw GridElement
						var polygon2D = [
						    [ targetXBegin - (targetTopWidth * 0.5),  targetYBegin ],
						    [ targetXBegin + (targetTopWidth * 0.5),  targetYBegin ],
						    [ targetXEnd + (targetBottomWidth * 0.5), targetYEnd   ],
						    [ targetXEnd - (targetBottomWidth * 0.5), targetYEnd   ]
						];
    
						var spriteScale = targetScaleFactor * (1.0 - (this.offsetTop + this.offsetBottom));
			
						var verticalPosition = getPositionVertical(getGridElementPosition(gridElement));
						var equation = (this.gridAngle * 2.0) * power(verticalPosition, 2) - this.gridAngle + 1.0;
			
						var tempSimpleSpriteScale = position[1] + 0.5;
						var scaleFactor = 0.9;
						var simpleSpriteScale = min(1.0, max(1 + scaleFactor - position[1], 0.0));
						var spriteBlend = c_white;
						if (restoreBlendMode) {
						
							renderTexture(
								asset_texture_visu_player_glow,
								targetXBegin + ((targetXEnd - targetXBegin) / 2.0),
								targetYEnd,
								0,
								simpleSpriteScale,
								simpleSpriteScale,
								1.0
							);
						
							this.cameraData.guiX = targetXBegin + ((targetXEnd - targetXBegin) / 2.0);
							this.cameraData.guiY = targetYEnd;
						}
					
						if (this.isFlat) {
					
							drawSprite(
								sprite,
								targetXBegin + ((targetXEnd - targetXBegin) / 2.0),
								targetYEnd,
								simpleSpriteScale,
								simpleSpriteScale,
								1.0,
								0.0,
								c_white
							);
						} else {
					
							drawSpritePolygon(
								sprite,
								polygon2D,
								1.0
							);
						}
						#endregion
				}
				#endregion
	
			gpuResetSurfaceTarget();
			#endregion
	
		}),
		updateBegin: method(this, function() {
		
			if (mouse_wheel_down()) {
			
				this.xScale -= 0.01;
				this.yScale = xScale
				print("xscale down", xScale);
			}
		
			if (mouse_wheel_up()) {
			
				this.xScale += 0.01;
				this.yScale = xScale;
				print("xscale up", xScale);
			}

			var gameRenderer = getGameRenderer();
			if ((gameRenderer != null) && 
				(getRendererResizeState(gameRenderer) == RendererResizeState.RESIZED)) {
				clearStack(this.separators);
			}
		
			this.verticalScreens = this.screens;
			this.horizontalScreens = this.screens;
			this.angleSwing = 0.0;
			if (this.swingGrid) {
				this.angleTheta = incrementTimer(this.angleTheta, pi * 2, 0.005 * getDeltaTimeValue());
				this.angleSwing = sin(this.angleTheta) * 6;
			}
		
			this.gridAngle = dcos(
				getAngleBetweenCoords(
					0.5 - (this.bottomLineWidth * 0.5), 
					1.0 - this.offsetBottom,
					0.5 - (this.topLineWidth * 0.5),
					this.offsetTop
				)
			);
		
			#region ColorTransformPipeline reactor
			var destroyColorTransformTasks = [];
			var colorTransformPipelineSize = getListSize(this.colorTransformPipeline);
			for (var index = 0; index < colorTransformPipelineSize; index++) {
				
				var	colorTransformTask = Core.Collections.Lists.get(this.colorTransformPipeline, index);
				var fieldName = getColorTransformTaskFieldName(colorTransformTask);
				var color = instanceVariableExists(this, fieldName) ? getInstanceVariable(this, fieldName) : null;
				if (color == null) {
					continue;	
				}
		
				if (transformColor(
						color, 
						getColorTransformTaskTargetColor(colorTransformTask),
						getColorTransformTaskChangeFactor(colorTransformTask)
					)) {
			
					destroyColorTransformTasks = pushArray(destroyColorTransformTasks, index);
				}
			}
	
			removeItemsFromList(this.colorTransformPipeline, destroyColorTransformTasks, destroyColorTransformTask);
			#endregion
	
			var key = createInstanceFieldModifierTaskKey(this, "wavePulseAmount");
			var pipeline = getSystemInstanceFieldModifierTaskPipeline();
			if (!mapContains(pipeline, key)) {
				this.wavePulseAmount = clamp(this.wavePulseAmount - (this.wavePulseFriction * getDeltaTimeValue()), this.wavePulseMinAmount, 512);		
			}

			if (this.cameraShake > 0) {
				this.cameraShake = clamp(this.cameraShake - (this.cameraShakeFactor * getDeltaTimeValue()), 0, BASE_SCALE_RESOLUTION)
			}
		
			this.GMObject.gridEventPipelineDispatcher(this.gridEventPipeline);
		}),
		cleanUp: method(this, function() {
		
			deregisterContext(this);
		
			destroySurface(this.gridSurface);
			destroySurface(this.gridWireSurface);
			destroySurface(this.gridWireframeSurface);
			destroySurface(this.gridElementSurface);
	
			destroyPipeline(this.gridEventPipeline);
	
			for (var index = 0; index < getPriorityQueueSize(this.gridElementPipeline); index++) {
				var gridElement = findMaxInPriorityQueue(this.gridElementPipeline);
				destroyGridElement(gridElement);
			}
			destroyDataStructure(this.gridElementPipeline, PriorityQueue, "Unable to destroy gridElementPipeline");

			destroyDataStructure(this.separators, Stack, "Unable to destroy separators stack");
			destroyDataStructure(this.separatorsBuffer, Stack, "Unable to destroy separatorsBuffer stack");
	
			for (var index = 0; index < getListSize(this.colorTransformPipeline); index++) {
				var colorTransformTask = Core.Collections.Lists.get(this.colorTransformPipeline, index);
				destroyColorTransformTask(colorTransformTask);	
			}
			destroyDataStructure(this.colorTransformPipeline, List, "Unable to destroy colorTransformPipeline");
		})
	}

	this.GMObject.create();
	
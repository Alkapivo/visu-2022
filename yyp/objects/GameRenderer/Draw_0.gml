///@description

	var screenWidth = isHandheld() ? global.viewWidth : global.guiWidth;
	var screenHeight = isHandheld() ? global.viewHeight : global.guiHeight;

	guardSurface(id, shaderSurface, "shaderSurface", global.viewWidth, global.viewHeight, true);
	guardSurface(id, gameSurface, "gameSurface", global.viewWidth, global.viewHeight, true);
	guardSurface(id, screenSurface, "screenSurface", screenWidth, screenHeight, true);
	
	#region Draw to gameSurface
	gpuSetSurfaceTarget(gameSurface);
	var gridRenderer = getGridRenderer();
	draw_clear_alpha(gridRenderer.colorGridBackground, 1.0);


	var backgroundAlphaMargin = 0.25;
	var backgroundAlpha = getSpriteAlpha(this.background);
	backgroundAlpha = clamp(backgroundAlpha + applyDeltaTime(), 0.0, 1.0 - backgroundAlphaMargin);
	setSpriteAlpha(this.background, backgroundAlpha);
	setSpriteAlpha(this.previousBackground, 1.0 - backgroundAlphaMargin - backgroundAlpha);

	if (getSpriteAlpha(this.previousBackground) > backgroundAlphaMargin) {
		
		var previousBackgroundScale = RealWidth > RealHeight 
			? RealWidth / getTextureWidth(getSpriteAssetIndex(previousBackground)) 
			: RealHeight / getTextureHeight(getSpriteAssetIndex(previousBackground)
		);
		drawSprite(
			previousBackground,
			RealWidth / 2.0,
			RealHeight / 2.0,
			previousBackgroundScale,
			previousBackgroundScale,
			getSpriteAlpha(previousBackground)	
		);
	}
	
	var backgroundScale = RealWidth > RealHeight 
		? RealWidth / getTextureWidth(getSpriteAssetIndex(background)) 
		: RealHeight / getTextureHeight(getSpriteAssetIndex(background)
	);
	drawSprite(
		background,
		RealWidth / 2.0,
		RealHeight / 2.0,
		backgroundScale,
		backgroundScale,
		getSpriteAlpha(background)
	);
	
	if (isOptionalPresent(this.foreground)) {
		
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
		
		this.firstBlendPointer = 8
		this.secondBlendPointer = 2
		//gpu_set_blendmode_ext(this.blendModes[this.firstBlendPointer], this.blendModes[this.secondBlendPointer]);
		gpu_set_blendmode(bm_add)
		var foregroundAlphaMargin = 0.0;
		var foregroundAlpha = getSpriteAlpha(this.foreground);
		foregroundAlpha = clamp(foregroundAlpha + applyDeltaTime(), 0.0, 1.0 - foregroundAlphaMargin);
		setSpriteAlpha(this.foreground, foregroundAlpha);
		
		foregroundTheta = incrementTimer(foregroundTheta, pi*2, 1 / (GAME_FPS * 3));
		cameraTheta = incrementTimer(cameraTheta, pi*2, 1 / (GAME_FPS * 5));
		var foregroundThetaFactor = 64;
		
		if (isOptionalPresent(this.previousForeground)) {
			
			setSpriteAlpha(this.previousForeground, 1.0 - foregroundAlphaMargin - foregroundAlpha)
			if (getSpriteAlpha(this.previousForeground) > foregroundAlphaMargin) {
		
				var previousForegroundScale = RealWidth > RealHeight 
					? RealWidth / getTextureWidth(getSpriteAssetIndex(this.previousForeground)) 
					: RealHeight / getTextureHeight(getSpriteAssetIndex(this.previousForeground)
				);
				drawSprite(
					this.previousForeground,
					(RealWidth / 2.0) + cos(foregroundTheta) * foregroundThetaFactor,
					(RealHeight / 2.0) + sin(foregroundTheta) * foregroundThetaFactor,
					previousForegroundScale * 1.1,
					previousForegroundScale * 1.1,
					getSpriteAlpha(previousForeground)	
				);
			}
		}
		
		var foregroundScale = RealWidth > RealHeight 
			? RealWidth / getTextureWidth(getSpriteAssetIndex(this.foreground))
			: RealHeight / getTextureHeight(getSpriteAssetIndex(this.foreground))
		drawSprite(
			this.foreground,
			(RealWidth / 2.0) + cos(foregroundTheta) * foregroundThetaFactor,
			(RealHeight / 2.0) + sin(foregroundTheta) * foregroundThetaFactor,
			foregroundScale * 1.1,
			foregroundScale * 1.1,
			getSpriteAlpha(this.foreground)
		);
		
		gpu_set_blendmode(bm_normal);
	}
	

	#region Render stars particles
		
	if (gridRenderer != null) {
		
		switch (starsRenderType) {
			case StarsRenderTypes.POINT:
			
				var invertedColorGridBackground = c_black;
				var colorGridBackground = getInstanceVariable(
					getGridRenderer(), 
					"colorGridBackground"
				);

				if (isNumber(colorGridBackground)) { // in gamemaker color is a number :)
	
					var red = clamp(255 - color_get_red(colorGridBackground), 0, 255);
					var green = clamp(255 - color_get_green(colorGridBackground), 0, 255);
					var blue = clamp(255 - color_get_blue(colorGridBackground), 0, 255);
					var invertedColorGridBackground = make_color_rgb(red, green, blue);
				}
			
				var intersectPosition = getLinesIntersectionPosition(
					[ gridRenderer.topLinePosition - (gridRenderer.topLineWidth * 0.5), gridRenderer.offsetTop ], 
					[ 0.5 - (gridRenderer.bottomLineWidth * 0.5), 1.0 - gridRenderer.offsetBottom ],
					[ gridRenderer.topLinePosition + (gridRenderer.topLineWidth * 0.5), gridRenderer.offsetTop ], 
					[ 0.5 + (gridRenderer.bottomLineWidth * 0.5), 1.0 - gridRenderer.offsetBottom ]);
							
				for (var index = 0; index < getArrayLength(stars); index++) {
					var star = stars[index];
							
					var starPosition = star[0];
					if (intersectPosition != null) {
						intersectPosition[@ 1] = intersectPosition[1] < -0.5 ? -0.5 : intersectPosition[1];
						var angle = getAngleBetweenPoints(star[0], intersectPosition) + 180;
						starPosition[0] += getXOnCircle(star[1], angle);
						starPosition[1] += getYOnCircle(star[1], angle);
					} else {
						starPosition[1] += 0.001;
					}
					if (starPosition[1] > 1.2) {
						star[3] = 0.2;
						starPosition = createPosition(
							((global.viewWidth * 0.5) + (random((global.viewWidth * 0.2) * 1000) / 1000) * choose(1, -1)) / global.guiWidth,
							(random((global.viewHeight * 0.2) * 1000) / 1000) / global.guiHeight);
					}
					star[0] = starPosition;
					if (star[3] < star[4]) {
						star[3] += 0.004;	
					}
							
					var starSize = star[2];
					var starAlpha = star[3];
					draw_sprite_ext(
						asset_sprite_star, 
						/*
						clamp(
							clamp(spriteNumber * starSize, 0.0, 1.0) -
							clamp(spriteNumber * starAlpha, 0.0, 1.0),
							0.0,
							1.0
						),
						*/
						0,//floor(random(spriteNumber)),
						starPosition[0] * ViewWidth, 
						starPosition[1] * ViewHeight,
						starSize,
						starSize,
						0,
						invertedColorGridBackground,
						starAlpha
					);
							
					stars[index] = star;
				}
				break;
		}
				
	}
	#endregion

	#region Render gridSurface
	var gridSurface = getGridRendererSurface();
	if (isOptionalPresent(gridSurface)) {
		var cameraShake = getGridRenderer().cameraShake;
			
		var xDirection = cos(cameraShake) > 0 ? 1 : -1;
		var yDirection = sin(cameraShake) > 0 ? 1 : -1;
		var xCameraShake = cameraShake > 0 ? 
			(random(cameraShake * 0.7) + (cameraShake * 0.3)) * xDirection :
			0.0;
		var yCameraShake = cameraShake > 0 ?
			(random(cameraShake * 0.7) + (cameraShake * 0.3)) * yDirection :
			0.0;
			
		gpuSetShader(shaderAbberation);
		
		var mousePositionFactor = 0.008;
		mouseXPosition = lerp(mouseXPosition, getMouseGuiX(), mousePositionFactor)
		mouseYPosition = lerp(mouseYPosition, getMouseGuiY(), mousePositionFactor)
		mouseXPosition = GuiWidth / 2.0;
		mouseYPosition = GuiHeight / 2.0;
		mouseXPosition = (GuiWidth / 2.0) + (sin(cameraTheta) * 64);
		mouseYPosition = (GuiHeight / 2.0) + (cos(cameraTheta) * 64);
		
		drawSurface(
			gridSurface,
			xCameraShake + (mouseXPosition - (GuiWidth / 2.0)),
			yCameraShake + (mouseYPosition - (GuiHeight / 2.0)),
			getGridRendererXScale(),
			getGridRendererYScale(),
			getGridRendererAngle() + gridRenderer.angleSwing,
			1.0,
			c_white,
			createPosition(0.5, 0.5));
		gpuResetShader();
	}
	#endregion

	#region Render bossManager.bossSurface
	var bossSurface = getBossManager().bossSurface;
	gpuSetShader(shaderAbberation);
	if (isSurfaceValid(bossSurface)) {
		drawSurface(
			bossSurface,
			0,
			0,
			getGridRendererXScale(),
			getGridRendererYScale(),
			getGridRendererAngle(),
			1.0,
			c_white,
			createPosition(0.5, 0.5));
	}
	gpuResetShader();
	#endregion
			
	gpuResetSurfaceTarget();
			
	#endregion

	#region Draw to shaderSurface
	var shaderPipelinesNamesSize = getListSize(shaderPipelinesNames);
	for (var index = 0; index < shaderPipelinesNamesSize; index++) {
		var shaderPipelineName = shaderPipelinesNames[| index];
		var shaderPipeline = shaderPipelines[? shaderPipelineName];
		
		var pipe = getShaderPipelinePipe(shaderPipeline);
		var buffer = getShaderPipelineBuffer(shaderPipeline);
		
		var pipeSize = getStackSize(pipe);
		for (var taskIndex = 0; taskIndex < pipeSize; taskIndex++) {
			var task = popStack(pipe);
			var state = getShaderTaskState(task);
			var shader = getShaderTaskShader(task);
			var uniformSetter = fetchShaderTaskUniformSetter(shader);
				
			if (uniformSetter != null) {
				
				var alpha = getShaderTaskAlpha(task);
				if (alpha > 0) {						
					// Render shader to texture
					gpuSetSurfaceTarget(shaderSurface);
					drawClear(COLOR_TRANSPARENT);
					gpuSetShader(shader);
						
					runScript(uniformSetter, this, state, gridSurface);
					//renderSurface(gameSurface);
					
					var mousePositionFactor = 0.001;
					mouseXPosition = lerp(mouseXPosition, getMouseGuiX(), mousePositionFactor)
					mouseYPosition = lerp(mouseYPosition, getMouseGuiY(), mousePositionFactor)
					mouseXPosition = GuiWidth / 2.0;
					mouseYPosition = GuiHeight / 2.0;
					mouseXPosition = (GuiWidth / 2.0) + (sin(cameraTheta) * 64);
					mouseYPosition = (GuiHeight / 2.0) + (cos(cameraTheta) * 64);
					
					drawSurface(
						gameSurface,
						xCameraShake + (mouseXPosition - (GuiWidth / 2.0)),
						yCameraShake + (mouseYPosition - (GuiHeight / 2.0)),
						getGridRendererXScale(),
						getGridRendererYScale(),
						0,//getGridRendererAngle() + gridRenderer.angleSwing,
						alpha,
						c_white,
						createPosition(0.5, 0.5)
					);
					
						
					gpuResetShader();
					gpuResetSurfaceTarget();
				} else {						
					gpuSetSurfaceTarget(shaderSurface);
						
					drawClear(COLOR_TRANSPARENT);
					drawSurface(gameSurface, 0, 0);
						
					gpuResetSurfaceTarget();
				}

				// Render texture
				gpuSetSurfaceTarget(gameSurface);
				drawSurface(shaderSurface, 0, 0, 1.0, 1.0, 0.0, alpha, c_white, [ 0.5, 0.5 ]);
				global.shaderPipeLimit = 2;
				if (pipeSize > global.shaderPipeLimit) {
						
					var gridRendererSurface = getGridRendererSurface();
					gpu_set_blendmode(bm_add);
					renderSurface(
						gridRendererSurface, 
						xCameraShake + (mouseXPosition - (GuiWidth / 2.0)),
						yCameraShake + (mouseYPosition - (GuiHeight / 2.0)),
						getGridRendererXScale(),
						getGridRendererYScale(), 
						getGridRendererAngle() + gridRenderer.angleSwing, 
						0.33,
						c_white,
						createPosition(0.5, 0.5)
					);
					gpu_set_blendmode(bm_normal);
				}
				gpuResetSurfaceTarget();
						
				pushStack(buffer, task);	
			}
		}
		
			
		// Push buffer to pipe
		var bufferSize = getStackSize(buffer);
		for (var taskIndex = 0; taskIndex < bufferSize; taskIndex++) {
			var task = popStack(buffer);
			pushStack(pipe, task);	
		}
	}
	#endregion
	
	if (getCamera().isMode3D) {

		draw_clear_alpha(c_black, 0.0);
		
		vertex_format_begin();
		vertex_format_add_position_3d();
		vertex_format_add_color();
		vertex_format_add_texcoord();
		var vertex_format = vertex_format_end();

		var v_buff = vertex_create_buffer();
		vertex_begin(v_buff, vertex_format);
		    vertex_position(v_buff, 10, 10);
		    vertex_colour(v_buff, c_white, 1);
		    vertex_texcoord(v_buff, 0, 0);

		    vertex_position(v_buff, 110, 10);
		    vertex_colour(v_buff, c_white, 1);
		    vertex_texcoord(v_buff, 1, 0);

		    vertex_position(v_buff, 110, 110);
		    vertex_colour(v_buff, c_white, 1);
		    vertex_texcoord(v_buff, 1, 1);
		vertex_end(v_buff);

		testSurface = getSurface(testSurface, 1280, 720, false);
		gpuSetSurfaceTarget(testSurface);
			draw_sprite(asset_sprite_spaceship, 0, 300, 300);
			draw_sprite(asset_sprite_spaceship, 0, 600, 300);
		gpuResetSurfaceTarget();

		
		
		//matrix_set(matrix_world, matrix_build(room_width, room_height, 0, 0, 0, 0, 1, 1, 1));
		//vertex_submit(v_buff, pr_trianglelist, surface_get_texture(screenSurface));
		//draw_sprite(asset_sprite_spaceship, 0, 600, 300);
		//draw_surface(getGridRenderer().gridSurface, 64, 64);
		//matrix_set(matrix_world, matrix_build_identity());
		
		draw_surface(getGridRenderer().gridElementSurface, 64, 64);
	} else {
		
		
	}

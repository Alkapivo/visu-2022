///@description GMObject.renderGUI

	if (getCamera().isMode3D) {
		exit;	
	}

	this.applicationSurface = getSurface(this.applicationSurface, GuiWidth, GuiHeight, true);
	this.screenSurface = getSurface(this.screenSurface, GuiWidth, GuiHeight, true);
	this.guiSurface = getSurface(this.guiSurface, GuiWidth, GuiHeight, true);
	this.jumbotronSurface = getSurface(this.jumbotronSurface, GuiWidth, GuiHeight, true);
	this.gameSurface = getSurface(this.gameSurface, ViewWidth, ViewHeight, true);


	gpu_set_texfilter(true);
	gpuSetSurfaceTarget(this.guiSurface);
	
	drawClear(COLOR_TRANSPARENT);
	
	gpuResetSurfaceTarget();

	#region Draw to jumbotronSurface
	gpuSetSurfaceTarget(this.jumbotronSurface);
	if (this.jumbotronEvent != null) {
		
		var jumbotronAlpha = 1.0;
		var jumbotronFadeTime = 0.2
		var duration = getJumbotronEventDuration(this.jumbotronEvent);
		if (this.jumbotronEventTimer < jumbotronFadeTime) {
		
			jumbotronAlpha = this.jumbotronEventTimer / jumbotronFadeTime
		}
		
		if (this.jumbotronEventTimer > duration - jumbotronFadeTime) {
			
			jumbotronAlpha = 1.0 - ((this.jumbotronEventTimer - (duration - jumbotronFadeTime)) / jumbotronFadeTime)
		}
		
		drawClear([ 0.77, 0.0, 0.21, jumbotronAlpha * 0.4]); // TODO getJumbotronEventBackgroundColor
		var jumbotronHandlerName = getJumbotronEventHandlerName(this.jumbotronEvent)
		switch (jumbotronHandlerName) {
			case "message":
				#region
				var gridColor = colorToGMColor(getGridRenderer().colorGridWheelTopLeft); 
				var positionX = 0.5 * GuiWidth;
				var positionY = 0.5 * GuiHeight;
				var font = asset_font_start_screen;
				draw_set_font(font);
				draw_set_halign(fa_middle);
				draw_set_valign(fa_center);
				
				var text = getJumbotronEventMessage(this.jumbotronEvent);
				var fontColorTopLeft = c_white;
				var fontColorTopRight= gridColor;
				var fontColorBottomRight = c_white;
				var fontColorBottomLeft = c_fuchsia;
				draw_text_color(
					positionX,
					positionY, 
					text,
					fontColorTopLeft,
					fontColorTopRight,
					fontColorBottomRight,
					fontColorBottomLeft,
					jumbotronAlpha);
				#endregion
				break;
		}

		this.jumbotronEventTimer = incrementTimer(this.jumbotronEventTimer, duration);
		if (timerFinished(this.jumbotronEventTimer)) {
			this.jumbotronEventTimer = 0.0;
			this.jumbotronEvent = createEmptyOptional();
		}
	} else {
		drawClear(COLOR_TRANSPARENT);	
	}

	gpuResetSurfaceTarget();
	#endregion

	#region Draw to screenSurface
	gpuSetSurfaceTarget(this.screenSurface);
	var verticalScreens = clamp(getGridRenderer().verticalScreens, 1.0, 32.0);
	var verticalScreensSize = ceil(verticalScreens);
	var horizontalScreens = clamp(getGridRenderer().horizontalScreens, 1.0, 32.0);	
	var horizontalScreensSize = ceil(horizontalScreens);
	for (var yIndex = 0; yIndex < verticalScreensSize; yIndex++) {
		
		for (var xIndex = 0; xIndex < horizontalScreensSize; xIndex++) {
			
			var applicationSurfaceWidth = round(GuiWidth / horizontalScreens);
			var applicationSurfaceHeight = round(GuiHeight / verticalScreens);
			drawSurfaceStretched(
				this.gameSurface, 
				xIndex * applicationSurfaceWidth,
				yIndex * applicationSurfaceHeight,
				applicationSurfaceWidth,
				applicationSurfaceHeight
			);
		}
	}
	
	var lyricsRenderer = getLyricsRenderer();
	if (isOptionalPresent(lyricsRenderer)) {
		if (lyricsRenderer.enableLyricsRenderer) {
			
			var lyricsSurface = lyricsRenderer.lyricsSurface;
			draw_set_alpha(lyricsRenderer.alpha)
			drawSurfaceStretched(lyricsSurface, 0, 0, GuiWidth, GuiHeight);
			draw_set_alpha(1.0);
		}
	}
	drawSurfaceStretched(guiSurface, 0, 0, GuiWidth, GuiHeight);
	drawSurfaceStretched(jumbotronSurface, 0, 0, GuiWidth, GuiHeight);
	gpuResetSurfaceTarget();
	#endregion
	
	#region Draw to applicationSurface
	gpuSetSurfaceTarget(applicationSurface);
	if (enableShaderCRT) {
		
		shaderCRTTimer = incrementTimer(shaderCRTTimer, 10, 1 / GAME_FPS)
		gpuSetShader(shaderCRT);
		gpuSetShaderUniformFloat(shaderCRTUniformEnableScanlines, shaderCRTUniformValueEnableScanlines);
	    gpuSetShaderUniformFloat(shaderCRTUniformSize, screenWidth, screenHeight, screenWidth, screenHeight);
		gpuSetShaderUniformFloat(shaderCRTUniformDistortionAmount, shaderCRTUniformValueDistortionAmount);
		gpuSetShaderUniformFloat(shaderCRTUniformCornerSize, shaderCRTUniformValueCornerSize);
		gpuSetShaderUniformFloat(shaderCRTUniformCornerSmoothness, shaderCRTUniformValueCornerSmoothness);
		gpuSetShaderUniformFloat(shaderCRTUniformBrightness, shaderCRTUniformValueBrightness);
		gpuSetShaderUniformFloat(shaderCRTUniformNoiseSize, shaderCRTUniformValueNoiseSize);
	    gpuSetShaderUniformFloat(shaderCRTUniformTimer, shaderCRTTimer);
			
		/*
		var _alpha = draw_get_alpha();
		var factor = 0.037;
		draw_set_alpha(factor);
		draw_rectangle_color(0, 0, GuiWidth, GuiHeight, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(_alpha);
		*/
		//drawSurfaceStretched(screenSurface, getMouseGuiX() - (GuiWidth / 2.0), getMouseGuiY() - (GuiHeight / 2.0), global.guiWidth, global.guiHeight);	
		drawSurfaceStretched(screenSurface, 0, 0, global.guiWidth, global.guiHeight);
		
		gpuResetShader();
	} else {

		/*
		var _alpha = draw_get_alpha();
		var factor = 0.037;
		draw_set_alpha(factor);
		draw_rectangle_color(0, 0, GuiWidth, GuiHeight, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(_alpha);
		*/
		//drawSurfaceStretched(screenSurface, getMouseGuiX() - (GuiWidth / 2.0), getMouseGuiY() - (GuiHeight / 2.0), global.guiWidth, global.guiHeight);	
		drawSurfaceStretched(screenSurface, 0, 0, global.guiWidth, global.guiHeight);
	}
	
	gpuResetSurfaceTarget();
	#endregion
	
	#region Render applicationSurface
	if (!getCamera().isMode3D) {
		
		//gpuSetShader(shaderAbberation);
		bktglitch_activate(GuiWidth, GuiHeight);
		__bktgtlich_pass_uniforms_from_ui();
		drawSurfaceStretched(applicationSurface, 0, 0, RealWidth, RealHeight);
		bktglitch_deactivate();
		//gpuResetShader();
	}
	#endregion
		
	if (global.isGameplayStarted) {
		
		var midiMatrixController = getInstanceVariable(getGameController(), "midiMatrixController");
		if (isStruct(midiMatrixController)) {
	
			var surface = midiMatrixController.surface;
			if (isSurfaceValid(surface)) {
			
				renderSurface(surface);
			}
		}
	
		var midiController = getGameController().midiMatrixController;
		var currentRecording = midiController.eventsRecorder.getCurrentRecording(midiController.eventsRecorder);
		if (isStruct(currentRecording)) {
		
			draw_rectangle_color(
				0.0 + 32,
				RealHeight - 32 - 24,
				0.0 + 32 + 24,
				RealHeight - 32,
				c_fuchsia,
				c_fuchsia,
				c_fuchsia,
				c_fuchsia,
				false
			)
		} else {
	
			draw_set_halign(fa_left);
			draw_set_valign(fa_bottom);
			draw_set_font(asset_font_ibm_ps2thin4);
			var gameplayData = getGameController().gameplayData;
			var text = stringParams(
				"Shroom counter:    {0}\n" +
				"Respawn counter:   {1}\n" +
				"Active shaders:    {2}\n",
				gameplayData.shroomCounter,
				gameplayData.respawnCounter,
				this.shaderPipeCurrentSize
			);
			
			var gameplayType = getPlayerManager().gameplayType;
			var controls = "";
			if (gameplayType == "bullethell") {
			
				controls = 
					"shoot:           Z / SPACE" + "\n" +
					"slow movement:   SHIFT" + "\n" +
					"use bomb:        X" + "\n" +
					"gamemode:        " + gameplayType + "\n" +
					"change gamemode: N" + "\n" +
					"random shader:   B" + "\n";
				
			} else if (gameplayType == "platformer") {
			
				controls = 
					"jump:            ARROW UP / SPACE" + "\n" +
					"gamemode:        " + gameplayType + "\n" +
					"change gamemode: N" + "\n" +
					"random shader:   B" + "\n";
			}
			
			renderTextOutline(controls, 32, RealHeight - 32, c_white, c_black);
		}

		var recording = midiController.eventsPlayer.recording;
		var currentRecording = midiController.eventsRecorder.getCurrentRecording(midiController.eventsRecorder);
		if (isStruct(currentRecording)) {
			recording = currentRecording;	
		}
		if (isStruct(recording)) {
				
			var soundInstanceId = global.__soundInstanceId;
			if (isAudio(soundInstanceId)) {
			
				
				var currentLength = recording.timer;
				var audioLength = audio_sound_length(soundInstanceId); //this.trackTimer; //rewind hack
				//logger("Recording timer: {0} {1} {2}", LogType.INFO, recording.timer, getGameplayTime(), audioLength);
				var barLength = (GuiWidth / 3);
				
				draw_set_color(c_white);
				draw_set_alpha(0.4);
				drawLine(
					(GuiWidth / 2) - (barLength / 2),
					GuiHeight - 32,
					(GuiWidth / 2) + (barLength / 2),
					GuiHeight - 32,
					1
				);
				
				draw_set_font(asset_font_ibm_ps2thin4);
				draw_set_halign(fa_right);
				draw_set_valign(fa_middle);
				
				var minutes = string(currentLength div 60);
				var seconds = string(currentLength mod 60);
				minutes = string_length(minutes) == 1
					? stringParams("0{0}", minutes) 
					: minutes
				seconds = floor(currentLength mod 60) < 10
					? stringParams("0{0}", seconds) 
					: seconds
				
				renderTextOutline(stringParams("{0}:{1}", minutes,seconds), (GuiWidth / 2) - (barLength / 2), GuiHeight - 32, c_white, c_black);
				
				draw_set_alpha(0.7);
				draw_set_color(c_fuchsia);
				drawLine(
					(GuiWidth / 2) - (barLength / 2),
					GuiHeight - 35,
					(GuiWidth / 2) - (barLength / 2) + (barLength * (currentLength / audioLength)),
					GuiHeight - 35,
					4
				);
				
				draw_set_alpha(1);
			}
		}
	}
	
	if (!global.isGameplayStarted) {
	
		var __color = draw_get_color();
		var __alpha = draw_get_alpha();
	
		draw_set_color(c_black);
		draw_set_alpha(0.9);
		draw_rectangle(0, 0, RealWidth, RealHeight, false);
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_font(asset_font_start_screen);
		draw_set_color(choose(c_white, c_white, c_white, c_white, c_white, c_white, c_fuchsia));
		draw_set_alpha(1.0);

		///@todo move to properties
		var title = getPropertyString("gameRenderer.start.title", "John doe");
		var subtitle = getPropertyString("gameRenderer.start.subtitle", "Lorem ipsum");
		var text = stringParams(
			"{0}\n{1}\n\n{2}        {3}\n\n{4}\n{5}",
			title,
			subtitle,
			"MOUSE CLICK TO",
			getRandomValueFromArray([
				"play    ", " play   ", "  play  ", "   play ", "    play"
			]),
			"",
			""
		);
		draw_text(
			(RealWidth / 2.0) + irandom(2), 
			(RealHeight / 2.0) + irandom(2), 
			text
		);
		
		draw_set_color(__color);
		draw_set_alpha(__alpha);
	}
	
	//this.bpmController.render(this.bpmController);
	
	if (global.isGameplayStarted) {
		if (!isStackEmpty(this.texturesStack)) {
	
			var texture = popStack(this.texturesStack);
			renderTexture(
				texture, 
				random(GuiWidth * 0.7), 
				random(GuiHeight * 0.7), 
				random(sprite_get_number(texture)),
				0.0,
				1.0,
				1.0,
				0.5
			);
		}
	}


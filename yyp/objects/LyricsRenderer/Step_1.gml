///@description Disable resize


	var screenWidth = isHandheld() ? global.viewWidth : global.guiWidth;
	var screenHeight = isHandheld() ? global.viewHeight : global.guiHeight;

	textVerticalMargin = screenWidth * 0.12;
	textHorizontalMargin = screenHeight * 0.06;
	
	if (!global.isGameplayStarted) {
		
		exit;
	}

	var lyricsTaskPipelineSize = getStackSize(lyricsTaskPipeline);
	/*
	if (lyricsTaskPipelineSize > 0) {
		lifespan = 0;
		duration = 0;
		enableLyricsRenderer = false;	
		clearList(lyricsPipeline);	
	}
	*/
	
	if (!lain01) {
	
		lain01 = true;
		pushStack(
			lyricsTaskPipeline,
			createLyricsEvent(
				global.__lyrics,
				4096, 
				0.11
			)
		);
	}

	for (var index = 0; index < lyricsTaskPipelineSize; index++) {
		var lyricsTask = popStack(lyricsTaskPipeline);
		
		lyrics = cloneArray(getLyricsEventLyrics(lyricsTask));
		lyrics = pushArray(lyrics, "");
		lifespan = getLyricsEventLifespan(lyricsTask);
		duration = getLyricsEventDuration(lyricsTask);
		alpha = 0.7;
		enableLyricsRenderer = true;
		addToList(lyricsPipeline, [ lyrics[index], 0 ]);
		destroyLyricsEvent(lyricsTask);
	}
	
	if (enableLyricsRenderer) {
		if (lifespan > 0) {
			lifespanTimer = incrementTimer(lifespanTimer, lifespan, 1 / GAME_FPS);
			if (lifespanTimer == 0.0) {
				lifespan = 0;			}
		} else {
			alpha -= 0.01;
			if (alpha < 0) {
				clearList(lyricsPipeline);
				duration = 0;
				enableLyricsRenderer = false;	
			}
		}
	}
	
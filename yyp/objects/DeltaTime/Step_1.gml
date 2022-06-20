///@description stepBegin()

	deltaTimePrevious = deltaTime;
	deltaTime = delta_time / deltaTimePrecision;
	
	if (deltaTime > 1 / minFps) {
		if (deltaTimeRestored) {
			deltaTime = 1 / minFps;	
		} else {
			deltaTime = deltaTimePrevious;
			deltaTimeRestored = true;
		}
	} else {
		deltaTimeRestored = false;	
	}
	
	global.deltaTime = clamp(deltaTime * GAME_FPS, 1.0, 5.0);

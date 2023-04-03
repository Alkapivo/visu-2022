///@description Initialize
	
	super();
	
	#region Fields
	
///@public:

	///@type {Boolean}
	enableLyricsRenderer = true;

	///@type {Pipeline<Struct>}
	lyricsPipeline = generatePipeline("lyricsEvent", Stack, Struct);
	
	///@type {Repository<LyricsTemplate>}
	lyricsRepository = createRepository("lyricsRepository", Entity, createMap());
	
	///@type {Surface}
	lyricsSurface = createSurface(GuiWidth, GuiHeight, true);
	
	///@type {Number}
	alpha = 1.0;
	
	///@type {Number}
	shake = {
		timer: 0.0,
		duration: 0.0,
		xOffset: 0.0,
		yOffset: 0.0,
	}
		
///@private:

	///@type {Reactor<Struct>}
	lyricsReactor = generateReactor("lyrics", List, Struct);
	#endregion
	
	GMObject = {
	
		state: getLyricsRenderer,
		lyricsPipelineHandler: method(this, function() {
			for (var lyricsEvent = getPipelineFirstElement(this.lyricsPipeline);
				iteratorFinish(lyricsEvent);
				lyricsEvent = getPipelineNextElement(this.lyricsPipeline)) {
				
				try {
					
					var lyrics = findInRepositoryById(fetchLyricsRepository(), lyricsEvent.name);
					if (!isStruct(lyrics)) {
						throw (stringParams("Lyrics weren't found: {0}", lyricsEvent.name));
					}
					
					var removeLyrics = false
					for (var lyricsJob = getReactorFirstElement(this.lyricsReactor);
						iteratorFinish(lyricsJob);
						lyricsJob = getReactorNextElement(this.lyricsReactor)) {
						
						if (lyricsJob.lyrics.name == lyricsEvent.name) {
							removeReactorElement(this.lyricsReactor);	
							removeLyrics = true;
						}
					}
					resolveReactor(this.lyricsReactor);
					if (removeLyrics) {
						continue;	
					}
					
					var lyricsJob = {
						timer: 0.0,
						linePointer: 0,
						charPointer: 0,
						lines: [],
						stringBuffer: "",
						lyrics: lyrics,
					}
					
					var wordwrappedLines = [];
					var areaWidth = (lyricsJob.lyrics.area.xEnd - lyricsJob.lyrics.area.xStart) * GuiWidth;
					
					if (lyricsJob.lyrics.useConsoleStackAsLines) {
						var trace = getConsoleTrace(getConsole());
						for (var traceIndex = 0; traceIndex < Core.Collections.Arrays.size(trace); traceIndex++) {
							
							var line = trace[traceIndex];
							if (isString(line)) {
								var wordwrappedLine = wordwrapString(line, areaWidth, "$_NEW_LINE", 1);
								wordwrappedLines = (stringContains(wordwrappedLine, "$_NEW_LINE"))
									? pushElementsToArray(wordwrappedLines, splitStringToArray(wordwrappedLine, "$_NEW_LINE"))
									: pushArray(wordwrappedLines, wordwrappedLine);
							}
						}
					} else {
						for (var lineIndex = 0; lineIndex < Core.Collections.Arrays.size(lyricsJob.lyrics.lines); lineIndex++) {
					
							var line = lyricsJob.lyrics.lines[lineIndex];
							var wordwrappedLine = wordwrapString(line, areaWidth, "$_NEW_LINE", 1);
							wordwrappedLines = (stringContains(wordwrappedLine, "$_NEW_LINE"))
								? pushElementsToArray(wordwrappedLines, splitStringToArray(wordwrappedLine, "$_NEW_LINE"))
								: pushArray(wordwrappedLines, wordwrappedLine);
						}
					}
					lyricsJob.lines = wordwrappedLines;
					
					addElementToReactor(this.lyricsReactor, lyricsJob);
					
				} catch (exception) {
					logger(exception.message, LogType.ERROR);
					printStackTrace();
				}
					
			}
		}),
		lyricsReactorHandler: method(this, function() {
			
			try {
				for (var lyricsJob = getReactorFirstElement(this.lyricsReactor);
					iteratorFinish(lyricsJob);
					lyricsJob = getReactorNextElement(this.lyricsReactor)) {
				
					lyricsJob.timer = incrementTimer(lyricsJob.timer, lyricsJob.lyrics.charInterval / GAME_FPS);
					if (timerFinished(lyricsJob.timer)) {
						var isBreak = false;
						repeat (lyricsJob.lyrics.charAmount) {
					
							var line = lyricsJob.lines[lyricsJob.linePointer];
							lyricsJob.charPointer = lyricsJob.charPointer + 1;
							if (lyricsJob.charPointer >= getStringLength(line)) {
					
								lyricsJob.charPointer = 0;
								lyricsJob.linePointer = lyricsJob.linePointer + 1;
							}
					
							if (lyricsJob.linePointer >= Core.Collections.Arrays.size(lyricsJob.lines)) {
					
								removeReactorElement(this.lyricsReactor);
								isBreak = true;
								break;
							}
					
							var linesSize = Core.Collections.Arrays.size(lyricsJob.lines);
							var areaHeight = (lyricsJob.lyrics.area.yEnd - lyricsJob.lyrics.area.yStart) * GuiHeight;
							var displayLines = areaHeight div lyricsJob.lyrics.linesPadding;
							var lineStartPointer = clamp(lyricsJob.linePointer - displayLines, 0, linesSize - 1);
							lyricsJob.stringBuffer = "";
							for (var lineIndex = lineStartPointer; lineIndex <= lyricsJob.linePointer; lineIndex++) {
						
								var line = lyricsJob.lines[lineIndex];
								lyricsJob.stringBuffer = appendToString(
									lyricsJob.stringBuffer, 
									(lineIndex == lyricsJob.linePointer)
										? string_copy(line, 0, lyricsJob.charPointer)
										: line, 
									true
								);
							}
						}
						if (isBreak) {
							continue;	
						}
					}
				}
			} catch (exception) {
				logger(exception.message, LogType.ERROR);
				printStackTrace();
				removeReactorElement(this.lyricsReactor);
			}
			
			resolveReactor(this.lyricsReactor);	
		}),
		create: method(this, function() {
			
			var lyricsJsonString = Core.File.read({ 
				path: "data", 
				filename: "lyrics.json", 
				withDialog: false 
			});
			parseJsonLyrics(lyricsJsonString)
		}),
		update: method(this, function() {
			
			this.GMObject.lyricsPipelineHandler();
			this.GMObject.lyricsReactorHandler();
		}),
		preRender: method(this, function() {
			
			this.lyricsSurface = getSurface(this.lyricsSurface, GuiWidth, GuiHeight, true);
			if (this.enableLyricsRenderer) {
				
				gpuSetSurfaceTarget(lyricsSurface);
				gpuSetShader(shaderAbberation);
				drawClear(COLOR_TRANSPARENT);
				for (var lyricsJob = getReactorFirstElement(this.lyricsReactor);
					iteratorFinish(lyricsJob);
					lyricsJob = getReactorNextElement(this.lyricsReactor)) {
					
					try {
						var xPosition = lyricsJob.lyrics.area.xStart * GuiWidth;
						var yPosition = lyricsJob.lyrics.area.yStart * GuiHeight;
						draw_set_font(lyricsJob.lyrics.font);
						draw_set_halign(fa_left);
						draw_set_valign(fa_top);
					
						if (lyricsJob.lyrics.horizontalAlign == "left") {
							xPosition = lyricsJob.lyrics.area.xStart * GuiWidth;
							draw_set_halign(fa_left);
						}
						if (lyricsJob.lyrics.horizontalAlign == "right") {
							xPosition = lyricsJob.lyrics.area.xEnd * GuiWidth;
							draw_set_halign(fa_right);
						}
						if (lyricsJob.lyrics.verticalAlign == "top") {
							yPosition = lyricsJob.lyrics.area.yStart * GuiHeight;
							draw_set_valign(fa_top);
						}
						if (lyricsJob.lyrics.verticalAlign == "bottom") {
							yPosition = lyricsJob.lyrics.area.yEnd * GuiHeight;
							draw_set_valign(fa_bottom);
						}
					
						var colorGridBackground = getInstanceVariable(fetchGridRenderer(), "colorGridBackground");
						var invertedColorGridBackground = colorGridBackground;

						if (isNumber(colorGridBackground)) { // in gamemaker color is a number :)
	
							var red = clamp(255 - color_get_red(colorGridBackground), 0, 255);
							var green = clamp(255 - color_get_green(colorGridBackground), 0, 255);
							var blue = clamp(255 - color_get_blue(colorGridBackground), 0, 255);
							invertedColorGridBackground = make_color_rgb(red, green, blue);
						}
							
						var color = lyricsJob.lyrics.useInvertedBackgroundColor
							? invertedColorGridBackground
							: lyricsJob.lyrics.color
						
						if (timerFinished(this.shake.timer)) {
							
							this.shake = {
								timer: 0.0,
								duration: 0.0,
								xOffset: 0.0,
								yOffset: 0.0,
							}
							
							if (random(1.0) > 1.0 - lyricsJob.lyrics.shakeProbability) {
								
								this.shake.duration = Core.Collections.Arrays.getRandomValue(lyricsJob.lyrics.shakeDuration);
								this.shake.timer = incrementTimer(this.shake.timer, this.shake.duration);
								this.shake.xOffset = choose(1, -1) * Core.Collections.Arrays.getRandomValue(lyricsJob.lyrics.shakeAmount);
								this.shake.yOffset = choose(1, -1) * Core.Collections.Arrays.getRandomValue(lyricsJob.lyrics.shakeAmount);
							}
						} else {
							
							this.shake.timer = incrementTimer(this.shake.timer, this.shake.duration);
						}
					
						if (string_length(lyricsJob.stringBuffer) > 0) {
							draw_text_ext_color(
								xPosition + this.shake.xOffset,
								yPosition + this.shake.yOffset,
								lyricsJob.stringBuffer,
								lyricsJob.lyrics.linesPadding,
								(lyricsJob.lyrics.area.xEnd - lyricsJob.lyrics.area.xStart) * GuiWidth,
								color,
								color,
								color,
								color,
								lyricsJob.lyrics.alpha
							);
						}
					} catch (exception) {
						logger(exception.message, LogType.ERROR);
						printStackTrace();
					}
				}
				gpuResetShader();
				gpuResetSurfaceTarget();
			}
			
		}),
		cleanUp: method(this, function() {
			
			super();
			destroySurface(this.lyricsSurface);
			destroyPipeline(this.lyricsPipeline);
			destroyReactor(this.lyricsReactor);
		})
	}
	
	this.GMObject.create();

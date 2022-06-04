///@description Initialize
	
	super();
	
	#region Fields
	
///@public:

	///@type {Stack<LyricsTask>}
	lyricsTaskPipeline = createStack();
		
///@private:

	///@type {Surface}
	lyricsSurface = createSurface(global.guiWidth, global.guiHeight, true);

	///@type {String[]}
	lyrics = [];

	///@type {List<LyricRow>}
	// TODO Entity
	lyricsPipeline = createList();

	///@type {Number}
	textVerticalMargin = 32;
	
	///@type {Number}
	textHorizontalMargin = 32;
	
	///@type {Number}
	textHeight = 22;
	
	///@type {Boolean}
	enableLyricsRenderer = true;
	
	///@type {Number}
	lifespan = 0.0;
	
	///@type {number}
	lifespanTimer = 0.0;
	
	///@type {Number}
	duration = 0.0;
	
	///@type {Number}
	durationTimer = 0.0;
	
	///@type {GMColor[]}
	colors = [
		make_color_rgb(255, 255, 255),
		make_color_rgb(245, 245, 235),
		make_color_rgb(235, 215, 235),
		make_color_rgb(255, 205, 195),
		make_color_rgb(255, 255, 255),
	];
	
	///@type {Number}
	alpha = 0.0;

	#endregion
	
	lain01 = false;

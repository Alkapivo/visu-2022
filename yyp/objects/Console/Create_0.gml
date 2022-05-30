///@description create()

	#region Fields
	
///@public:
	
	///@type {Boolean}
	isConsoleDisplayed = false;
	
	///@type {AssetFont}
	font = getAssetIndex(getProperty("console.fontName", "font_console"), AssetFont, font_console);
	
///@private:

	///@type {Integer}
	stackSize = real(getProperty("console.stackSize", 256));
	
	///@type {Integer{
	stackPointer = stackSize - 1;
	
	///@type {any[]}
	stack = createArray(stackSize, null);
	
	///@type {Boolean}
	hasStackChanged = false;
	
	///@type {any[]}
	///@description DO NOT acces this field directly. always use getter
	trace = createArray(stackSize, null); 
	
	///@type {Number}
	consoleHeight = 0;
	
	///@type {Number}
	consoleHeightAcc = 0;
	
	///@type {Number}
	consoleHeightMax = real(getProperty("console.height", 256));
	
	///@type {Number}
	margin = real(getProperty("console.margin", 8));
	
	///@type {Number}
	fontHeight = getFontHeight(font);
	
	///@type {Number}
	pageOffset = 0;
	
	///@type {GMColor}
	commandConsoleColor = colorHashToGMColor(getProperty("console.color.command", "3FFFFFF"));
	
	///@type {GMColor}
	outputConsoleColor = colorHashToGMColor(getProperty("console.color.output", "#4B96FF"));
	
	///@type {Map<String::GMColor>}
	consoleColors = createMap(
		[ "INFO    ", colorHashToGMColor(getProperty("console.color.logInfo","#4BFF7D")) ],
		[ "DEBUG   ", colorHashToGMColor(getProperty("console.color.logDebug","#FF197D")) ],
		[ "WARNING ", colorHashToGMColor(getProperty("console.color.logWarning","#FFFF32")) ],
		[ "ERROR   ", colorHashToGMColor(getProperty("console.color.logError","#FF3232")) ],
		[ ">", commandConsoleColor ]
	);
		
	///@type {Stack<any>}
	commandPipeline = createStack();
	
	///@type {List<any>}
	commandHistory = createList();
	
	///@type {Optional<Integer>}
	commandHistoryPointer = createEmptyOptional();
	
	///@type {Integer}
	commandHistoryMaxLength = real(getProperty("console.commandHistorySize", 100));
	
	///@type {Intger}
	tabPressCounter = 0;
	
	///@type {String}
	tabCommandHistory = "";
	
	///@type {Boolean}
	isCommandHistoryLoaded = false;
	
	///@type {String}
	promptChar = string(getProperty("console.promptChar", "_"));
	
	///@type {String}
	prompt = "";
	
	///@type {String}
	promptOffset = "";
	
	///@type {Number}
	keyboardPressedTime = 0;
	
	///@type {Number}
	keyboardPressedTimeOffset = 0;
	
	///@type {Timer}
	keyboardPromptPressedTime = 0;
	
	///@type {Boolean}
	isBeaverMode = false;
	
	///@type {Boolean}
	isBeaverModeIntent = false;
	
	#endregion
	
	registerContext(this);
	

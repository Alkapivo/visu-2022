///@description create()
	
	registerContext(this);
	
	#region Fields
	
///@public:
	
	///@type {String}
	path = working_directory + "log/";
	
	///@type {Integer}
	maxLogFiles = getProperty("loggerWriter.maxLogFiles", 10);
	
///@private:
	
	#endregion
	
	#region Initalize log file
	if (global.loggerWriterFilename == "") {
		
		createLogFile(path);
	}
	#endregion
	

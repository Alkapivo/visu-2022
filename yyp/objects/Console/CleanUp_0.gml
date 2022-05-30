///@description Destroy data structures
	
	destroyDataStructure(commandPipeline, Stack, "Unable to destroy command pipeline");	
	destroyDataStructure(commandHistory, List, "Unable to destroy command history");
	destroyDataStructure(consoleColors, Map, "Unable to destroy console colors");
	stack = null;
	trace = null;
	
	deregisterContext(this);
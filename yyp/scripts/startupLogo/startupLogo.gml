///@function startupLogo()
///@description Show startup logo
function startupLogo() {

	    var logo =  "     _         _                _                                      _            \n" +
	                "    /_\\____   | |              (_)                                    (_)           \n" +
	                "   _\\_____/   | |__   ___  _ __ _ _______  _ __ ______ ___ _ __   __ _ _ _ __   ___ \n" +
	                "  /__\\__\\     | '_ \\ / _ \\| '__| |_  / _ \\| '_ \\______/ _ \\ '_ \\ / _` | | '_ \\ / _ \\\n" +
	                " _____\\_/_    | | | | (_) | |  | |/ / (_) | | | |    |  __/ | | | (_| | | | | |  __/\n" +
	                "/_________\\   |_| |_|\\___/|_|  |_/___\\___/|_| |_|     \\___|_| |_|\\__, |_|_| |_|\\___|\n" +
	                "                                                                  __/ |             \n" +
	                "                                                                 |___/              ";
	
		addLogToLoggerWriter(logo);
		addLogToConsoleStack(getConsole(), logo);
	
		if (global.isLoggerEnabled) {
			show_debug_message(logo);
		}
		logger("Startup", LogType.INFO);


}

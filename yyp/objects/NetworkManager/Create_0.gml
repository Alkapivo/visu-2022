/// @description Initialize NetworkManager

	super();

	global.playerId = undefined;
	global.isNetworkingAvailable = true;
	
	net_init();
	net_connect(
		getProperty("networkManager.host.address"), 
		getProperty("networkManager.host.port")
	);
		
	net_cmd_add_handler("connected", handleConnect);
	net_cmd_add_handler("register", handleRegister);
	net_cmd_add_handler("unregister", handleUnregister);
	net_cmd_add_handler("message", handleMessage);
	
	networkPlayers = createMap();
	clients = createMap();
	respondPipeline = createStack();
	
	connectedTimer = 0;
/// @description Clean up

	super();

	destroyDataStructure(networkPlayers, Map, "Unable to destroy networkPlayers map");
	destroyDataStructure(clients, Map, "Unable to destroy clients map");
	
	global.isNetworkingAvailable = true;
	
///@description 

	for (var index = getListSize(players) - 1; index >= 0 ; index--) {
		var player = players[| index];
		deregisterPlayer(player);
		destroySpaacePlayer(player);
	}
	
	destroyDataStructure(players, List, "Unable to destroy players");
	
	super();
	

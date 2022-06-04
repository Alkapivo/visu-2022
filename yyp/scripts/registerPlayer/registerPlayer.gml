///@function registerPlayer(player)
///@description Add player to players list.
///@param {Player} player
function registerPlayer(argument0) {

		var player = argument0;
	
		var players = fetchPlayers();
	
		addToList(players, player);
		reduceList(players, null); // guard
	
		logger("Player {0} registered with index {1}", LogType.INFO, 
			getVisuPlayerName(player), getListSize(players) - 1);
	



}

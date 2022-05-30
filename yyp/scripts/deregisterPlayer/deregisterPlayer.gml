///@function deregisterPlayerByPlayer(player)
///@description Remove player from players list.
///@param {Player} player
function deregisterPlayer(argument0) {

		var player = argument0;
	
		var players = fetchPlayers();
		var index = findValueInList(players, player);
	
		if (index == null) {
			logger("Cannot deregister player {0}", LogType.ERROR, getSpaacePlayerName(player));
			return;
		}
	
		deleteFromList(players, index);
		reduceList(players, undefined); // guard
	
		logger("Player {0} deregistered", LogType.INFO, getSpaacePlayerName(player));
	



}

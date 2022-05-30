///@function deregisterPlayerByName(name)
///@description Remove player from players list.
///@param {String} name
function deregisterPlayerByName(argument0) {

		var playerName = argument0;
	
		var players = fetchPlayers();
	
		var foundIndex = null;
		for (var index = 0; index < getListSize(players); index++) {
			var player = players[| index];
			if (playerName == getSpaacePlayerName(player)) {
				foundIndex = index;
				break;
			}
		}
	
		if (foundIndex == null) {
			logger("Cannot deregister player {0}", LogType.ERROR, playerName);
			return;
		}
	
		deleteFromList(players, foundIndex);
		reduceList(players, undefined); // guard
	
		logger("Player {0} deregistered", LogType.INFO, playerName);
	



}

///@function deregisterPlayerByIndex(index)
///@description Remove player from players list.
///@param {Integer} index
function deregisterPlayerByIndex(argument0) {

		var index = argument0;
	
		var players = fetchPlayers();
	
		if (getListSize(players) < index) {
			logger("Cannot deregister player by index {0}. (max index: {1})", LogType.ERROR, index, getListSize(players));
			return;
		}
	
		deleteFromList(players, index);
		reduceList(players, undefined); // guard
	
		logger("Player with index {0} deregistered", LogType.INFO, index);
	



}

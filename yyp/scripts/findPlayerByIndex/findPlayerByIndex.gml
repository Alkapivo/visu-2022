///@function findPlayerByIndex(index)
///@description Return players
///@return {Optional<Player>} players
function findPlayerByIndex(argument0) {

		var index = argument0;

		var players = getPlayerManager().players;
	
		return (getListSize(players) > index) ? players[| index] : null;
	



}

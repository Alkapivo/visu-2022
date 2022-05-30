///@function handleRegister(jsonResponse)
///@description handler for connection
///@param {Map<String, Object>} jsonResponse
function handleRegister(argument0) {

		var response = argument0;
	
		var keys = getMapKeys(response);
		var asd = json_encode(response);
	
		global.playerId = response[? "playerId"];
		var clientId = response[? "clientId"];
		var networkManager = getNetworkManager();
		networkManager.clients[? clientId] = getSystem();
	
		net_cmd_add_handler("playerPosition", handleMessage);
		net_cmd_add_handler("unregister", handleUnregister);
	
		logger("Handle register. Player registered, playerId: {0} clientId: {1}", LogType.INFO, global.playerId, clientId);


}

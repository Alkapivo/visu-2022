///@function sendUnregister()
///@description send unregister command to server
function sendUnregister() {

		var command = net_cmd_init("unregister");
		command[? "removePlayerId"] = string(global.playerId);
		net_cmd_send(command);
		logger("Send command unregister", LogType.INFO);


}

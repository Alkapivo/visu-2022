///@function sendRegister()
///@description send player position to server
function sendRegister() {

		var command = net_cmd_init("register");
		net_cmd_send(command);
		logger("Send command register", LogType.INFO);


}

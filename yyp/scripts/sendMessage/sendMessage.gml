///@function sendMessage(message)
///@description Send message to server.
///@param {String} message
function sendMessage(argument0) {

		var message = argument0;

		var command = net_cmd_init("message");
		command[? "message"] = message;
	
		net_cmd_send(command);	
	



}

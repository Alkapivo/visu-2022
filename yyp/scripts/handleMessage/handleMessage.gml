function handleMessage(argument0) {

		var response = argument0;
	
		var message = response[? "message"];
		var author = response[? "author"];
	
		logger("{1}", LogType.NETWORK_MESSAGE, author, message);
		sendNotification(message, c_aqua);
	



}

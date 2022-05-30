///@description Resolver

	var netResponse = net_cmd_parse();

	if (isTJsonArray(netResponse)) {
		
		// TJSON Array
		
		var netResponseSize = array_length_1d(netResponse);
		for (var index = 0; index < netResponseSize; index++) {
			var response = netResponse[@ index];
			var command = tj_get(response, "command");
			var mapResponse = ds_map_create();
			var keys = tj_keys(response);
			for (var keyIndex = 0; keyIndex < array_length_1d(keys); keyIndex++) {
				var key = keys[keyIndex];
				var value = tj_get(response, key);
				mapResponse[? key] = value;
			}
			
			net_handle_command(command, mapResponse);
		}
	} else {
		
		// NetEvent
		
	    if (netResponse == NetEvent.CONNECT_FAIL) {
	        net_handle_command("connectFailed", "");
	    } else if (netResponse == NetEvent.DISCONNECT) {
	        net_handle_command("disconneded", "");
	    }
	}


	if (global.playerId == undefined) {
		
		sendRegister();
		connectedTimer = 180;
	}

///@function handleUnregister(jsonResponse)
///@description handler for connection
///@param {Map<String::Object>} jsonResponse
function handleUnregister(argument0) {

		var response = argument0;
	
		var removeClientId = response[? "removeClientId"];	
		if (removeClientId == undefined) {
			return;	
		}
		removeClientId = real(removeClientId);
	
		var networkManager = getNetworkManager();
		var clients = networkManager.clients;
		show_debug_message("Current clients");
		for (var key = ds_map_find_first(clients); !is_undefined(key); key = ds_map_find_next(clients, key)) {
			var value = clients[? key];
			show_debug_message(string(key) + ", " + string(value));
		}
		show_debug_message("removeClientId: " + string(removeClientId));
	
		if (removeClientId != undefined) {
		
			var player = undefined;
			for (var key = ds_map_find_first(clients); !is_undefined(key); key = ds_map_find_next(clients, key)) {
				var value = clients[? key];
				if (string(key) == string(removeClientId)) {
					show_debug_message("found!: " + string(key) + ", " + string(value));
					player = real(value);
				}
			}
	
			show_debug_message("Finally: " + string(player));
			if (player != undefined) {
				instance_destroy(player);
				ds_map_delete(clients, removeClientId);
			}
		}
	
		logger("Handle unregister. Player unregistered, clientId: " + string(removeClientId), LogType.INFO);


}

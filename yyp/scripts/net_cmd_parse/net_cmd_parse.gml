///@function parseServerCommand()
///@description Wrap data from async_load.
///@return {TJsonArray} || {NetEvent} // TODO WTF
function net_cmd_parse() {

		var netResponseType = findValueInMap(async_load, "type");
		var response = NetEvent.UNKNOWN;
	
		switch (netResponseType) {
		    case network_type_data:
			#region Wrap to TJSONArray, manually repair json (TODO on server side)
		        var netResponseBuffer = ds_map_find_value(async_load, "buffer");
				var netResponseData = "["
		        netResponseData += buffer_read(netResponseBuffer, buffer_string);
		        buffer_seek(netResponseBuffer, buffer_seek_start, 0);
				netResponseData = string_replace_all(netResponseData, "}{", "},{");
				netResponseData += "]";
		
				logger("Server raw data: {0}", LogType.DEBUG, netResponseData);
				var tjsonArray = tj_decode(netResponseData);
			
		        buffer_delete(netResponseBuffer);
			#endregion
		        response = tjsonArray;
				break;
		    case network_type_connect:
		    case network_type_non_blocking_connect:
				var isSucced = async_load[? "succeeded"];
		        global.patchwire_connectedStatus = isSucced;
				response = isSucced ? NetEvent.CONNECT : NetEvent.CONNECT_FAIL;
				break;
		    case network_type_disconnect:
		        global.patchwire_connectedStatus = false;
		        response = NetEvent.DISCONNECT;
				break;
		}
	
		return response;
	



}

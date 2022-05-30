///@function createNetworkManager(layerId)
///@description constructor for NetworkManager.
///@param {Layer} [layerId]
///@return {NetworkManager} networkManager
function createNetworkManager() {

		var networkManager = null;
		if (instance_exists(NetworkManager)) {
			logger("NetworkManager already initialized", LogType.WARNING);
			networkManager = getNetworkManager();
		} else {
			var renderLayer = argument_count > 0 ? argument[0] : getSystemLayer();
			networkManager = instance_create_layer(0, 0, renderLayer, NetworkManager);
			logger("NetworkManager initialized", LogType.INFO);
		}
		return networkManager;


}

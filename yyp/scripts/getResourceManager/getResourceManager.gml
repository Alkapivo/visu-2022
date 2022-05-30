///@function getResourceManager()
///@description Getter.
///@return {ResourceManager} resourceManager
function getResourceManager() {

		return global.resourceManagerContext == null ? createResourceManager() : global.resourceManagerContext;
	



}

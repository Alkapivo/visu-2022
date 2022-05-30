///@function getGridRendererEnableGridElementsRendering()
///@description Getter.
///@return {Boolean} enableGridElementsRendering
function getGridRendererEnableGridElementsRendering() {

		return getGridRenderer().enableGridElementsRendering;
	



}


function getGridRendererEnableGridRendering() {

	return getInstanceVariable(getGridRenderer(), "enableGridRendering");
}

function setGridRendererEnableGridRendering(value) {

	setInstanceVariable(getGridRenderer(), "enableGridRendering", value);
}
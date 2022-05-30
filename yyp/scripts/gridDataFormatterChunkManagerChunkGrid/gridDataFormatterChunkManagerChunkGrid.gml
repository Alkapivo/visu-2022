///@function gridDataFormatterChunkManagerChunkGrid(chunk)
///@description Formatter, used in WindowGrid.
///@param {Chunk} chunk
///@return {WindowGridValue} windowGridValue
function gridDataFormatterChunkManagerChunkGrid(argument0) {

		var chunk = argument0;
	
		var data = null;
		var type = getChunkState(chunk) == ChunkState_DEACTIVATED ? WindowGridValueType.NOONE : WindowGridValueType.RECTANGLE;
		var color = COLOR_BLUE;
		switch (getChunkState(chunk)) {
			case ChunkState_ACTIVATED:
				color = colorHashToColor("#00FF00");
				break;
			case ChunkState_ACTIVATING:
				color = colorHashToColor("#0000FF");
				break;
			case ChunkState_DEACTIVATING:
				color = colorHashToColor("#FF0000");
				break;
		}
	
		var windowGridValue = createWindowGridValue(data, type, color);
	
		return windowGridValue;
	
	


}

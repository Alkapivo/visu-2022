///@function dialogueActionDropItemHandler(data)
///@description Handler.
///@param {Map<String::Object>} data
///@return {Booolean} result
function dialogueActionDropItemHandler(argument0) {

		var data = argument0;
	
		var result = false;
	
		var itemId= getFromMap(data, "itemId");
		var amount = getFromMap(data, "amount");
	
		var item = generateItem(itemId, 1);
		if (!isEntity(item, Item)) {
			
			return result;
		}
	
		var sourceInventory = getPlayerInventory();
		if (!validateInventory(sourceInventory)) {
	
			return result;
		}
	
		consumeItemsInInventory(sourceInventory, getItemId(item), amount);
		if (isOptionalPresent(catchException())) {
	
			return result;
		}
	
		result = true;

		return result;
	



}

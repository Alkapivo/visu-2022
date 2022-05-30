///@function dialogueActionAddItemHandler(data)
///@description Handler.
///@param {Map<String::Object>} data
///@return {Booolean} result
function dialogueActionAddItemHandler(argument0) {

		var data = argument0;
	
		var result = false;
	
		var itemId = getFromMap(data, "itemId");
		var amount = getFromMap(data, "amount");
	
		var item = generateItem(itemId, amount);
		if (!isEntity(item, Item)) {
			
			return result;
		}
	
		var sourceInventory = getPlayerInventory();
		if (!validateInventory(sourceInventory)) {
	
			return result;
		}
	
		addToInventory(sourceInventory, item);
		clearException();
	
		result = true;

		return result;
	



}

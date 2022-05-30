///@function dialogueActionEqContainsHandler(data)
///@description Handler.
///@param {Map<String::Object>} data
///@return {Booolean} result
function dialogueActionEqContainsHandler(argument0) {

		var data = argument0;
	
		var result = false;
	
		var itemId = getFromMap(data, "itemId");
		var amount = getFromMap(data, "amount");
	
		var item = generateItem(itemId, 1);
		if (!isEntity(item, Item)) {
			
			return result;
		}
	
		var sourceInventory = getPlayerInventory();
		if (!validateInventory(sourceInventory)) {
	
			return result;
		}
	
		var itemCount = countItemInInventory(sourceInventory, itemId);
		if (itemCount >= amount) {
		
			result = true;	
		}

		return result;
	



}

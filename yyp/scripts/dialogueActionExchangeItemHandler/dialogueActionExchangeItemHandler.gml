///@function dialogueActionExchangeItemHandler(data)
///@description Handler.
///@param {Map<String::Object>} data
///@return {Booolean} result
function dialogueActionExchangeItemHandler(argument0) {

		var data = argument0;
	
		var result = false;
	
		var itemFrom = getFromMap(data, "itemFrom");
		var itemFromAmount = getFromMap(data, "itemFromAmount");
		var itemTo = getFromMap(data, "itemTo");
		var itemToAmount = getFromMap(data, "itemToAmount");
	
		var itemFrom = generateItem(itemFrom, itemFromAmount);
		var itemTo = generateItem(itemTo, itemToAmount);
	
		if (!isEntity(itemFrom, Item)) {
			
			return result;
		}
	
		if (!isEntity(itemTo, Item)) {
	
			return result;
		}
	
		var sourceInventory = getPlayerInventory();
		if (!validateInventory(sourceInventory)) {
	
			return result;
		}
	
		var itemFound = findInInventoryByItemId(sourceInventory, getItemId(itemFrom), itemFromAmount);
		if (!isEntity(itemFound, Item)) {
	
			return result;
		}
	
		removeFromInventory(sourceInventory, itemFound);
		if (isOptionalPresent(catchException())) {
	
			return result;
		}
	
		addToInventory(sourceInventory, itemTo);
		clearException();
		result = true;

		return true;


}

///@function convertGMJsonFieldToList(gmjsonField)
///@description Converter. Extracted List is flat (not recursive)
///@param {GMJsonField} gmjsonField
///@return {Optional<List<Object>>} list
function convertGMJsonFieldToList(argument0) {

		var gmJsonField = argument0;
	
		return isDataStructure(gmJsonField, List) ? cloneList(gmJsonField) : createEmptyOptional();
	



}

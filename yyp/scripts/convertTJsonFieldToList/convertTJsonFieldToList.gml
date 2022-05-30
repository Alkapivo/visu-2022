///@function convertTJsonFieldToList(tjsonField)
///@description Converter. Extracted list is flat (not recursive)
///@param {TJsonField} tjsonField
///@return {Optional<List<Object>>} list
function convertTJsonFieldToList(argument0) {
	
		var tjsonField = argument0;
	
		return isArray(tjsonField) ? convertArrayToList(tjsonField) : createEmptyOptional();
	



}

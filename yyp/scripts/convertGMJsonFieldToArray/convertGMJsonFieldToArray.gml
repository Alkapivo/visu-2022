///@function convertGMJsonFieldToArray(gmJsonField)
///@description Converter. Extracted array is flat (not recursive)
///@param {GMJsonField} gmJsonField
///@return {Optional<Object[]>} array - return null if gmJsonField wasn't recognized.
function convertGMJsonFieldToArray(argument0) {

		var gmJsonField = argument0;

		return isDataStructure(gmJsonField, List) ? convertListToArray(gmJsonField) : createEmptyOptional();
	



}

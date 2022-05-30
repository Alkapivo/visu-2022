///@function convertTJsonFieldToArray(tjsonField)
///@description Converter. Extracted array is flat (not recursive)
///@param {TJsonField} tjsonField
///@return {Optional<Object[]>} array
function convertTJsonFieldToArray(argument0) {

		var tjsonField = argument0;

		return isArray(tjsonField) ? cloneArray(tjsonField) : createEmptyOptional();
	



}

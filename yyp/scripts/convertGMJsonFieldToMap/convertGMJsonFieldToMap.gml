///@function convertGMJsonFieldToList(gmjsonField)
///@description Converter. Extracted Map is flat (not recursive)
///@param {GMJsonField} gmjsonField
///@return {Optional<Map<Object::Object>>} map
function convertGMJsonFieldToMap(argument0) {

		var gmJsonField = argument0;
	
		return isDataStructure(gmJsonField, Map) ? cloneMap(gmJsonField) : createEmptyOptional();
	



}

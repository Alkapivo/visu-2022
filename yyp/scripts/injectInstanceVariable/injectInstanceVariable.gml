///@function injectInstanceVariable(instance, name, value)
///@description Get instance variable. If instance doesn't contain specified field, then it will be initialized.
///@param {Instance} instance
///@param {String} name
///@param {T} value
///@return {T} value
function injectInstanceVariable(argument0, argument1, argument2) {

		var instance = argument0;
		var name = argument1;
		var value = argument2;
	
		var fieldValue = getInstanceVariable(instance, name);
		if (!isOptionalPresent(fieldValue)) {
		
			setInstanceVariable(instance, name, value);
			fieldValue = value;
		}
	
		return fieldValue;
	



}

///@param {T?Struct} struct
///@param {String} fieldName
///@return {any} variable
function getStructVariable(struct, fieldName) {

    return isStruct(struct) ? variable_struct_get(struct, fieldName) : createEmptyOptional();
}

function getValueFromStruct(struct, fieldName, defaultValue) {
	
	if (isStruct(struct)) {
		
		if (!structVariableExists(struct, fieldName)) {
		
			struct[$ fieldName] = defaultValue;
		}
		
		return struct[$ fieldName];
	} else {
	
		return defaultValue;
	}
}

///@param {T?Struct} struct
///@return {Optional<String[]>} names
function getStructVariableNames(struct) {

    return isStruct(struct) ? variable_struct_get_names(struct) : createEmptyOptional();
}

///@param {T?Struct} struct
///@param {String} fieldName
///@return {any} fieldValue
function injectStructVariable(struct, fieldName) {

    var fieldValue = argument_count > 2 ? argument[2] : null;
    if (!structVariableExists(struct, fieldName)) {

        setStructVariable(struct, fieldName, fieldValue);
    }

    return getStructVariable(struct, fieldName);
}

///@param {T?Struct} struct
///@param {String} fieldName
///@param {any} fieldValue
function setStructVariable(struct, fieldName, fieldValue) {

    if (isStruct(struct)) {
		
		variable_struct_set(struct, fieldName, fieldValue);
	}
}

///@param {T?Struct} struct
///@param {String} fieldName
///@return {Boolean} exists
function structVariableExists(struct, fieldName) {

    return isStruct(struct) ? variable_struct_exists(struct, fieldName) : false;
}

///@param {any} struct
///@return {Boolean} is
function isStruct(struct) {

	return is_struct(struct);
}


function Utils() constructor {
	static includes = function(arr, searchItem, comparator = function(a, b) { return a == b }) {
        var size = array_length(arr)
        var found = false
        for (var index = 0; index < size; index++) {
            var item = arr[index]
            if (comparator(item, searchItem)) {
                found = true
                break
            }
        }
        return found
    }	
}


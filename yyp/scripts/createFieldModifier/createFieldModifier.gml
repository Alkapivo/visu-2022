///@function createFieldModifier(name, type, value, duration)
///@description Constructor for FieldModifier entity.
///@param {String} name
///@param {GridEventFieldType} type
///@param {any} value
///@param {Optional<Number>} duration
///@return {FieldModifier} fieldModifier 
///@throws {Exception}
///@generated {2021-08-09T17:10:20.102Z}

function createFieldModifier(name, type, value, duration) {

	var fieldModifier = createEntity(FieldModifier);

	setFieldModifierName(fieldModifier, assertNoOptional(name));
	setFieldModifierType(fieldModifier, assertNoOptional(type));
	setFieldModifierValue(fieldModifier, assertNoOptional(value));
	setFieldModifierDuration(fieldModifier, duration);

	return fieldModifier;
	
}

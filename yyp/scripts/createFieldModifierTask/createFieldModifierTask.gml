///@function createFieldModifierTask(instance, fieldName, targetValue, factorValue, factorFrequency, currentTick)
///@description Constructor for FieldModifierTask entity.
///@param {Instance} instance
///@param {String} fieldName
///@param {Number} targetValue
///@param {Number} factorValue
///@param {Number} factorFrequency
///@param {Integer} currentTick
///@return {FieldModifierTask} fieldModifierTask 
///@throws {Exception}
///@generated {2020-09-22T10:33:22.255Z}
function createFieldModifierTask(argument0, argument1, argument2, argument3, argument4, argument5) {

		var instance = argument0;
		var fieldName = argument1;
		var targetValue = argument2;
		var factorValue = argument3;
		var factorFrequency = argument4;
		var currentTick = argument5;
	
		var fieldModifierTask = createEntity(FieldModifierTask);

		setFieldModifierTaskInstance(fieldModifierTask, assertNoOptional(instance));
		setFieldModifierTaskFieldName(fieldModifierTask, assertNoOptional(fieldName));
		setFieldModifierTaskTargetValue(fieldModifierTask, assertNoOptional(targetValue));
		setFieldModifierTaskFactorValue(fieldModifierTask, assertNoOptional(factorValue));
		setFieldModifierTaskFactorFrequency(fieldModifierTask, assertNoOptional(factorFrequency));
		setFieldModifierTaskCurrentTick(fieldModifierTask, assertNoOptional(currentTick));

		return fieldModifierTask;
	



}

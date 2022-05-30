///@export applyDeltaTime(Number): Number
///@export enableDeltaTime(Boolean)
///@export getDeltaTimeValue(): Number
///@export isDeltaTimeEnabled(): Boolean
///@export createDeltaTime(Layer): DeltaTime
///@export getDeltaTime(): DeltaTime

///@param {Number} [value=FRAME_MS]
///@return {Number} value
function applyDeltaTime() {
	
	var value = argument_count > 0 ? argument[0] : FRAME_MS;
	
	return getDeltaTimeValue() * value;
}

///@description Enable DeltaTime. If disabled then deltaTime will be equal to 1.0
///@param {Boolean} enable
function enableDeltaTime(enable) {

	setInstanceVariable(getDeltaTime(), "deltaTimeEnabled", enable);
}

///@function getDeltaTimeValue()
///return {Number} deltaTime
function getDeltaTimeValue() {

	return global.deltaTime;
}

///@return {Boolean} isDeltaTime
function isDeltaTimeEnabled() {

	return getInstanceVariable(getDeltaTime(), "deltaTimeEnabled") == true;
}

///@param {Layer} [layerId]
///@return {DeltaTime} deltaTime
function createDeltaTime() {

	var class = DeltaTime;
	var instanceLayer = argument_count > 0 ? argument[0] : getSystemLayer();
	
	var instance = defaultContextInstanceConstructor(class, "DeltaTime", instanceLayer);
	
	return instance;
}

///@return {DeltaTime} deltaTime
function getDeltaTime() {

	return global.deltaTimeContext;
}
///@description ArrayMap entity

///@function createArrayMap(keys, values)
///@description Constructor for ArrayMap entity.
///@param {T[]} [keys]
///@param {S[]} [values]
///@return {ArrayMap<T::S>} arrayMap 
///@throws {Exception}
///@generated {2020-07-01T13:57:12.819Z}
///@override
function createArrayMap() {

		var keys = argument_count > 0 ? argument[0] : [];
		var values = argument_count > 1 ? argument[1] : [];
	
		var arrayMap = createEntity(ArrayMap);

		setArrayMapKeys(arrayMap, assertNoOptional(keys));
		setArrayMapValues(arrayMap, assertNoOptional(values));

		return arrayMap;
	



}
///@function serializeArrayMap(arrayMap)
///@description Serialize ArrayMap to JSON string.
///@param {ArrayMap<T::S>} arrayMap
///@return {String} arrayMapJsonString 
///@throws {Exception}
///@generated {2020-07-01T13:57:12.819Z}
///@override
function serializeArrayMap(argument0) {

		var arrayMap = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"keys",
			getArrayMapKeys(arrayMap),
			Array);
	
		appendFieldToJsonObject(
			jsonObject,
			"values",
			getArrayMapValues(arrayMap),
			Array);
	
		var arrayMapJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return arrayMapJsonString;
	



}
///@function deserializeArrayMap(jsonString)
///@description Deserialize ArrayMap from JSON String to ArrayMap entity.
///@param {String} jsonString
///@return {ArrayMap<T::S>} arrayMap 
///@throws {Exception}
///@generated {2020-07-01T13:57:12.820Z}
///@override
function deserializeArrayMap(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var keys = getJsonObjectFieldValue(jsonObject, "keys");
		if (!isOptionalPresent(keys)) {
			logger("[deserializeArrayMap] Field \"keys\" is null". LogType.WARNING)
		}
		if (isJsonArray(keys)) {
			keys = cloneArray(getJsonArrayData(keys));
		} else {
			logger("[deserializeArrayMap] Field \"keys\" isn't an JsonArray", LogType.WARNING);
		}
	
		var values = getJsonObjectFieldValue(jsonObject, "values");
		if (!isOptionalPresent(values)) {
			logger("[deserializeArrayMap] Field \"values\" is null". LogType.WARNING)
		}
		if (isJsonArray(values)) {
			values = cloneArray(getJsonArrayData(values));
		} else {
			logger("[deserializeArrayMap] Field \"values\" isn't an JsonArray", LogType.WARNING);
		}
	

		return createArrayMap(keys, values);
	



}
///@function destroyArrayMap(arrayMap)
///@description Destroy ArrayMap entity.
///@param {ArrayMap<T::S>} arrayMap
///@throws {Exception}
///@generated {2020-07-01T13:57:12.820Z}
///@override
function destroyArrayMap(argument0) {

		var arrayMap = argument0;
	
		setArrayMapKeys(arrayMap, null);
		setArrayMapValues(arrayMap, null);
	



}
///@function getArrayMapKeys(arrayMap)
///@description Getter.
///@param {ArrayMap} arrayMap
///@return {Object[]} keys 
///@throws {Exception}
///@generated {2020-07-01T13:57:12.820Z}
function getArrayMapKeys(argument0) {

		return argument0[@ 0];
	



}

///@function getArrayMapValues(arrayMap)
///@description Getter.
///@param {ArrayMap} arrayMap
///@return {Object[]} values 
///@throws {Exception}
///@generated {2020-07-01T13:57:12.820Z}
function getArrayMapValues(argument0) {

		return argument0[@ 1];
	



}
///@function setArrayMapKeys(arrayMap, keys)
///@description Setter.
///@param {ArrayMap} arrayMap
///@param {Object[]} keys
///@throws {Exception}
///@generated {2020-07-01T13:57:12.821Z}
function setArrayMapKeys(argument0, argument1) {

		argument0[@ 0] = argument1;
	



}
///@function setArrayMapValues(arrayMap, values)
///@description Setter.
///@param {ArrayMap} arrayMap
///@param {Object[]} values
///@throws {Exception}
///@generated {2020-07-01T13:57:12.821Z}
function setArrayMapValues(argument0, argument1) {

		argument0[@ 1] = argument1;
	



}

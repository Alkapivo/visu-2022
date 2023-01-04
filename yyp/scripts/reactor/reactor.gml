///@description Reactor entity

///@function createReactor(name, data, type, elementType, iterator, isGCRequired)
///@description Constructor for Reactor entity.
///@param {Integer} name
///@param {Object} data
///@param {Integer} type
///@param {Class} elementType
///@param {Optional<Object>} iterator
///@param {Boolean} isGCRequired
///@return {Reactor} reactor 
///@throws {Exception}
///@generated {2020-10-13T17:18:45.132Z}
function createReactor(argument0, argument1, argument2, argument3, argument4, argument5) {

		var name = argument0;
		var data = argument1;
		var type = argument2;
		var elementType = argument3;
		var iterator = argument4;
		var isGCRequired = argument5;
	
		var reactor = createEntity(Reactor);

		setReactorName(reactor, assertNoOptional(name));
		setReactorData(reactor, assertNoOptional(data));
		setReactorType(reactor, assertNoOptional(type));
		setReactorElementType(reactor, assertNoOptional(elementType));
		setReactorIterator(reactor, iterator);
		setReactorIsGCRequired(reactor, assertNoOptional(isGCRequired));

		return reactor;
	



}
///@function serializeReactor(reactor)
///@description Serialize Reactor to JSON string.
///@param {Reactor} reactor
///@return {String} reactorJsonString 
///@throws {Exception}
///@generated {2020-09-16T10:38:11.478Z}
///@override
function serializeReactor(argument0) {

		var reactor = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"name",
			getReactorName(reactor));
		
	#region @override
		var type = getReactorType(reactor);
		switch (type) {
			case ReactorType_LIST:
				appendEntityToJsonObject(
					jsonObject,
					"data",
					getReactorData(reactor),
					getReactorElementType(reactor),
					List
				);
				break;
			case PipelineType_QUEUE:
				appendEntityToJsonObject(
					jsonObject,
					"data",
					getReactorData(reactor),
					getReactorElementType(reactor),
					Map
				);
				break;
		}
	#endregion
	
		appendFieldToJsonObject(
			jsonObject,
			"type",
			getReactorType(reactor));	
		appendFieldToJsonObject(
			jsonObject,
			"elementType",
			getReactorElementType(reactor));	
		appendFieldToJsonObject(
			jsonObject,
			"iterator",
			getReactorIterator(reactor));	
		appendFieldToJsonObject(
			jsonObject,
			"isGCRequired",
			getReactorIsGCRequired(reactor));	

		var reactorJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);
	
		return reactorJsonString;
	



}
///@function deserializeReactor(jsonString)
///@description Deserialize Reactor from JSON String to Reactor entity.
///@param {String} jsonString
///@return {Reactor} reactor 
///@throws {Exception}
///@generated {2020-09-16T10:38:11.478Z}
///@override
function deserializeReactor(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var name = assertNoOptional(getJsonObjectFieldValue(jsonObject, "name"));
		var type = assertNoOptional(getJsonObjectFieldValue(jsonObject, "type"));
	
	#region @override
		var data = createEmptyOptional();
		switch (type) {
			case ReactorType_LIST:
				data = assertNoOptional(getJsonObjectFieldValue(jsonObject, "data", List, getEntityClassName(type)));
				break;
			case ReactorType_MAP:
				data = assertNoOptional(getJsonObjectFieldValue(jsonObject, "data", Map, getEntityClassName(type)));
				break;
			default:
				logger("Found unsupported type in pipeline. Raw: {0}", LogType.ERROR, type);
				break;
		}
	#endregion
	
		var elementType = assertNoOptional(getJsonObjectFieldValue(jsonObject, "elementType"));
		var iterator = assertNoOptional(getJsonObjectFieldValue(jsonObject, "iterator"));
		var isGCRequired = assertNoOptional(getJsonObjectFieldValue(jsonObject, "isGCRequired"));

		destroyJsonObject(jsonObject);
	
		return createReactor(name, data, type, elementType, iterator, isGCRequired);
	



}
///@function destroyReactor(reactor)
///@description Destroy Reactor entity.
///@param {Reactor} reactor
///@throws {Exception}
///@generated {2020-09-16T10:38:11.478Z}
///@override
function destroyReactor(argument0) {

		var reactor = argument0;
	
		var name = getReactorName(reactor);
		var data = getReactorData(reactor);
		var type = getReactorType(reactor);
		var elementType = getReactorElementType(reactor);
		var iterator = getReactorIterator(reactor);
		var isGCRequired = getReactorIsGCRequired(reactor);
	#region @override destroy data
		var className = getEntityClassName(elementType);
		var destroyElementScript = getAssetIndex(stringParams("{0}{1}", "destroy", className), AssetScript);	
	
		switch (type) {
		#region ReactorType_LIST
			case ReactorType_LIST:
				if (isDataStructure(data, List)) {
					var listSize = getListSize(data);
					for (var index = 0; index < listSize; index++) {
						var element = data[| index];
						if (isEntity(element, elementType) && isOptionalPresent(destroyElementScript)) {
							runScript(destroyElementScript, element);	
						} else {
							logger("Unable to destroy reactor {0} element at index {1}", LogType.ERROR, name, index);	
						}
					}
					destroyDataStructure(data, List, "Unable to destroy reactor data: " + string(name));
				} else {
					logger("Found invalid data type in reactor {0}", LogType.ERROR, name);	
				}
				break;
		#endregion
		#region ReactorType_MAP
			case ReactorType_MAP:
				if (isDataStructure(data, Map)) {
					for (var key = mapFirst(data); iteratorFinish(key); key = mapNext(data, key)) {
						var element = data[? key];
						if (isEntity(element, elementType) && isOptionalPresent(destroyElementScript)) {
							runScript(destroyElementScript, element);	
						} else {
							logger("Unable to destroy reactor {0} element at key {1}", LogType.ERROR, name, key);	
						}
					}
					destroyDataStructure(data, Map, "Unable to destroy reactor data: " + string(name));
				} else {
					logger("Found invalid data type in reactor {0}", LogType.ERROR, name);	
				}
				break;
		#endregion
			default:
				logger("Found unsupported reactor type. Raw: {0}", LogType.ERROR, type);
				break;
		}
	#endregion
	

	



}
///@function getReactorData(reactor)
///@description Getter.
///@param {Reactor} reactor
///@return {Object} data 
///@throws {Exception}
///@generated {2020-09-16T10:38:11.478Z}
function getReactorData(argument0) {

		return argument0[@ 1];
	



}
///@function getReactorElementType(reactor)
///@description Getter.
///@param {Reactor} reactor
///@return {Class} elementType 
///@throws {Exception}
///@generated {2020-09-16T10:38:11.478Z}
function getReactorElementType(argument0) {

		return argument0[@ 3];
	



}

///@function getReactorIsGCRequired(reactor)
///@description Getter.
///@param {Reactor} reactor
///@return {Boolean} isGCRequired 
///@throws {Exception}
///@generated {2020-09-16T10:38:11.478Z}
function getReactorIsGCRequired(argument0) {

		return argument0[@ 5];
	



}
///@function getReactorIterator(reactor)
///@description Getter.
///@param {Reactor} reactor
///@return {Optional<Object>} iterator 
///@throws {Exception}
///@generated {2020-10-13T17:18:45.132Z}
function getReactorIterator(argument0) {

		return argument0[@ 4];
	



}
///@function getReactorName(reactor)
///@description Getter.
///@param {Reactor} reactor
///@return {Integer} name 
///@throws {Exception}
///@generated {2020-09-16T10:29:20.827Z}
function getReactorName(argument0) {

		return argument0[@ 0];
	



}


///@function getReactorType(reactor)
///@description Getter.
///@param {Reactor} reactor
///@return {Integer} type 
///@throws {Exception}
///@generated {2020-09-16T10:38:11.478Z}
function getReactorType(argument0) {

		return argument0[@ 2];
	



}
///@function setReactorData(reactor, data)
///@description Setter.
///@param {Reactor} reactor
///@param {Object} data
///@throws {Exception}
///@generated {2020-09-16T10:38:11.478Z}
function setReactorData(argument0, argument1) {

		argument0[@ 1] = argument1;
	



}
///@function setReactorElementType(reactor, elementType)
///@description Setter.
///@param {Reactor} reactor
///@param {Class} elementType
///@throws {Exception}
///@generated {2020-09-16T10:38:11.478Z}
function setReactorElementType(argument0, argument1) {

		argument0[@ 3] = argument1;
	



}
///@function setReactorIsGCRequired(reactor, isGCRequired)
///@description Setter.
///@param {Reactor} reactor
///@param {Boolean} isGCRequired
///@throws {Exception}
///@generated {2020-09-16T10:38:11.478Z}
function setReactorIsGCRequired(argument0, argument1) {

		argument0[@ 5] = argument1;
	



}
///@function setReactorIterator(reactor, iterator)
///@description Setter.
///@param {Reactor} reactor
///@param {Optional<Object>} iterator
///@throws {Exception}
///@generated {2020-10-13T17:18:45.132Z}
function setReactorIterator(argument0, argument1) {

		argument0[@ 4] = argument1;
	



}
///@function setReactorName(reactor, name)
///@description Setter.
///@param {Reactor} reactor
///@param {Integer} name
///@throws {Exception}
///@generated {2020-09-16T10:29:20.827Z}
function setReactorName(argument0, argument1) {

		argument0[@ 0] = argument1;
	



}
///@function setReactorType(reactor, type)
///@description Setter.
///@param {Reactor} reactor
///@param {Integer} type
///@throws {Exception}
///@generated {2020-09-16T10:38:11.478Z}
function setReactorType(argument0, argument1) {

		argument0[@ 2] = argument1;
	



}

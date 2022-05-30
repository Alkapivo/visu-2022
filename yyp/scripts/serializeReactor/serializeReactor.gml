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

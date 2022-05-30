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

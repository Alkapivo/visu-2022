///@function _forEach(collection, collectionType, handler)
///@description This function will execute handler on every entry of passed collection.
///@param {Array<T>|ArrayMap<any::T>|Grid<T>|List<T>|Map<any::T>} collection
///@param {DataStructure~~IterableCollection} collectionType
///@param {AssetScript<T::any>} handler
///@param {Instance<S>} [context]
///@throws {InvalidDataStructureException|NotImplementedException}
function _forEach(argument0, argument1, argument2) {
	
		var collection = argument0;
		var collectionType = argument1;
		var handler = argument2;
	
		if (!isDataStructure(collection, collectionType)) {
			throwException(
				createException(
					InvalidDataStructureException,
					"Invalid collection type was provided to forEach"
				)
			);
			return;
		}
	
		switch (collectionType) {
		#region Array
			case Array:
				var arrayLength = getArrayLength(collection);
				for (var index = 0; index < arrayLength; index++) {
					var element = collection[@ index];
					runScript(handler, element, index);
				}
				break;
		#endregion
		#region ArrayMap
			case ArrayMap:
				var arrayMapSize = getArrayMapSize(collection);
				var keys = getArrayMapKeys(collection);
				var values = getArrayMapValues(collection);
				for (var index = 0; index < arrayMapSize; index++) {
					var key = keys[@ index];
					var element = values[@ index];
					runScript(handler, element, key);
				}
				break;
		#endregion
		#region Grid
			case Grid:
				var gridWidth = getGridWidth(collection);
				var gridHeight = getGridHeight(collection);
				for (var rowIndex = 0; rowIndex < gridHeight; rowIndex++) {
					for (var collumnIndex = 0; collumnIndex < gridWidth; collumnIndex++) {
						var element = collection[# collumnIndex, rowIndex];
						runScript(handler, element, rowIndex, collumnIndex);
					}
				}
				break;
		#endregion
		#region List
			case List:
				var listSize = getListSize(collection);
				for (var index = 0; index < listSize; index++) {
					var element = collection[| index];
					runScript(handler, element, index);
				}
				break;
		#endregion
		#region Map
			case Map:
				for (var key = mapFirst(collection); iteratorFinish(key); key = mapNext(collection, key)) {
					var element = collection[? key];
					runScript(handler, element, key);
				}
				break;
		#endregion
			default:
				throwException(
					createException(
						NotImplementedException,
						stringParams("Collection type isn't supported in forEach { \"collectionType\": {0} }\"", collectionType)
					)
				)
				return;
		}
	



}

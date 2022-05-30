///@function mapCollection(collection, collectionType, mapCollectionType, handler)
///@description This function will return an iterable collection of entries that have passed handler predicate.
///@param {Array<T>|ArrayMap<any::T>|List<T>|Map<any::T>} collection
///@param {DataStructureType~IterableCollection} collectionType
///@param {DataStructureType~IterableCollection} mapCollectionType
///@param {AssetScript~Collectionhandler<T>} handler
///@return {Optional<Array<T>|ArrayMap<any::T>|List<T>|Map<any::T>>} filteredCollection
///@throw {InvalidDataStructureExceptio|NotImplementedException}
function mapCollection() {

		throwException(
			createException(
				RuntimeException,
				"NOT IMPLEMENTED IN 2.2.5"
			)
		);
		return null;

		///checkArgumentCount(3, argument_count, filterCollection)
		var collection = argument[0];
		var collectionType = argument[1];
		var mapCollectionType = argument[2];
		var handler = argument[3];
	
		if (!isDataStructure(collection, collectionType)) {
			throwException(
				createException(
					InvalidDataStructureException,
					"Invalid collection type was provided to filterCollection"
				)
			);
			return createEmptyOptional();
		}
	
		var returnCollection = createEmptyOptional();
		switch (collectionType) {
		#region Array
			case Array:
				var elementBuffer = createQueue();
				var arrayLength = getArrayLength(collection);
				for (var index = 0; index < arrayLength; index++) {
					var element = collection[@ index];
					var result = runScript(handler, element, index);
					if (isException()) {
						break;	
					}
				
					if (result) {
						pushQueue(elementBuffer, element);	
					}
				}
			
				returnCollection = convertQueueToArray(elementBuffer);
				destroyDataStructure(elementBuffer, Queue);
				break;
		#endregion
		#region ArrayMap
			case ArrayMap:
				returnCollection = createArrayMap([], []);
				var keys = getArrayMapKeys(collection);
				var keysLength = getArrayLength(keys);
				for (var index = 0; index < keysLength; index++) {
					var key = keys[index];
					var element = getValueFromArrayMap(collection, key);
					var result = runScript(handler, element, key);
					if (isException()) {
						break;	
					}
				
					if (result) {
						addToArrayMap(returnCollection, key, element);	
					}
				}
				break;
		#endregion
		#region List
			case List:
				returnCollection = createList();
			
				var listSize = getListSize(collection);
				for (var index = 0; index < listSize; index++) {
					var element = collection[| index];
					var result = runScript(handler, element, this);
					if (isException()) {
						break;	
					}
				
					if (result) {
						addToList(returnCollection, element);	
					}
				}
				break;
		#endregion
		#region Map
			case Map:
				returnCollection = createMap();
				for (var key = mapFirst(collection); iteratorFinish(key); key = mapNext(collection, key)) {
					var element = collection[? key];
					var result = runScript(handler, element, this);
					if (isException()) {
						break;	
					}
				
					if (result) {
						addToMap(returnCollection, key, element);	
					}
				}
				break;
		#endregion
			default:
				throwException(
					createException(
						NotImplementedException,
						stringParams("Collection type isn't supported in forEach { \"collectionType\": {0} }\"", collectionType)
					)
				);
				break;
		}
	
		return returnCollection;

	


}

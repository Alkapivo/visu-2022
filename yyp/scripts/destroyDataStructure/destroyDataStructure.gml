///@function destroyDataStructure(dataStructure, dataType, errorMessage)
///@description destroy data structure
///@param {?DataStructure} dataStructure
///@param {DataStructure} dataType
///@param {String} [errorMessage]
///@throws {InvalidDataStructureException}
///@return {null} 
function destroyDataStructure() {

		///checkArgumentCount(2, argument_count, destroyDataStructure);

		var dataStructure = argument[0];
		var dataType = argument[1];
		var errorMessage = argument_count > 2 ? argument[2] : null;
	
		if (isDataStructure(dataStructure, dataType)) {
			switch (dataType) {
				case Grid:
					destroyGrid(dataStructure);
					break;
				case List:
					destroyList(dataStructure);
					break;
				case Map:
					destroyMap(dataStructure);
					break;
				case PriorityQueue:
					destroyPriorityQueue(dataStructure);
					break;
				case Queue:
					destroyQueue(dataStructure);
					break;
				case Stack:
					destroyStack(dataStructure);
					break;
			}
		} else {
			throwException(
				createException(
					InvalidDataStructureException,
					errorMessage == null ? 
						stringParams("Unable to destroy data structure. { \"dataStructureType\": \"{0}\" }", dataType) : 
						errorMessage
				)
			);
		}
	
		return createEmptyOptional();
	



}

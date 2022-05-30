///@function createLinkedList(size, defaultValue)
///@description Constructor.
///@param {Integer} size
///@param {Object} defaultValue
///@return {Optional<LinkedList>} linkedList
///@throws {Exception}
function createLinkedList() {

		///checkArgumentCount(1, argument_count, createLinkedList);

		var size = argument[0];
		var defaultValue = argument_count > 1 ? argument[1] : null;
	
		var linkedList = createEmptyOptional();
		if (size <= 0) {
			throwException(
				createException(
					InvalidSizeException,
					"Size must be larger than 0, when creating a LinkedList"
				)
			);
			return linkedList;
		}
	
		throwException(
			createException(
				NotImplementedException,
				"LinkedList not implemented"
			)
		);
		return createEmptyOptional();
	
		linkedList = createLinkedListNode(defaultValue, null, null);
		for (var index = 0; index < size; index++) {
			var linkedListNode = index == 0 ? linkedList : createLinkedListNode(defaultValue, null, null);
			if (index >= 1) {
				
			}
		}
	


}

///@function createViewElement(object)
///@description Constructor for ViewElement entity.
///@param {GenericEntity} object
///@return {ViewElement} viewElement 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.746Z}

function createViewElement(object) {

	var viewElement = createEntity(ViewElement);

	setViewElementObject(viewElement, assertNoOptional(object));

	return viewElement;
	
}

///@function destroyViewElement(viewElement)
///@description Destroy ViewElement entity.
///@param {ViewElement} viewElement
///@throws {Exception}
///@generated {2021-05-01T23:43:42.758Z}

function destroyViewElement(viewElement) {


	
	var object = getViewElementObject(viewElement);
	
	destroyGenericEntity(object);
	setViewElementObject(viewElement, null);
	

	
}

///@description

	super();
	
	for (var index = 0; index < getListSize(shrooms); index++) {
		var shroom = shrooms[| index];
		destroyShroom(shroom);
	}
	destroyDataStructure(shrooms, List, "Unable to destroy shrooms");
	
	for (var key = mapFirst(shroomShaderEventTemplates); iteratorFinish(key); key = mapNext(shroomShaderEventTemplates, key)) {
		var shaderEvent = shroomShaderEventTemplates[? key];
		destroyShaderEvent(shaderEvent);
	}
	destroyDataStructure(shroomShaderEventTemplates, Map, "Unable to destroy shroomShaderEventTemplates");
	

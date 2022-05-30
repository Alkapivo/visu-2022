///@description

	super();
	
	for (var index = 0; index < getListSize(shroomEmitters); index++) {
		var shroomEmitter = shroomEmitters[| index];
		destroyShroomEmitter(shroomEmitter);
	}
	destroyDataStructure(shroomEmitters, List, "Unable to destroy shroomEmitters");
	

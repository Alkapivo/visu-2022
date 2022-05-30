///@description 

	super();
	
	if (isEntity(factRepository, Repository)) {
		destroyRepository(factRepository);	
	} else {
		logger("Couldn't destroy factRepository", LogType.WARNING);	
	}
	
	
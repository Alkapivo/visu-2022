///@description cleanUp()
	
	super();

	if (isEntity(mouseActionReactor, Reactor)) {
		destroyReactor(mouseActionReactor);
	}
	
	if (isEntity(mouseActionEventPipeline, Pipeline)) {
		destroyPipeline(mouseActionEventPipeline);	
	}
	
	if (isEntity(mouseViewContainers, Repository)) {
		destroyRepository(mouseViewContainers);	
	}
	
	destroyDataStructure(mouseViewContainersOrder, List);
	

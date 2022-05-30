///@description
	
	for (var index = 0; index < getListSize(bullets); index++) {
		var bullet = bullets[| index];
		destroyBullet(bullet);	
	}
	destroyDataStructure(bullets, List, "Unable to destroy bullets");

	super();
	

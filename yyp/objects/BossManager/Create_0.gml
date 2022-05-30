///@description
	
	super();
	
	#region Fields
///@public:

	///@type {Stack<BossEvent>}
	bossEventPipeline = createStack();
	
	///@type {List<Boss>}
	bosses = createList();
		
	///@type {Stack<Boss>}
	destroyBossPipeline = createStack();
	
	bossSurface = createSurface(global.viewWidth, global.viewHeight);
		
///@private:
	
	#endregion

///@description Initialize FactManager

	super();
	
	#region Fields
	
	#macro FieldFactManager_factRepository "factRepository"
	
///@public:

	///@type {AssetScript}
	storeHandler = storeFactManagerHandler;
	
	///@type {AssetScript}
	restoreHandler = restoreFactManagerHandler;
	
	///@type {Repository<Fact>}	
	factRepository = createRepository(FieldFactManager_factRepository, "Fact", createMap());
		
///@private:
	
	///@type {Boolean}
	logDebug = getPropertyBoolean("factManager.logDebug", false);
	
	#endregion
	

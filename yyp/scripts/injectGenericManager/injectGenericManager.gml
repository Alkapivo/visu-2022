///@function injectGenericManager(beanName, className)
///@description Generator.
///@param {String} beanName
///@param {Class<T>} className
///@return {Optional<T?GenericManager>}
///@throws {InjectException}
function injectGenericManager(argument0, argument1) {

		var beanName = argument0;
		var className = argument1;
	
		var genericManager = construct(className);
	
		var managerPrototype = findInRepositoryById(getManagerPrototypeRepository(), beanName);
		if (!isEntity(managerPrototype)) {
	
			throwException(
				createException(
					InjectException,
					stringParams("Unable to inject bean. { \"beanName\": \"{0}\", \"className\": \"{1}\" }", beanName, getClassName(className))
				)
			);
			return;
		}
		var newManagerPrototype = cloneEntity(managerPrototype);
	
	#region Apply context to create
		var createMethodIntents = getManagerPrototypeCreate(newManagerPrototype);
		if (isArray(createMethodIntents)) {
	
			for (var index = 0; index < getArrayLength(createMethodIntents); index++) {
		
				var methodIntent = createMethodIntents[@ index];
				setMethodIntentContext(methodIntent, genericManager);
			
				var methodIntentName = getAssetName(getMethodIntentHandler(methodIntent), AssetScript);
				setMethodIntentHandlerName(methodIntent, methodIntentName);
			}
		}
	#endregion
	
	#region Apply context to step
		var stepMethodIntents = getManagerPrototypeStep(newManagerPrototype);
		if (isArray(stepMethodIntents)) {
	
			for (var index = 0; index < getArrayLength(stepMethodIntents); index++) {
		
				var methodIntent = stepMethodIntents[@ index];
				setMethodIntentContext(methodIntent, genericManager);
			
				var methodIntentName = getAssetName(getMethodIntentHandler(methodIntent), AssetScript);
				setMethodIntentHandlerName(methodIntent, methodIntentName);
			}
		}
	#endregion
	
	#region Apply context to cleanUp
		var cleanUpMethodIntents = getManagerPrototypeCleanUp(newManagerPrototype);
		if (isArray(cleanUpMethodIntents)) {
	
			for (var index = 0; index < getArrayLength(cleanUpMethodIntents); index++) {
		
				var methodIntent = cleanUpMethodIntents[@ index];
				setMethodIntentContext(methodIntent, genericManager);
			
				var methodIntentName = getAssetName(getMethodIntentHandler(methodIntent), AssetScript);
				setMethodIntentHandlerName(methodIntent, methodIntentName);
			}
		}
	#endregion
	
	#region Apply context to eventDispatcher
		var eventDispatcherMethodIntent = getManagerPrototypeEventDispatcher(newManagerPrototype);
		if (isEntity(eventDispatcherMethodIntent, MethodIntent)) {
	
			setMethodIntentContext(methodIntent, genericManager);
		
			var methodIntentName = getAssetName(getMethodIntentHandler(methodIntent), AssetScript);
			setMethodIntentHandlerName(methodIntent, methodIntentName);
		}
	#endregion
	
	#region Apply context to taskDispatcher
		var taskDispatcherMethodIntent = getManagerPrototypeTaskDispatcher(newManagerPrototype);
		if (isEntity(eventDispatcherMethodIntent, MethodIntent)) {
		
			setMethodIntentContext(methodIntent, genericManager);
		
			var methodIntentName = getAssetName(getMethodIntentHandler(methodIntent), AssetScript);
			setMethodIntentHandlerName(methodIntent, methodIntentName);
		}
	#endregion
	
	#region Default constructor
		setInstanceVariable(genericManager, FieldGenericManager_managerPrototype, newManagerPrototype);
	#endregion
	
	#region Run create methods
		var createMethodIntents = getManagerPrototypeCreate(newManagerPrototype);
		runMethodIntents(createMethodIntents);
	#endregion
	
		logger("Generic manager injected. { \"beanName\": \"{0}\", \"className\": \"{1}\" }", LogType.DEBUG, beanName, className);
		return genericManager;
	



}

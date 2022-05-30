///@function cast(object, type)
///@description Check if object is type of.
///@param {any} object
///@param {Type} typeOf
///@return {Optional<any>} object isValid = object if is valid, otherwise isValid = empty optional.
function cast(argument0, argument1) {

		var object = argument0;
		var type = argument1;
	
		var baseType = getTypeOfBase(type);
		var nestedType = getTypeOfNested(type);
	
		var isValid = false;
	
		switch (baseType) {
		#region Primitive
			case Primitive:
				switch (nestedType) {
					case any:
						isValid = true;
						break;
					case Boolean:
						isValid = isBoolean(object);
						break;
					case Integer:
						isValid = isNumber(object);
						break;
					case Number:
						isValid = isNumber(object);
						if (!isValid) {
					
							debugger;
						}
						break;
					case String:
						isValid = isString(object);
						break;
				}	
				break;
		#endregion
		#region any
			case any:
				isValid = true;
				break;
		#endregion
		#region Instance
			case Instance:
				isValid = isOptionalPresent(nestedType) ?
					isInstanceTypeOf(object, nestedType) :
					isInstance(object)
				break;
		#endregion
		#region JsonString
			case JsonString:
				if ((isString(object)) && 
					(isNestedType(nestedType))) {
				
					var firstAttempt = string(object);
					var tjsonObject = tj_decode(object);
					if (tjsonObject == tj_error) {
					
						object = "\"" + string(object) + "\"";
						tjsonObject = tj_decode(object);
					} else {
					
						object = firstAttempt;
					}
				
					if (tjsonObject != tj_error) {
					
						var jsonStringBaseType = getTypeOfBase(nestedType);
						var jsonStringNestedType = getTypeOfNested(nestedType);
					
						if (isNestedType(jsonStringNestedType)) {
						#region
							if (jsonStringBaseType == Collection) {
								var collectionType = getTypeOfBase(jsonStringNestedType);
								var entryType = getTypeOfNested(jsonStringNestedType);
								if ((isNestedType(entryType)) &&
									(getTypeOfBase(entryType) == Entity)) {
								
									var entityClass = getTypeOfNested(entryType);	
									switch (collectionType) {
										case Array:
										
											object = convertTJsonFieldToEntityArray(tjsonObject, getEntityClassName(entityClass));
											isValid = isOptionalPresent(object);
											break;
										case List:
											object = convertTJsonFieldToEntityList(tjsonObject, getEntityClassName(entityClass));
											isValid = isOptionalPresent(object);
											break;
										case Map:
											object = convertTJsonFieldToEntityMap(tjsonObject, getEntityClassName(entityClass));
											isValid = isOptionalPresent(object);
											break;
										case Stack:
											object = convertTJsonFieldToEntityStack(tjsonObject, getEntityClassName(entityClass));
											isValid = isOptionalPresent(object);
											break;
										case Grid:
											object = convertTJsonFieldToEntityGrid(tjsonObject, getEntityClassName(entityClass));
											isValid = isOptionalPresent(object);
											break;
										case Queue:
											object = convertTJsonFieldToEntityQueue(tjsonObject, getEntityClassName(entityClass));
											isValid = isOptionalPresent(object);
											break;
										case PriorityQueue:
											object = convertTJsonFieldToEntityPriorityQueue(tjsonObject, getEntityClassName(entityClass));
											isValid = isOptionalPresent(object);
											break;
									}
								}
							}
						#endregion
						} else {
							switch (jsonStringBaseType) {
								case Primitive:
								#region Resolve tjson mapping
									var primitiveType = getTypeOfNested(nestedType);
									switch (primitiveType) {
										case any:
											break;
										case Boolean:
											tjsonObject = convertTJsonBooleanToBoolean(tjsonObject);
											break;
										case Integer:
										case Number:
											if (typeof(tjsonObject) == "number") {
											
												tjsonObject = tjsonObject;
											} else if (isString(tjsonObject) & string_is_real(tjsonObject)) {
												tjsonObject = real(tjsonObject);
											
											} else {
											
												tjsonObject = null;
											}
											break;
										case String:
											break;
									}
								#endregion
									var primitive = cast(tjsonObject, nestedType);
									isValid = isOptionalPresent(primitive);
									object = primitive;
									break;
								case Entity:
									var deserializeHandler = getEntityClassDeserializeHandler(nestedType);
									var entity = runScript(deserializeHandler, object);
									var exception = catchException();
									isValid = (isOptionalPresent(exception)) || 
										(!isEntity(entity, jsonStringNestedType));
									object = entity;
									break;
								case Collection:
									var collection = cast(tjsonObject, nestedType);
									isValid = (isOptionalPresent(collection)) &&
										(isDataStructure(collection, jsonStringNestedType));
									object = collection;
									break;
							}
						}
					}
				}
				break;
		#endregion
		#region Entity
			case Entity:
				isValid = isOptionalPresent(nestedType) ?
					isEntity(object, nestedType) :
					isEntity(object)
				break;
		#endregion
		#region Collection
			case Collection:
				var collectionType = getTypeOfBase(nestedType);
				var collectionEntryType = getTypeOfNested(nestedType);
				switch (collectionType) {
					case Array:
						isValid = isArray(object);
						break;
					case ArrayMap:
						isValid = isEntity(object, ArrayMap);
						break;
					case Grid:
						isValid = isDataStructure(object, Grid);
						break;
					case List:
						isValid = isDataStructure(object, List);
						break;
					case Map:
						isValid = isDataStructure(object, Map);
						break;
					case PriorityQueue:
						isValid = isDataStructure(object, PriorityQueue);    
						break;
					case Queue:
			    		isValid = isDataStructure(object, Queue);
						break;
					case Stack:
			    		isValid = isDataStructure(object, Stack);
						break;
				}
				break;
		#endregion
		}
	
		return isValid ? object : createEmptyOptional();
	
	


}

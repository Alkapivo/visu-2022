///@function createTiledLayerFromGMJsonObject(gmJsonObject)
///@description Constructor for TiledLayer entity.
///@param {Map<any::any>} gmJsonObject
///@return {Optional<TiledLayer>} tiledLayer
function createTiledLayerFromGMJsonObject(argument0) {

		var gmJsonObject = argument0;
	
		var tiledLayer = createEmptyOptional();
	
		var name = assertNoOptional(gmJsonObject[? "name"]); 
		var opacity = assertNoOptional(gmJsonObject[? "opacity"]);
		var type = assertNoOptional(gmJsonObject[? "type"]);
		var xPos = assertNoOptional(gmJsonObject[? "xPos"]);
		var yPos = assertNoOptional(gmJsonObject[? "yPos"]);
		var properties = gmJsonObject[? "properties"];
		if (isDataStructure(properties, Map)) {
			
			properties = cloneMap(properties);
		} else {
			
			properties = createEmptyOptional();
		}
	
	
		var data = gmJsonObject[? "data"];
		var width = gmJsonObject[? "width"];
		var height = gmJsonObject[? "height"];
	
		var objectsArray = createEmptyOptional();
		var objects = gmJsonObject[? "objects"];
		if (isDataStructure(objects, List)) {
		
			var objectsSize = getListSize(objects);
			objectsArray = createArray(objectsSize);
			for (var index = 0; index < objectsSize; index++) {
		
				var object = objects[| index];
				if (!isDataStructure(object, Map)) {
			
					throwException(
						createException(
							ParseException,
							"Unable to parse TiledLayer object"
						)
					);
					break;
				}
			
				var objectProperties = object[? "properties"]
				if (isDataStructure(objectProperties, Map)) {
			
					objectProperties = cloneMap(objectProperties);
				} else {
			
					objectProperties = createEmptyOptional();
				}
			
				var tiledObject = createTiledObject(
					object[? "type"],
					object[? "name"],
					object[? "texture"],
					object[? "xPos"],
					object[? "yPos"],
					objectProperties
				);
			
				if (isException()) {
			
					break;
				}
			
				objectsArray[@ index] = tiledObject;
			}
		}
		
		var vertexBufferGroupsArray = createEmptyOptional();
		var vertexBufferGroups = gmJsonObject[? "vertexBufferGroups"];
		if (isDataStructure(vertexBufferGroups, List)) {
		
			var vertexBufferGroupsSize = getListSize(vertexBufferGroups);
			vertexBufferGroupsArray = createArray(vertexBufferGroupsSize);
			for (var layerIndex = 0; layerIndex < vertexBufferGroupsSize; layerIndex++) {
		
				var vertexBufferGroupObject = vertexBufferGroups[| layerIndex];
				if (!isDataStructure(vertexBufferGroupObject, Map)) {
				
					throwException(
						createException(
							ParseException,
							"Unable to parse TiledLayer vertexBufferGroup"
						)
					);
					break;
				}
			
				var chunkCoordObject = vertexBufferGroupObject[? "chunkCoord"];
				if (!isDataStructure(chunkCoordObject, Map)) {
				
					throwException(
						createException(
							ParseException,
							"Unable to parse TiledLayer vertexBufferGroup chunkCoord"
						)
					);
					break;
				}
			
				var chunkCoord = createTuple(chunkCoordObject[? "key"], chunkCoordObject[? "value"]);
				if (isException()) {
			
					break;
				}
			
				var objectBufferObject = vertexBufferGroupObject[? "objectBuffer"];
				if (!isDataStructure(objectBufferObject, List)) {
				
					throwException(
						createException(
							ParseException,
							"Unable to parse TiledLayer vertexBufferGroup objectBuffer"
						)
					);
					break;
				}
				var objectBufferSize = getListSize(objectBufferObject);
				var objectBuffer = createArray(objectBufferSize);
				for (var index = 0; index < objectBufferSize; index++) {
				
					var vertexObjectBufferObject = objectBufferObject[| index];
					if (!isDataStructure(vertexObjectBufferObject, Map)) {
				
						throwException(
							createException(
								ParseException,
								"Unable to parse TiledLayer vertexBufferGroup vertexObjectBuffer"
							)
						);
						break;
					}
					var coordsList = vertexObjectBufferObject[? "coords"];
					if (!isDataStructure(coordsList, List)) {
						throwException(
							createException(
								ParseException,
								"Unable to parse TiledLayer vertexBufferGroup vertexObjectBuffer - coords"
							)
						);
						break;
					}
					var coords = convertListToArray(coordsList);
			
					var vertexObjectBuffer = createVertexObjectBuffer(
						vertexObjectBufferObject[? "isFlat"],
						vertexObjectBufferObject[? "texture"],
						coords
					);
				
					if (isException()) {
			
						break;
					}
				
					objectBuffer[@ index] = vertexObjectBuffer;
				
				}
			
				if (isException()) {
			
					break;
				}
			
				var vertexBufferGroup = createVertexBufferGroup(
					chunkCoord, 
					vertexBufferGroupObject[? "type"], 
					objectBuffer
				);
			
				if (isException()) {
			
					break;
				}
			
				vertexBufferGroupsArray[@ layerIndex] = vertexBufferGroup;
			}
		}
	
		var tiledLayersArray = createEmptyOptional();
		var tiledLayers = gmJsonObject[? "layers"];
		if (isDataStructure(tiledLayers, List)) {
	
			var tiledLayersSize = getListSize(tiledLayers);
			tiledLayersArray = createArray(tiledLayersSize);
			for (var index = 0; index < tiledLayersSize; index++) {
			
				var nestedTiledLayer = tiledLayers[| index];
				if (!isDataStructure(nestedTiledLayer, Map)) {
			
					throwException(
						createException(
							ParseException,
							"Unable to parse TiledLayer object"
						)
					);
					break;
				}
			
				var parsedTiledLayer = createTiledLayerFromGMJsonObject(nestedTiledLayer);
				if (isException()) {
			
					break;
				}
			
				tiledLayersArray[@ index] = parsedTiledLayer;
			}
		}
	
		if (isException()) {
	
			return tiledLayer;
		}
	
		tiledLayer = createTiledLayer(name, opacity, type, xPos, yPos, properties, data, width, height, objectsArray, vertexBufferGroupsArray, tiledLayersArray);
	
		return tiledLayer;
	



}

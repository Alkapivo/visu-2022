///@function createGridElement(position, sprite, info)
///@description Constructor for GridElement entity.
///@param {Position} position
///@param {Sprite} sprite
///@param {GridElementInfo} info
///@return {GridElement} gridElement 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.593Z}

function createGridElement(position, sprite, info) {

	var gridElement = createEntity(GridElement);

	setGridElementPosition(gridElement, assertNoOptional(position));
	setGridElementSprite(gridElement, assertNoOptional(sprite));
	setGridElementInfo(gridElement, assertNoOptional(info));

	return gridElement;
	
}

///@function createPosition(horizontal, vertical)
///@description Constructor for Position entity.
///@param {Number} horizontal
///@param {Number} vertical
///@return {Position} position 
///@throws {Exception}
///@generated {2020-09-28T21:11:14.761Z}
function createPosition(argument0, argument1) {

		var horizontal = argument0;
		var vertical = argument1;
	
		var position = createEntity(Position);

		setPositionHorizontal(position, assertNoOptional(horizontal));
		setPositionVertical(position, assertNoOptional(vertical));

		return position;
	



}

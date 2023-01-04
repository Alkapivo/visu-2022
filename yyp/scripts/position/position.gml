///@description Position entity

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
///@function serializePosition(position)
///@description Serialize Position to JSON string.
///@param {Position} position
///@return {String} positionJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:40.724Z}
function serializePosition(argument0) {

		var position = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"horizontal",
			getPositionHorizontal(position));	
		appendFieldToJsonObject(
			jsonObject,
			"vertical",
			getPositionVertical(position));	

		var positionJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return positionJsonString;
	



}
///@function deserializePosition(jsonString)
///@description Deserialize Position from JSON String to Position entity.
///@param {String} jsonString
///@return {Position} position 
///@throws {Exception}
///@generated {2020-09-28T21:11:14.762Z}
function deserializePosition(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var horizontal = assertNoOptional(getJsonObjectFieldValue(jsonObject, "horizontal"));
		var vertical = assertNoOptional(getJsonObjectFieldValue(jsonObject, "vertical"));

		destroyJsonObject(jsonObject);
	
		return createPosition(horizontal, vertical);
	



}
///@function destroyPosition(position)
///@description Destroy Position entity.
///@param {Position} position
///@throws {Exception}
///@generated {2020-09-28T21:11:14.762Z}
function destroyPosition(argument0) {

		var position = argument0;
	
		var horizontal = getPositionHorizontal(position);
		var vertical = getPositionVertical(position);
	

	



}
///@function getPositionHorizontal(position)
///@description Getter.
///@param {Position} position
///@return {Number} horizontal 
///@throws {Exception}
///@generated {2020-09-28T21:11:14.762Z}
function getPositionHorizontal(argument0) {

		return argument0[@ 0];
	



}
///@function getPositionVertical(position)
///@description Getter.
///@param {Position} position
///@return {Number} vertical 
///@throws {Exception}
///@generated {2020-09-28T21:11:14.762Z}
function getPositionVertical(argument0) {

		return argument0[@ 1];
	



}
///@function setPositionHorizontal(position, horizontal)
///@description Setter.
///@param {Position} position
///@param {Number} horizontal
///@throws {Exception}
///@generated {2020-09-28T21:11:14.762Z}
function setPositionHorizontal(argument0, argument1) {

		argument0[@ 0] = argument1;
	



}
///@function setPositionVertical(position, vertical)
///@description Setter.
///@param {Position} position
///@param {Number} vertical
///@throws {Exception}
///@generated {2020-09-28T21:11:14.762Z}
function setPositionVertical(argument0, argument1) {

		argument0[@ 1] = argument1;
	



}

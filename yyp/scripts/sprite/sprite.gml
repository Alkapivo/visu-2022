///@description Sprite entity

///@function createSprite(assetIndex, currentFrame, xScale, yScale, alpha, angle, color)
///@description Constructor for Sprite entity.
///@param {AssetSprite} assetIndex
///@param {Number} currentFrame
///@param {Number} xScale
///@param {Number} yScale
///@param {Number} alpha
///@param {Number} angle
///@param {GMColor} color
///@return {Sprite} sprite 
///@throws {Exception}
///@generated {2020-12-03T01:55:40.813Z}
function createSprite(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {

		var assetIndex = argument0;
		var currentFrame = argument1;
		var xScale = argument2;
		var yScale = argument3;
		var alpha = argument4;
		var angle = argument5;
		var color = argument6;
	
		var sprite = createEntity(Sprite);

		setSpriteAssetIndex(sprite, assertNoOptional(assetIndex));
		setSpriteCurrentFrame(sprite, assertNoOptional(currentFrame));
		setSpriteXScale(sprite, assertNoOptional(xScale));
		setSpriteYScale(sprite, assertNoOptional(yScale));
		setSpriteAlpha(sprite, assertNoOptional(alpha));
		setSpriteAngle(sprite, assertNoOptional(angle));
		setSpriteColor(sprite, assertNoOptional(color));

		return sprite;
	



}
///@function serializeSprite(sprite)
///@description Serialize Sprite to JSON string.
///@param {Sprite} sprite
///@return {String} spriteJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:40.813Z}
function serializeSprite(argument0) {

		var sprite = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"assetIndex",
			getSpriteAssetIndex(sprite));	
		appendFieldToJsonObject(
			jsonObject,
			"currentFrame",
			getSpriteCurrentFrame(sprite));	
		appendFieldToJsonObject(
			jsonObject,
			"xScale",
			getSpriteXScale(sprite));	
		appendFieldToJsonObject(
			jsonObject,
			"yScale",
			getSpriteYScale(sprite));	
		appendFieldToJsonObject(
			jsonObject,
			"alpha",
			getSpriteAlpha(sprite));	
		appendFieldToJsonObject(
			jsonObject,
			"angle",
			getSpriteAngle(sprite));	
		appendFieldToJsonObject(
			jsonObject,
			"color",
			getSpriteColor(sprite));	

		var spriteJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return spriteJsonString;
	



}
///@function deserializeSprite(jsonString)
///@description Deserialize Sprite from JSON String to Sprite entity.
///@param {String} jsonString
///@return {Sprite} sprite 
///@throws {Exception}
///@generated {2020-09-28T21:11:14.834Z}
function deserializeSprite(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var assetIndex = assertNoOptional(getJsonObjectFieldValue(jsonObject, "assetIndex"));
		var currentFrame = assertNoOptional(getJsonObjectFieldValue(jsonObject, "currentFrame"));
		var xScale = assertNoOptional(getJsonObjectFieldValue(jsonObject, "xScale"));
		var yScale = assertNoOptional(getJsonObjectFieldValue(jsonObject, "yScale"));
		var alpha = assertNoOptional(getJsonObjectFieldValue(jsonObject, "alpha"));
		var angle = assertNoOptional(getJsonObjectFieldValue(jsonObject, "angle"));
		var color = assertNoOptional(getJsonObjectFieldValue(jsonObject, "color"));

		destroyJsonObject(jsonObject);
	
		return createSprite(assetIndex, currentFrame, xScale, yScale, alpha, angle, color);
	



}
///@function destroySprite(sprite)
///@description Destroy Sprite entity.
///@param {Sprite} sprite
///@throws {Exception}
///@generated {2020-09-28T21:11:14.834Z}
function destroySprite(argument0) {

		var sprite = argument0;
	
		var assetIndex = getSpriteAssetIndex(sprite);
		var currentFrame = getSpriteCurrentFrame(sprite);
		var xScale = getSpriteXScale(sprite);
		var yScale = getSpriteYScale(sprite);
		var alpha = getSpriteAlpha(sprite);
		var angle = getSpriteAngle(sprite);
		var color = getSpriteColor(sprite);
	

	



}
///@function getSpriteAlpha(sprite)
///@description Getter.
///@param {Sprite} sprite
///@return {Number} alpha 
///@throws {Exception}
///@generated {2020-09-28T21:11:14.834Z}
function getSpriteAlpha(argument0) {

		return argument0[@ 4];
	



}
///@function getSpriteAngle(sprite)
///@description Getter.
///@param {Sprite} sprite
///@return {Number} angle 
///@throws {Exception}
///@generated {2020-09-28T21:11:14.834Z}
function getSpriteAngle(argument0) {

		return argument0[@ 5];
	



}
///@function getSpriteAssetIndex(sprite)
///@description Getter.
///@param {Sprite} sprite
///@return {AssetSprite} assetIndex 
///@throws {Exception}
///@generated {2020-12-03T01:55:40.813Z}
function getSpriteAssetIndex(argument0) {

		return argument0[@ 0];
	



}
///@function getSpriteColor(sprite)
///@description Getter.
///@param {Sprite} sprite
///@return {GMColor} color 
///@throws {Exception}
///@generated {2020-09-28T21:11:14.834Z}
function getSpriteColor(argument0) {

		return argument0[@ 6];
	



}
///@function getSpriteCurrentFrame(sprite)
///@description Getter.
///@param {Sprite} sprite
///@return {Number} currentFrame 
///@throws {Exception}
///@generated {2020-09-28T21:11:14.834Z}
function getSpriteCurrentFrame(argument0) {

		return argument0[@ 1];
	



}

///@function getSpriteXScale(sprite)
///@description Getter.
///@param {Sprite} sprite
///@return {Number} xScale 
///@throws {Exception}
///@generated {2020-09-28T21:11:14.834Z}
function getSpriteXScale(argument0) {

		return argument0[@ 2];
	



}
///@function getSpriteYScale(sprite)
///@description Getter.
///@param {Sprite} sprite
///@return {Number} yScale 
///@throws {Exception}
///@generated {2020-09-28T21:11:14.834Z}
function getSpriteYScale(argument0) {

		return argument0[@ 3];
	



}
///@function setSpriteAlpha(sprite, alpha)
///@description Setter.
///@param {Sprite} sprite
///@param {Number} alpha
///@throws {Exception}
///@generated {2020-09-28T21:11:14.834Z}
function setSpriteAlpha(argument0, argument1) {

		argument0[@ 4] = argument1;
	



}
///@function setSpriteAngle(sprite, angle)
///@description Setter.
///@param {Sprite} sprite
///@param {Number} angle
///@throws {Exception}
///@generated {2020-09-28T21:11:14.834Z}
function setSpriteAngle(argument0, argument1) {

		argument0[@ 5] = argument1;
	



}
///@function setSpriteAssetIndex(sprite, assetIndex)
///@description Setter.
///@param {Sprite} sprite
///@param {AssetSprite} assetIndex
///@throws {Exception}
///@generated {2020-12-03T01:55:40.813Z}
function setSpriteAssetIndex(argument0, argument1) {

		argument0[@ 0] = argument1;
	



}
///@function setSpriteColor(sprite, color)
///@description Setter.
///@param {Sprite} sprite
///@param {GMColor} color
///@throws {Exception}
///@generated {2020-09-28T21:11:14.834Z}
function setSpriteColor(argument0, argument1) {

		argument0[@ 6] = argument1;
	



}
///@function setSpriteCurrentFrame(sprite, currentFrame)
///@description Setter.
///@param {Sprite} sprite
///@param {Number} currentFrame
///@throws {Exception}
///@generated {2020-09-28T21:11:14.834Z}
function setSpriteCurrentFrame(argument0, argument1) {

		argument0[@ 1] = argument1;
	



}
///@function setSpriteXScale(sprite, xScale)
///@description Setter.
///@param {Sprite} sprite
///@param {Number} xScale
///@throws {Exception}
///@generated {2020-09-28T21:11:14.834Z}
function setSpriteXScale(argument0, argument1) {

		argument0[@ 2] = argument1;
	



}
///@function setSpriteYScale(sprite, yScale)
///@description Setter.
///@param {Sprite} sprite
///@param {Number} yScale
///@throws {Exception}
///@generated {2020-09-28T21:11:14.834Z}
function setSpriteYScale(argument0, argument1) {

		argument0[@ 3] = argument1;
	



}

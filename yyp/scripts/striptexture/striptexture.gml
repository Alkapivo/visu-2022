///@description StripTexture entity

///@function createStripTexture(asset, type, frames, animationSpeed)
///@description Constructor for StripTexture entity.
///@param {AssetSprite} asset
///@param {StripTextureType} type
///@param {Integer} frames
///@param {Number} animationSpeed
///@return {StripTexture} stripTexture 
///@throws {Exception}
///@generated {2020-12-03T01:55:40.961Z}
function createStripTexture(argument0, argument1, argument2, argument3) {

		var asset = argument0;
		var type = argument1;
		var frames = argument2;
		var animationSpeed = argument3;
	
		var stripTexture = createEntity(StripTexture);

		setStripTextureAsset(stripTexture, assertNoOptional(asset));
		setStripTextureType(stripTexture, assertNoOptional(type));
		setStripTextureFrames(stripTexture, assertNoOptional(frames));
		setStripTextureAnimationSpeed(stripTexture, assertNoOptional(animationSpeed));

		return stripTexture;
	



}
///@function serializeStripTexture(stripTexture)
///@description Serialize StripTexture to JSON string.
///@param {StripTexture} stripTexture
///@return {String} stripTextureJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:40.961Z}
function serializeStripTexture(argument0) {

		var stripTexture = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"asset",
			getStripTextureAsset(stripTexture));	
		appendFieldToJsonObject(
			jsonObject,
			"type",
			getStripTextureType(stripTexture));	
		appendFieldToJsonObject(
			jsonObject,
			"frames",
			getStripTextureFrames(stripTexture));	
		appendFieldToJsonObject(
			jsonObject,
			"animationSpeed",
			getStripTextureAnimationSpeed(stripTexture));	

		var stripTextureJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return stripTextureJsonString;
	



}
///@function deserializeStripTexture(jsonString)
///@description Deserialize StripTexture from JSON String to StripTexture entity.
///@param {String} jsonString
///@return {StripTexture} stripTexture 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.008Z}
function deserializeStripTexture(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var asset = assertNoOptional(getJsonObjectFieldValue(jsonObject, "asset"));
		var type = assertNoOptional(getJsonObjectFieldValue(jsonObject, "type"));
		var frames = assertNoOptional(getJsonObjectFieldValue(jsonObject, "frames"));
		var animationSpeed = assertNoOptional(getJsonObjectFieldValue(jsonObject, "animationSpeed"));

		destroyJsonObject(jsonObject);
	
		return createStripTexture(asset, type, frames, animationSpeed);
	



}
///@function destroyStripTexture(stripTexture)
///@description Destroy StripTexture entity.
///@param {StripTexture} stripTexture
///@throws {Exception}
///@generated {2020-09-28T21:11:15.008Z}
function destroyStripTexture(argument0) {

		var stripTexture = argument0;
	
		var asset = getStripTextureAsset(stripTexture);
		var type = getStripTextureType(stripTexture);
		var frames = getStripTextureFrames(stripTexture);
		var animationSpeed = getStripTextureAnimationSpeed(stripTexture);
	

	



}
///@function getStripTextureAnimationSpeed(stripTexture)
///@description Getter.
///@param {StripTexture} stripTexture
///@return {Number} animationSpeed 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.008Z}
function getStripTextureAnimationSpeed(argument0) {

		return argument0[@ 3];
	



}
///@function getStripTextureAsset(stripTexture)
///@description Getter.
///@param {StripTexture} stripTexture
///@return {AssetSprite} asset 
///@throws {Exception}
///@generated {2020-12-03T01:55:40.961Z}
function getStripTextureAsset(argument0) {

		return argument0[@ 0];
	



}
///@function getStripTextureFrames(stripTexture)
///@description Getter.
///@param {StripTexture} stripTexture
///@return {Integer} frames 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.008Z}
function getStripTextureFrames(argument0) {

		return argument0[@ 2];
	



}
///@function getStripTextureType(stripTexture)
///@description Getter.
///@param {StripTexture} stripTexture
///@return {StripTextureType} type 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.008Z}
function getStripTextureType(argument0) {

		return argument0[@ 1];
	



}
///@function setStripTextureAnimationSpeed(stripTexture, animationSpeed)
///@description Setter.
///@param {StripTexture} stripTexture
///@param {Number} animationSpeed
///@throws {Exception}
///@generated {2020-09-28T21:11:15.008Z}
function setStripTextureAnimationSpeed(argument0, argument1) {

		argument0[@ 3] = argument1;
	



}
///@function setStripTextureAsset(stripTexture, asset)
///@description Setter.
///@param {StripTexture} stripTexture
///@param {AssetSprite} asset
///@throws {Exception}
///@generated {2020-12-03T01:55:40.961Z}
function setStripTextureAsset(argument0, argument1) {

		argument0[@ 0] = argument1;
	



}
///@function setStripTextureFrames(stripTexture, frames)
///@description Setter.
///@param {StripTexture} stripTexture
///@param {Integer} frames
///@throws {Exception}
///@generated {2020-09-28T21:11:15.008Z}
function setStripTextureFrames(argument0, argument1) {

		argument0[@ 2] = argument1;
	



}
///@function setStripTextureType(stripTexture, type)
///@description Setter.
///@param {StripTexture} stripTexture
///@param {StripTextureType} type
///@throws {Exception}
///@generated {2020-09-28T21:11:15.008Z}
function setStripTextureType(argument0, argument1) {

		argument0[@ 1] = argument1;
	



}

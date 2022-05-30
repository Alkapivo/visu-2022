///@function countRepository(repository)
///@description Returns the number of entities available
///@param {Repository} repository
///@return {Integer} size
function countRepository(argument0) {

		var repository = argument0;
	
		return getMapSize(getRepositoryData(repository));
	



}

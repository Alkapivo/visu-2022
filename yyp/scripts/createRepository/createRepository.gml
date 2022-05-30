///@function createRepository(name, type, data)
///@description Constructor for Repository entity.
///@param {String} name
///@param {String} type
///@param {Map<String::Entity>} data
///@return {Repository} repository 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.730Z}
function createRepository(argument0, argument1, argument2) {

		var name = argument0;
		var type = argument1;
		var data = argument2;
	
		var repository = createEntity(Repository);

		setRepositoryName(repository, assertNoOptional(name));
		setRepositoryType(repository, assertNoOptional(type));
		setRepositoryData(repository, assertNoOptional(data));

		return repository;
	



}

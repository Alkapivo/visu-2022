///@return {Repository<ShaderTemplate>}
function fetchShaderTemplateRepository() {
	
	if (isOptionalPresent(getPlaygroundController())) {
		return getPlaygroundController().shaderTemplateRepository;
	}
	
	if (isOptionalPresent(getGameRenderer())) {
		return getGameRenderer().shaderTemplateRepository;
	}
}
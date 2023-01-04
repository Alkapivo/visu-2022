const fs = require('fs');

const properties = JSON.parse(fs.readFileSync("yyp/datafiles/data/properties.json"));
const generateEmbeddedJson = (filename) => JSON.stringify(JSON.parse(
        fs.readFileSync(`yyp/datafiles/data/${filename}`)))
        .replace(/"/g, '\\\"');

const trackJson = generateEmbeddedJson(properties["base-timeline"]);
const launchpadLayout = generateEmbeddedJson(properties["launchpad-layout"]);
const shaderTemplates = generateEmbeddedJson(properties["shader-templates"]);
const shroomTemplates = generateEmbeddedJson(properties["shroom-templates"]);

const html5inlinefiles = `
///@description Improve loading time at HTML5 target by embedding large JSON files.

function html5EmbeddedTrackJson() {
    return "${trackJson}";
}

function html5EmbeddedLaunchpadLayout() {
	return "${launchpadLayout}";
}

function html5EmbeddedShaderTemplates() {
    return "${shaderTemplates}";
}

function html5EmbeddedShroomTemplates() {
	return "${shroomTemplates}";
}
`;

fs.writeFileSync("yyp/scripts/html5inlinefiles/html5inlinefiles.gml", html5inlinefiles, { encoding:'utf8', flag:'w' })
console.log("html5inlinefiles generated successfully");
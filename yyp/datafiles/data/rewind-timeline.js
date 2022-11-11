const args = process.argv.slice(2);
const fs = require('fs');

const json = JSON.parse(fs.readFileSync(args[0]));
const jsonOutputFilename = args[1];
const rewindValue = parseFloat(args[2]);
const enableVerbose = args.includes("-v") || args.includes("--verbose");

json.events = json.events
    .map(event => {
        if (enableVerbose) {
            console.log(
                event.data.key, "|",
                event.data.timestamp, "|",
                "+",
                rewindValue,
                event.data.log 
            );
        }
        event.data.timestamp = event.data.timestamp + rewindValue;
        return event;
    });
json.timer = json.timer + rewindValue;

fs.writeFileSync(jsonOutputFilename, JSON.stringify(json))

const args = process.argv.slice(2)
const fs = require('fs')

const jsonA = JSON.parse(fs.readFileSync(args[0]))
const jsonB = JSON.parse(fs.readFileSync(args[1]))
const jsonOutputFilename = args[2]
const enableVerbose = args.includes("-v") || args.includes("--verbose");
const events = [ ...jsonA.events, ...jsonB.events ]

console.log("Merging", args[0], "(size:", jsonA.events.length, ") with", args[1], "(size:", jsonB.events.length,")");
jsonA.events = events
    .sort((a, b) => a.data.timestamp - b.data.timestamp)
    .map(event => {
        if (enableVerbose) {
            console.log(
                event.data.key, "|",
                event.data.timestamp, "|",
                event.data.log
            );
        }
        event.data.log = "";
        return event;
    });
jsonA.timer = jsonA.events[jsonA.events.length - 1].data.timestamp;

fs.writeFileSync(jsonOutputFilename, JSON.stringify(jsonA))

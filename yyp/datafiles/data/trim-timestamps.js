const args = process.argv.slice(2)
const fs = require('fs')

let json = fs.readFileSync(args[0])
json = JSON.parse(json)

const value = args[1]

json.events = json.events
    .filter(event => event.data.timestamp - value >= 0.0)
    .map(event => {
        const newValue = event.data.timestamp - value
        console.log("Reduce timestamp: { from: ", event.data.timestamp , ", to: ", newValue," }")
        event.data.timestamp = newValue
        return event
    })

fs.writeFileSync("trim-timestamps-output.json", JSON.stringify(json))
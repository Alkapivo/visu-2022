const args = process.argv.slice(2)
const fs = require('fs')

let jsonA = JSON.parse(fs.readFileSync(args[0]))
let jsonB = JSON.parse(fs.readFileSync(args[1]))
let events = [ ...jsonA.events, ...jsonB.events ]
events.sort((a, b) => a.data.timestamp - b.data.timestamp)
events.forEach(event => console.log(event.data.timestamp))
jsonA.events = events.map(event => {
    event.data.log = "" 
    return event
})



fs.writeFileSync("merged-timelines-output.json", JSON.stringify(jsonA))
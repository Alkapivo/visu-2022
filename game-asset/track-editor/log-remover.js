const args = process.argv.slice(2);
const fs = require('fs');
console.log(args);

let json = fs.readFileSync(args[0])
json = JSON.parse(json);
json.events.forEach(event => { 
    console.log("Remove", event.data.log);
    event.data.log = "" 
});
fs.writeFileSync("log-remover.out", JSON.stringify(json));
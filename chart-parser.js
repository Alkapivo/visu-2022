const fs = require("fs");
const lines = fs.readFileSync("notes.chart").toString().replace(/\r/g, "").split("\n");
var ret = {};
var o = {};
for (var i = 0; i < lines.length; i++) {
    var line = lines[i].trim();
    var mc = line.match(/^\[([^\]]+)\]$/);
    if (mc) {
        var name = mc[1];
        o = {};
        ret[name] = o;
    }
    else if (line.match(/^([^;][^=]*)=(.*)$/)) {
        var mc = line.match(/^([^;][^=]*)=([^;]*)$/);
        o[mc[1]] = mc[2];
    }
}
const expertDrums = ret.ExpertDrums

// mockup
const expertDrumsDictionary = {
    N00: '0x7',
    N400: '1x7',
    N660: '2x7',
    N10: '3x7',
    S21360: '4x7',
    N340: '5x7',
    S641280: '6x7'
}
const events = Object.keys(expertDrums)
    .sort((a, b) => a - b)
    .map(key => {
        const value = expertDrums[key];
        const parameters = value.split(" ").join("")
        const parsedKey = expertDrumsDictionary[parameters]
        return parsedKey
            ? {
                data: {
                    timestamp: parseInt(key) / 700.0,
                    log: value,
                    key: parsedKey
                },
                name: ""
            }
            : undefined
    })
    .filter(key => key)

const track = {
    audio: {
        trackPosition: 0.0,
        name: "asset_sound_visu_ost"
    },
    timer: 476,
    events: events,
    layout: {
        page: 0.0,
        name: "novation-launchpad"
    }
}
fs.writeFileSync("notes.json", JSON.stringify(track), 
    { encoding:'utf8', flag:'w' })
# Midbooze visualizer

The visualiser consists of 4 elements: **Grid**, **Events**, **Timeline** and **MIDIController**.

## Grid

Grid is a Trapezoid that contains Player and Shrooms. Shrooms are falling down, spawned above topLine, destroyed below bottomLine

## Events

### AudioEvent
It stops curently played audio and play a new one, e.g. Vague Sense. You can set position on track, gain, is loop or just play once

### GridEvent
Player and Shrooms are presented on grid, but grid itself has many parameters. This is why it's so flexible.

List of grid parameters:
- **topLineWidth** - how long is the top line: 0% or 100% of screen width
- **topLinePosition** - 0% means the grid is skewed to left, 50% center, 100% right
- **draw** - pLine
- **bottomLineWidth** - **bottomLinePosition** - **channels** - how many lanes (e.g. guitar hero has 6) to draw
- **offsetTop** - top margin for topLine
- **offsetBottom** - **colorPrimaryLines** - primary color of grid wireframe
- **colorSecondaryLines** - secondary color of grid wireframe
- **colorGridBackground** - **textureBackground** - you can set a texture as a background instead of color
- **textureBackgroundAlpha** - transparency
- **textureBackgroundMode** - stretch, fill, scroll-horizontal, scroll-vertical
- **angle** - rotation of the grid
- **xScale** - horizontal scale, 1.0 is normal, 2.0 is its 2x bigger
- **yScale** - **isGridWheelEnabled** - grid has 4 vertices (tbh grid is like trapezoid). For each vertice color can be defined. Enabling this option you will be switching colors between vertices in time (slowly). This can produce effect of smooth gradient transition
- **colorGridWheelTopLeft** - **colorGridWheelTopRight** - **colorGridWheelBottomRight** - **colorGridWheelBottomLeft** - **swingGrid** - enables the slow swinging of the grid (sin function)
- **screens** - screen duplication effect, 1.0 means there is no duplication, 2.0 means that there should be 4 screens visible (2 rows, 2 columns) etc.
- **wavePulseAmount** - effect of pulling the string. e.g. 100 means hard, 20 gentle
- **wavePulseFriction** - amount is reduced by this value
- **wavePulseDistortion** - wave parameter
- **wavePulseSpeed** - wave parameter
- **cameraShake** - similar to wavePulseAmount, 1000 means atomic bomb, 100 means 100 TNT, 5 means "just a tick"
- **cameraShakeFactor** - similar to wavePulseFriction

### JumbotronEvent 
Display Huge text as an overlay, background color with alpha value and duration can be passed as a parameter

### ShaderEvent
These are the visual effects that can fuck up your screen. You can define shader parameters and duration of the effect. Shaders can overlap, so you can build effects by overlapping two ShaderEvents.

List of available shaders:
- **shaderAbberation** - "vice city" look
- **shaderCRT** - old tv
- **shaderEmboss** - looks like a metal plate, edges of textures are used to determine what edges should be embossed
- **shaderLED** - compose screen with dots, you can determine dots size and shape
- **shaderMagnify** - I am using it to create disco ball, but you can do more, zoom in or zoom out but with real life magnifying glass optics, so it's weird. Black hole vibes
- **shaderMosaic** - forced pixel art :)
- **shaderPosterization** - reduce colors, e.g. only to 16
- **shaderRevert** - revert colors
- **shaderRipple** - between shaderMagnify and ShockWave
- **shaderScanlines** - old CRT scanlines
- **shaderShockWave** - imagine droplet of water falling into stable water and creating waves.
- **shaderSketch** - cartoon effect but not so good

### ShroomEvent
ATM midbooze-sus is a Shroom. Shrooms go from up to down, interaction with player can be defined (e.g. execute ShaderEvent, GridEvent). Speed and movement strategy can be defined as a parameter

### PlayerEvent
If you wan't to spawn player on grid (you can have up to 2 players)

### LyricsEvent
Text to display, what speed, where on screen (right, top, left), which font

## Timeline
This is a list of events with parameters and timestamp. 

*E.g.* execute GridEvent at 3:50 of Midbooze Vague Sense with parameter "change channels to 100 and increment it slowly, by 0.1 per game frame" - but ofc this is writen in json format instead of english sentences.

## MIDIController
8x8 key matrix, for each key can be writen custom function. So not only executing events, e.g. one key can execute multiple events with or without probability (randomnes). It's designed to control grid in real time but it's also possible to record button press and replay it in engine (there is a console command for that).
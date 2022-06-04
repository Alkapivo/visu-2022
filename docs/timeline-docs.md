# Spis treści
1. [Słownik pojęć](#1.-Słownik-pojęć)

    1.1. [Znormalizowana wartość](#1.1.-Znormalizowana-wartość)

    1.2. [FieldModifier](#1.2.-FieldModifier)

    1.3. [Color hash](#1.3.-Color-hash)

    1.4. [Position](#1.4.-Position)

    1.5. [ShroomType](#1.5.-ShroomType)

    1.6. [ShaderFieldModifier](#1.6.-ShaderFieldModifier)

2. [Timeline](#2.-Timeline)

    2.1. [TimelineEntry](#2.1.-TimelineEntry)

    2.2. [TimelineEvent](#2.2.-TimelineEvent)
3. [Eventy](#3.-Eventy)

    3.1. [AudioEvent](#3.1.-AudioEvent)

    3.2. [BossEvent](#3.2.-BossEvent)

    3.3. [GridEvent](#3.3.-GridEventGridRendererEvent)

    3.4. [JumbotronEvent](#3.4.-JumbotronEvent)

    3.5. [ParticleEvent](#3.5.-ParticleEvent)

    3.6. [ShaderEvent](#3.6.-ShaderEvent)

    3.7. [ShroomEmitterEvent](#3.7.-ShroomEmitterEvent)

    3.8. [ShroomEvent](#3.8.-ShroomEvent)

    3.9. [PlayerEvent](#3.9.-PlayerEvent)

    4.0. [LyricsEvent](#3.9.-LyricsEvent)


# 1. **Słownik pojęć**

### 1.1. **Znormalizowana wartość**
To taka wartość typu `Number`, która mieści się w przedziale `[ 0.0; 1.0 ]`.


### 1.2. **FieldModifier**
To taka wartość, która może być jednocześnie reprezentowana jako pojedynczy element albo tablica o rozmiarze 2. Jej celem jest możliwość przekazania nie tylko informacji o docelowej wartości ale również o czasie i sposobie transformacji aktualnej wartości do oczekiwanej. Pierwszy indeks oznacza docelową wartość natomiast drugi określa o ile ta wartość ma być zmieniana co `1/60` sekundy. Tablicę możemy przedstawić w pseudo-schemacie:
```json
[
    "destValue",
    "?changeFactor"
]
```
gdzie:
 - `destValue` określa wartość docelową
 - `?changeFactor` określa prędkość zmiany. Wartość ta jest opcjonalna, jeżeli nie zostanie podana to zostanie użyta domyślna wartość, która wynosi `1.0`.

### 1.3. **Color hash**
Jest to reprezentacja koloru `RGBA` w postaci `Stringa`. Kanał alpha jest opcjonalny. Należy pamiętać o rozpoczęciu tego Stringa od znaku `#`. Przykłady: `"#ff00aa"`, `"#36ff0036"`.

### 1.4. **Position**
Jest to tablica `Number[]` o wielkości `2`, gdzie pierwszy indeks opisuje [znormalizowane](#Znormalizowana-wartość) koordynaty poziome, a drugi indeks opisuje [znormalizowane](#Znormalizowana-wartość) koordynaty pionowe.

### 1.5. **ShroomType**
| Klucz | Typ | Opis |
| - | - | - |
| "name" | `?String` | rodzaj typu, lista dostępnych typów dostępna jest poniżej |
| "randomShader | `?Boolean` | czy jeżeli typ jest zgodny i nie zostały podane żadne `shaderTemplates` to czy `shroom` ma wykorzystać losowy shader (silnik losuje shader co 5 sekund)
| "shaderTemplates" | `?Object` | obiekt klasy `ShaderEvent`
| "cameraShake" | `?Number` | jeżeli `bad` to jak mocną wstrząsnąć kamerą
### Dostępne "names"
- good
- bad
- default
### Przykład
```json
{
    "name": "good",
    "randomShader": true,
    "shaderTemplates": [ ... ]
}
```

### 1.6. **ShaderFieldModifier**
Działa podobnie jak [FieldModifier](FieldModifier). Składa się z tablicy `Number[]` o rozmiarze do 4. Każdy kolejny parametr jest opcjonalny. Tablicę możemy przedstawić w pseudo-schemacie:
```json
[
    "parameterBegin",
    "?parameterEnd",
    "?parameterFactor",
    "?parameterFactorChanger"
]
```
gdzie:
 - `parameterBegin` określa wartość startową
 - `?parameterEnd` określa wartość końcową. Domyślnie jest to wartość podana w `parameterBegin`
 - `?parameterFactor` określa prędkość zmiany. Wartość ta jest opcjonalna, jeżeli nie zostanie podana to zostanie użyta domyślna wartość, która wynosi `1.0`
 - `?parameterFactorChanger` określa co ile ma być zwiększany `parameterFactor`. Domyślnie wynosi `0.0`

# 2. **Timeline**
Timeline to obiekt JSON składający się z kolekcji `TimelineEntry`.
### Przykład
```
[ ... ]
```
[wróć do spisu treści](#Spis-treści)

## 2.1. **TimelineEntry**
| Klucz | Typ | Opis |
| - | - | - |
| "time" | `Number` | czas, w którym mają zostać wywołane eventy znajdujące się w "events" |
| "events" | `Object[]` | kolekcja `TimelineEvent` |
### Przykład
```json
{
    "time": 0.0,
    "events: [ ... ]
}
```
[wróć do spisu treści](#Spis-treści)

## 2.2. **TimelineEvent** GameEvent // wyjebac Timeline z nazwy i zastapic moze czyms innym

| Klucz | Typ | Opis |
| - | - | - |
| "type" | `String` | nazwa eventu
| "data" | `Object` | event

### Dostępne Eventy
 - [AudioEvent](#3.1.-AudioEvent)
 - [BossEvent](#3.2.-BossEvent)
 - [GridEvent](#3.3.-GridEvent)
 - [JumbotronEvent](#3.4.-JumbotronEvent)
 - [ParticleEvent](#3.5.-ParticleEvent)
 - [ShaderEvent](#3.6.-ShaderEvent)
 - [ShroomEmitterEvent](#3.7.-ShroomEmitterEvent)
 - [ShroomEvent](#3.8.-ShroomEvent)
 - [PlayerEvent](#3.9.-PlayerEvent)

### Przykład
```json
{
    "type": "AudioEvent",
    "data": { ... }
}
```
[wróć do spisu treści](#Spis-treści)

# 3. **Eventy**

## 3.1 **AudioEvent**
| Klucz | Typ | Opis |
| - | - | - |
| "assetName" | `String` | nazwa zasobu dźwiękowego. Musi być taka sama jak w GMS albo taka, jak dostarczona w `resource-pack` |
| "priority" | `Number` | [GMS audio priority](https://docs2.yoyogames.com/source/_build/3_scripting/4_gml_reference/audio/audio_play_sound.html)  |
| "loop" | `Boolean` | czy dźwięk ma być odtwarzany w pętli |
| "trackPosition" | `Number` | [GMS track position](https://docs.yoyogames.com/source/dadiospice/002_reference/game%20assets/sounds/audio_sound_set_track_position.html) |
### Przykład
```json
{
    "assetName": "asset_ost_ballada_o_dojrzalosci",
    "priority": 100,
    "loop": true
}
```
[wróć do spisu treści](#Spis-treści)

## 3.2. **BossEvent**
| Klucz | Typ | Opis |
| - | - | - |
| "type" | `String` | nazwa bossa, lista dostępnych bossów znajduje się poniżej |
### Dostępne "bossy"
- visu
- mid
### Przykład
```json
{
    "type": "visu"
}
```
[wróć do spisu treści](#Spis-treści)

## 3.3. **GridEvent** 
Nazwa alternatywna: GridRendererEvent
| Klucz | Typ | Opis |
| - | - | - |
| topLineWidth | `?Number` [@FieldModifier](#FieldModifier) | [znormalizowana](#Znormalizowana-wartość) długość górnej linii siatki  |
| topLinePosition | `?Number` [@FieldModifier](#FieldModifier) | [znormalizowana](#Znormalizowana-wartość) opisująca horyznotalne położenie środa górnej linii siatki (np. wartość `0.5` odpowiada środkowi) |
| bottomLineWidth | `?Number` [@FieldModifier](#FieldModifier) | [znormalizowana](#Znormalizowana-wartość) długość dolnej linii siatki |
| channels | `?Number` [@FieldModifier](#FieldModifier) | liczba kanałów siatki (pionowe linie).
| offsetTop | `?Number` [@FieldModifier](#FieldModifier) | [znormalizowana](#Znormalizowana-wartość) określająca margines górny siatki
| offsetBottom | `?Number` [@FieldModifier](#FieldModifier) | [znormalizowana](#Znormalizowana-wartość) określająca margines dolny siatki |
| colorPrimaryLines | `?String` [@FieldModifier](#FieldModifier) | [color hash](#Color-hash) głównych liń siatki
| colorSecondaryLines | `?String` [@FieldModifier](#FieldModifier) | [color hash](#Color-hash) pozostałych liń siatki
| colorGridBackground | `?String` [@FieldModifier](#FieldModifier) | [color hash](#Color-hash) tła warstwy siatki
| primaryLinesWidth | `?Number` [@FieldModifier](#FieldModifier) | grubość głównych liń siatki (domyślna wartość: `3.0`) |
| secondaryLinesWidth | `?Number` [@FieldModifier](#FieldModifier) | grubość pozostałych liń siatki (domyślna wartość: `3.0`) |
| angle | `?Number` [@FieldModifier](#FieldModifier) | kąt obrotu siatki, wyrażony w stopniach |
| xScale | `?Number` [@FieldModifier](#FieldModifier) | pozioma skala całej warstwy siatki |
| yScale | `?Number` [@FieldModifier](#FieldModifier) | pionowa skala całej warstwy siatki |
| isGridWheelEnabled | `?Boolean` | czy kolory siatki mają być pobierane z `colorGridWheel*` i być "obracane" |
| isGridFrameCleaned | `?Boolean` | czy renderer siatki ma czyścić poprzednie klatki (true, jeżeli chcemy uzyskać efekt wypełnienia kolorem)  | gridWheelSpeed | `?Number` | prędkość "obrotu" kolorów w przypadku gdy `isGridWheelEnabled` jest włączone |
| colorGridWheelTopLeft | `?String` | [color hash](#Color-hash) siatki w przypadku gdy `isGridWheelEnabled` jest włączone |
| colorGridWheelTopRight | `?String` | [color hash](#Color-hash) siatki w przypadku gdy `isGridWheelEnabled` jest włączone |
| colorGridWheelBottomRight | `?String` | [color hash](#Color-hash) siatki w przypadku gdy `isGridWheelEnabled` jest włączone |
| colorGridWheelBottomLeft | `?String` | [color hash](#Color-hash) siatki w przypadku gdy `isGridWheelEnabled` jest włączone |
| swingGrid | `?Boolean` | włącza efekt "bujania" |
| verticalScreens | `?Number` [@FieldModifier](#FieldModifier) | ilość powielonych ekranów w poziomie |
| horizontalScreens | `?Number` [@FieldModifier](#FieldModifier) | ilość powielonych ekranów w pionie |
| wavePulseAmount | `?Number` [@FieldModifier](#FieldModifier) | parametr ShaderWave |
| wavePulseMinAmount  | `?Number` [@FieldModifier](#FieldModifier) | jeżeli `wavePulseAmount` spadnie poniżej to `wavePulseAmount` = 0.0 |
| wavePulseFriction | `?Number` [@FieldModifier](#FieldModifier) | o ile redukować `wavePulseAmount` per step |
| wavePulseDistortion | `?Number` [@FieldModifier](#FieldModifier) | parametr ShaderWave |
| wavePulseSpeed | `?Number` [@FieldModifier](#FieldModifier) | parametr ShaderWave |
| cameraShake | `?Number` [@FieldModifier](#FieldModifier) | jak mocno wstrząsnąć kamerą |
| cameraShakeFactor | `?Number` [@FieldModifier](#FieldModifier) | co ile zmniejszać `cameraShake` (domyślna wartość: `0.5`) |
### Przykład
```json
{
    "fields": {
        "channels": [
            8,
            0.05
        ],
        "offsetBottom": [
            0.15,
            0.001
        ],
        "offsetTop": [
            0.15,
            0.001
        ],
        "topLineWidth": [
            0.15,
            0.001
        ],
        "bottomLineWidth": [
            0.85,
            0.001
        ],
        "angle": [
            0,
            1
        ],
        "colorGridBackground": [
            "#000000FF",
            1.0
        ],
        "verticalScreens": [
            1,
            1
        ],
        "horizontalScreens": [
            1,
            1
        ],
        "isGridFrameCleaned": true
    }
}
```
[wróć do spisu treści](#Spis-treści)

## 3.4 **JumbotronEvent**
| Klucz | Typ | Opis |
| - | - | - |
| "message" | `String` | wiadomość, która ma zostać wyświetlona |
| "handlerName" | `String` | rodzaj wiadomości, lista dostępnych handlerów znajduje się poniżej |
| "duration" | `Number` | czas wyświetlania jumbotronu. Wartość `-1` powoduje ustawienie go na nieskończoność
### Dostępne *handlerNames*
- scoreboard
### Przykład
```json
{
    "message": "ZBIERAJ PUNKTY\nDOJRZALOSCI",
    "handlerName": "scoreboard",
    "duration": 1.6
}
```
[wróć do spisu treści](#Spis-treści)

## 3.5 **ParticleEvent**
| Klucz | Typ | Opis |
| - | - | - |
| "particle" | `String` | typ particles, lista dostępnych typów znajduje się poniżej |
| "fields" | `Object` | mapa parametrów |
### Dostępne *particles*
- particle_devhorizon
- particle_explosion
- particle_score
- particle_fusion

### Opis *fields*
| Klucz | Typ | Opis |
| - | - | - |
| "system" | `?String` | nazwa systemu, na której mają być emitowane cząsteczki (domyślnie `background`). Lista dostępnych systemów znajduje się poniżej |
| "amount" | `?Number` | liczba cząsteczek do wygenerowania przez emiter (domyślnie `10`) |
| "duration" | `?Number` | jak długo (w sekundach) mają być renderowane cząsteczki (domyślnie `3.5`)
| "emitterInterval" | `?Number` | co ile sekund ma być wywoływany emiter (domyślnie `3.5`)
| "positionBegin" | `?Number[]` [@Position](#Position) | współrzędne prawego górnego rogu obszaru, z którego mają być emitowane cząsteczki (domyślnie `[ 0.5, 0.5 ]`) |
| "positionEnd" | `?Number[]` [@Position](#Position) | współrzędne lewego dolnego rogu obszaru, z którego mają być emitowane cząsteczki (domyślnie `[ 0.5, 0.5 ]`) |
### Dostępne *systems*
- foreground,
- background
### Przykład
```json
{
    "particle": "particle_fusion",
    "fields": {
        "system": "foreground",
        "amount": 50,
        "duration": 5,
        "emitterInterval": 0.2,
        "positionBegin": [
            0.5,
            0.5
        ],
        "positionEnd": [
            0.5,
            0.5
        ]
    }
}
```
[wróć do spisu treści](#Spis-treści)

## 3.6 **ShaderEvent**
### Opis
| Klucz | Typ | Opis |
| - | - | - |
| "name" | `String` | nazwa shaderu, lista dostępnych shaderów dostępna poniżej |
| "duration" | `Number` | jak długo ma trwać shader |
| "data" | `Object` | mapa parametrów dla shadera. Dostępne parametry dla danego shadera znajdują się na liście poniżej |

> ***Każdy z parametrów shaderów jest typu [@ShaderFieldModifier](#ShaderFieldModifier)***

### Dostępne shadery
### **Emboss**
TODO: Screen
Nie posiada żadnych parametrów
### **LED**
TODO: Screen
| Nazwa parametru | Opis |
| - | - |
| brightness | Jasność, zakres `[ 0.5, 1.5 ]` |
| ledSize | Wielkość "pikseli", zalecana wartość `120` |
### **Magnify**
TODO: Screen
| Nazwa parametru | Opis |
| - | - |
| positionX | [znormalizowana](#Znormalizowana-wartość) pozycji poziomej |
| positionY | [znormalizowana](#Znormalizowana-wartość) pozycji pionowej |
| radius | TODO |
| minZoom | TODO |
| maxZoom | TODO |
### **Mosaic**
TODO: Screen
| Nazwa parametru | Opis |
| - | - |
| amount | Określa wielkośc "pikselizacji", czym mniejsza wartość tym bardziej rozpikselowany obraz. |
### **Posterization**
TODO: Screen
| Nazwa parametru | Opis |
| - | - |
| colorNumber | Określa do jakiej ilości kolorów ma zostać ograniczona paleta |
| gamma | TODO |
### **Revert**
TODO: Screen
Nie posiada żadnych parametrów
### **Ripple**
| Nazwa parametru | Opis |
| - | - |
| positionX | [znormalizowana](#Znormalizowana-wartość) pozycji poziomej |
| positionY | [znormalizowana](#Znormalizowana-wartość) pozycji pionowej |
| amount | TODO |
| distortion | TODO |
| speed | TODO |
| time | TODO |
### **Scanlines**
TODO: Screen
| Nazwa parametru | Opis |
| - | - |
| colorR | red |
| colorG | green |
| colorB | blue |
| colorA | alpha |
### **ShockWave**
TODO: Screen
| Nazwa parametru | Opis |
| - | - |
| positionX | [znormalizowana](#Znormalizowana-wartość) pozycji poziomej |
| positionY | [znormalizowana](#Znormalizowana-wartość) pozycji pionowej |
| amplitude | TODO |
| refraction | TODO |
| width | TODO |
| time | TODO |
### **Sketch**
TODO: Screen
| Nazwa parametru | Opis |
| - | - |
| intensity | TODO |
### **Thermal**
TODO: Screen
| Nazwa parametru | Opis |
| - | - |
| intensity | TODO |
### **Wave**
TODO: Screen
| Nazwa parametru | Opis |
| - | - |
| amount | TODO |
| distortion | TODO |
| speed | TODO |
| time | TODO |

### Przykład
```json
{
    "name": "Emboss",
    "duration": 0.6,
    "data": {}
}
```
[wróć do spisu treści](#Spis-treści)

## 3.7 **ShroomEmitterEvent**
| Klucz | Typ | Opis |
| - | - | - |
| "amount" | `Number` | ile `shroom` ma zostać wygenerowane |
| "duration" | `Number` | jak długo mają być generowane `shrooms`
| "interval" | `Number` | co ile sekund mają być generowane nowe `shrooms`
| "templates" | `ShroomEvent` | kolekcja obiektów klasy [ShroomEvent](#ShroomEvent)
### Przykład
```json
{
    "amount": 3,
    "duration": 20.0,
    "interval": 1.6,
    "templates": [ ... ]
}
```
[wróć do spisu treści](#Spis-treści)

### 3.8 **ShroomEvent**
| Klucz | Typ | Opis |
| - | - | - |
| "fields" | `Object` | mapa parametrów

### Opis *fields*
| Klucz | Typ | Opis |
| - | - | - |
| "sprite" | `?String` | nazwa zasobu graficznego. Musi być taka sama jak w GMS albo taka, jak dostarczona w `resource-pack`. Domyślnie `asset_sprite_emoji_thinking` |
| "type" | `?Object` | obiekt JSON klasy `ShroomType`. Domyslnie `{ "name": "default" }` |
| "position" | `Number[]` | [Position](#Position). Domyślnie losowana jest pozycja pozioma z zakresu `[ 0, 1 ]`, a pionowo `0`.
| "speedValues" | `?Number[]` | kolekcja wartości prędkości, zostanie wylosowana tylko jedna (zamiast tablicy może tutaj być `Number`). Domyślnie `0.002` |
| "texts" | `?String[]` | kolekcja napisów, zostanie wylosowana tylko jedna (zamiast tablicy może tutaj być `String`). Domyślnie `[]` |
### Przykład:
```json
{
    "fields": {
        "sprite": "asset_shroom_emoji_thinking",
        "type": {
            "name": "good"
        },
        "position": [
            0,
            0.01
        ],
        "speedValues": [ 0.01 ],
        "texts": "intro"
    }
}
```
[wróć do spisu treści](#Spis-treści)

### 3.9 **PlayerEvent**
| Klucz | Typ | Opis |
| - | - | - |
| "sprite" | `String` | nazwa zasobu graficznego. Musi być taka sama jak w GMS albo taka, jak dostarczona w `resource-pack`
### Przykład
```json
{
    "sprite": "asset_sprite_gta_car_01"
}
```
[wróć do spisu treści](#Spis-treści)

### 3.9 **InputEvent**
| Klucz | Typ | Opis |
| - | - | - |
| "sprite" | `String` | nazwa zasobu graficznego. Musi być taka sama jak w GMS albo taka, jak dostarczona w `resource-pack`
### Przykład
```json
{
    "sprite": "asset_sprite_gta_car_01"
}
```
[wróć do spisu treści](#Spis-treści)

### 4.0 **LyricsEvent**
| Klucz | Typ | Opis |
| - | - | - |
| "lyrics" | `String[]` | Napisy do wyświetlenia |
| "lifespan" | `Number` | Jak długo ma być wyświetlany LyricsRenderer (w sekundach) |
| "duration" | `Number` | Jak dojdzie do nowej lini to ile sekund ma odczekać, żeby zacząć drukować nastepną (w sekundach) |
### Przykład
```json
{
    "lyrics": [
        "hello world",
        "program to work and not to feel",
        "not even sure that this is real",
        "hello world"
    ],
    "lifespan": 10.0,
    "duration": 1.0
}
```
[wróć do spisu treści](#Spis-treści)

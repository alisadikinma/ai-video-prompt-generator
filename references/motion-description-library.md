# Motion Description Library
## Subject and Ambient Motion for Image-to-Video Prompts

> **CORE PRINCIPLE: For I2V, describe MOTION only, never visuals. The model already sees the image.**
> The image contains all visual details (face, wardrobe, environment, lighting, color, composition). The video prompt tells the model only what MOVES and what SOUNDS.

---

## 1. Subject Micro-Movements

### 1.1 Face and Expression

| Motion | Prompt Fragment | Intensity |
|--------|----------------|-----------|
| Natural blinks | `"subtle eye blinks every 2-3 seconds"` | LOW |
| Micro-expressions | `"gentle micro-expressions shifting"` | LOW |
| Eye focus | `"slight narrowing of eyes in focus"` | LOW |
| Emerging smile | `"subtle smile emerging gradually"` | LOW-MED |
| Interest response | `"eyebrows raising slightly in interest"` | LOW |
| Facial liveliness | `"natural facial muscle micro-movements"` | LOW |
| Widening eyes | `"eyes widening in realization"` | MED |
| Emotional shift | `"expression shifts from neutral to intrigue"` | MED |
| Warm smile build | `"warm smile developing, soft eye contact"` | MED |
| Intense gaze | `"fixed intense gaze, tight jaw, minimal blinks"` | HIGH |

### 1.2 Head and Posture

| Motion | Prompt Fragment | Intensity |
|--------|----------------|-----------|
| Thoughtful tilt | `"subtle head tilt suggesting thought"` | LOW |
| Understanding nod | `"gentle nod of understanding"` | LOW |
| Camera turn | `"slight turn toward camera"` | LOW |
| Standing sway | `"natural postural sway while standing"` | LOW |
| Engagement lean | `"subtle forward lean of engagement"` | LOW-MED |
| Breathing motion | `"relaxed breathing motion in shoulders"` | LOW |
| Weight shift | `"subtle weight shifts between feet"` | LOW |
| Head straighten | `"head straightens with resolve"` | MED |
| Alert posture | `"posture shifts to alert, upright position"` | MED-HIGH |

### 1.3 Hands and Gestures

| Motion | Prompt Fragment | Intensity |
|--------|----------------|-----------|
| Emphasis gesture | `"subtle hand gesture emphasizing point"` | LOW-MED |
| Surface tapping | `"fingers gently tapping surface"` | LOW |
| Position adjust | `"natural hand position adjustment"` | LOW |
| Gesture complete | `"gesture completing then returning to rest"` | LOW-MED |
| Object fidget | `"subtle fidget of held object"` | LOW |
| Beckoning motion | `"one hand gestures toward camera invitingly"` | MED |
| Explaining motion | `"hands move naturally while explaining concept"` | MED |
| Clasping hands | `"fingers interlacing in contemplation"` | LOW |

**WARNING:** Keep hand/finger actions simple. All AI video models struggle with detailed finger articulation. Prefer broad hand gestures over specific finger movements.

### 1.4 Body Movement

| Motion | Prompt Fragment | Intensity |
|--------|----------------|-----------|
| Seated settle | `"slight settling into chair"` | LOW |
| Standing balance | `"natural standing balance micro-shifts"` | LOW |
| Leaning in | `"leaning slightly forward with interest"` | LOW-MED |
| Shoulder relax | `"shoulders dropping slightly in relaxation"` | LOW |
| Torso turn | `"torso turns slightly toward subject of interest"` | MED |
| Rising motion | `"slowly rising from seated position"` | MED-HIGH |
| Walking | `"walking at natural pace through space"` | MED-HIGH |

### 1.5 Hair and Clothing

| Motion | Prompt Fragment | Intensity |
|--------|----------------|-----------|
| Hair drift | `"hair strands shifting gently with air movement"` | LOW |
| Fabric settle | `"subtle fabric movement from air current"` | LOW |
| Collar adjust | `"jacket lapel settling with body movement"` | LOW |
| Scarf flow | `"scarf fabric flowing gently in breeze"` | LOW-MED |
| Hair blow | `"hair moving noticeably in wind"` | MED |
| Clothing billow | `"loose clothing billowing in strong wind"` | MED-HIGH |

---

## 2. Ambient Motion

### 2.1 Atmospheric

| Motion | Prompt Fragment | Intensity |
|--------|----------------|-----------|
| Floating dust | `"floating dust particles drifting through light beam"` | LOW |
| Haze drift | `"subtle haze drift across frame"` | LOW |
| Smoke wisps | `"gentle smoke wisps rising"` | LOW-MED |
| Light particles | `"atmospheric particles catching light"` | LOW |
| Volumetric rays | `"volumetric rays shifting subtly"` | LOW |
| Fog rolling | `"low fog rolling slowly across ground"` | MED |
| Steam rising | `"steam rising and dissipating in air"` | MED |
| Heavy smoke | `"thick smoke billowing and curling"` | HIGH |

### 2.2 Environmental

| Motion | Prompt Fragment | Intensity |
|--------|----------------|-----------|
| Monitor shift | `"monitor screen content subtly shifting"` | LOW |
| LED blink | `"LED indicator lights blinking naturally"` | LOW |
| Fabric flutter | `"subtle fabric movement from air"` | LOW |
| Foliage sway | `"background foliage gentle sway"` | LOW |
| Water ripple | `"water surface micro-ripples"` | LOW |
| Curtain flutter | `"curtain edge gentle flutter"` | LOW |
| Bokeh drift | `"soft golden bokeh particles drift in background"` | LOW |
| Flag wave | `"flag waving gently in breeze"` | LOW-MED |
| Rain falling | `"rain falling steadily against surfaces"` | MED |
| Traffic flow | `"background traffic moving at normal pace"` | MED |
| Waves crashing | `"ocean waves rolling and crashing against shore"` | MED-HIGH |

### 2.3 Light and Shadow

| Motion | Prompt Fragment | Intensity |
|--------|----------------|-----------|
| Screen flicker | `"subtle light flicker from screen"` | LOW |
| Cloud shadow | `"gentle shadow shift as clouds pass"` | LOW |
| Light warm-up | `"warm light slowly intensifying"` | LOW |
| Ambient pulse | `"cool ambient light subtle pulse"` | LOW |
| Sun movement | `"sunlight angle shifting imperceptibly"` | LOW |
| Neon flicker | `"neon sign flickering intermittently"` | LOW-MED |
| Lightning flash | `"distant lightning illuminating clouds"` | MED-HIGH |
| Strobe effect | `"rhythmic strobe light cutting through darkness"` | HIGH |

---

## 3. Emotion-Based Motion Intensity Guide

### LOW Intensity (Subtle Drift)
**When:** Authority, contemplation, formal delivery, tension hold, intimacy

**Subject recipe:**
```
"minimal movement, steady posture, subtle eye blinks every 2-3 seconds,
relaxed breathing motion in shoulders, natural facial muscle micro-movements"
```

**Ambient recipe:**
```
"floating dust particles drifting through light beam,
subtle light flicker from screen, clean minimal environment"
```

**Full LOW prompt fragment:**
```
Subject motion: subtle eye blinks, relaxed breathing visible in shoulders,
natural micro-expressions. Ambient motion: floating dust particles catching
light, gentle shadow shift. Maintain stillness — let the image breathe.
```

---

### MEDIUM Intensity (Operational)
**When:** Explanation, engagement, curiosity, warmth, standard dialogue

**Subject recipe:**
```
"natural teaching gestures, regular eye contact, subtle postural shifts,
slight head tilts, engaged forward lean, hands move while explaining"
```

**Ambient recipe:**
```
"monitor screen content shifting, LED lights blinking,
background foliage gentle sway, atmospheric particles catching light"
```

**Full MEDIUM prompt fragment:**
```
Subject motion: natural gestures emphasizing points, subtle head tilts
of engagement, relaxed breathing, regular eye blinks. Expression shifts
warmly between points. Ambient motion: background elements alive — screens
shifting, subtle fabric movement from air, particles drifting through light.
```

---

### HIGH Intensity (Dramatic Action)
**When:** Shock, urgency, excitement, climax, action beats

**Subject recipe:**
```
"animated gestures, energetic posture shifts, rapid head turns,
intense gaze, dramatic expression changes, forward lean with urgency"
```

**Ambient recipe:**
```
"high motion energy — particles swirling, light streaks,
dynamic environmental elements, dramatic atmospheric shifts"
```

**Full HIGH prompt fragment:**
```
Subject motion: energetic gestures, posture shifts with urgency,
expression transforms dramatically, eyes widen. Body leans forward
with intensity. Ambient motion: particles scatter, light shifts rapidly,
environmental elements respond to energy — screens flicker, fabric moves.
```

---

## 4. "What Would Naturally Move?" Framework

When analyzing a still image for I2V, ask these questions to identify natural motion:

| Question | Look For | Example Motion |
|----------|----------|----------------|
| Is there a person? | Breathing, blinking, micro-expressions | `"subtle breathing motion, natural blinks"` |
| Is there hair? | Wind or air current indicators | `"hair strands shifting gently"` |
| Is there water? | Surface, flow direction, depth | `"water surface micro-ripples"` |
| Is there foliage? | Leaves, branches, grass | `"foliage gentle sway in breeze"` |
| Is there fabric? | Curtains, flags, clothing | `"fabric edge gentle flutter"` |
| Is there smoke/steam? | Atmospheric elements | `"smoke wisps drifting upward"` |
| Are there screens? | Monitors, phones, LEDs | `"screen content subtly shifting"` |
| Is there fire/flame? | Candles, fireplace, torch | `"flame flickering and dancing"` |
| Are there reflections? | Glass, water, metal | `"reflections shifting subtly with light"` |
| Is there weather? | Clouds, rain, snow | `"clouds drifting slowly across sky"` |

---

## 5. Copy-Paste Motion Combos by Scene Type

### Talking Head (Creator / Presenter)
```
Subject motion: subtle eye blinks every 2-3 seconds, gentle micro-expressions
shifting, natural teaching gestures, slight head tilts of engagement, relaxed
breathing motion in shoulders.
Ambient motion: floating dust particles catching light, subtle background
screen glow, minimal distraction.
```

### Product Showcase
```
Subject motion: none (product hero shot, no human).
Product motion: subtle light interaction on surfaces, specular highlights
gently shifting with camera movement.
Ambient motion: floating dust particles catching light, subtle reflections
on surfaces, premium atmospheric haze.
```

### Environment / Establishing
```
Subject motion: none (environment focus).
Environmental motion: natural elements alive — foliage gentle sway, water
surface ripples, atmospheric haze drifting, clouds passing slowly, light
shifting across surfaces. Depth layers each moving at different rates.
```

### Dramatic / Emotional Moment
```
Subject motion: frozen moment, then reactive micro-expressions — eyes
widening, brows raising, subtle mouth opening. Breath held then released.
Ambient motion: sudden shift to stillness, single atmospheric element
drifting (dust particle catching light), tension in the air.
```

### Action / High Energy
```
Subject motion: dynamic posture shift, energetic gesture, body moves with
purpose and momentum. Hair and clothing respond to movement.
Ambient motion: particles scatter with motion, environmental elements react —
papers flutter, fabric billows, light streaks across frame.
```

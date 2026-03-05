# Image Analysis Framework
## Structured 6-Element Analysis for Extracting Video-Relevant Information from Still Images

> **PURPOSE:** Before writing any I2V (Image-to-Video) prompt, analyze the source image systematically using this 6-element framework. The analysis output feeds directly into the prompt generation process.

> **GOLDEN RULE: IMAGE = ALL VISUALS, VIDEO = MOTION ONLY.**
> Everything you see in the image is already "baked in." The video prompt must describe only what MOVES and what SOUNDS -- never re-describe static visual elements.

---

## The 6-Element Analysis

### Element 1: Subject

Identify who or what is the primary subject of the image.

| Aspect | What to Extract | Why It Matters for Video |
|--------|----------------|--------------------------|
| **Who/What** | Person, object, animal, group, abstract | Determines what micro-movements to prescribe |
| **Appearance** | Clothing, features, distinguishing details | Feeds continuity notes ("maintain appearance from reference") |
| **Position/Pose** | Standing, sitting, leaning, hand placement | Determines what movements are physically possible from this pose |
| **Expression** | Current facial expression, emotional state | Determines whether to hold, shift, or intensify expression |
| **Gaze Direction** | Where eyes are looking | Determines natural eye movement options |
| **Scale in Frame** | How much of frame the subject occupies | Affects lip sync viability (face must be 20%+ of frame for dialogue) |

---

### Element 2: Motion Cues

Identify visual evidence of potential, implied, or frozen motion.

| Aspect | What to Extract | Why It Matters for Video |
|--------|----------------|--------------------------|
| **Frozen Action** | Is the subject mid-action? (mid-gesture, mid-step, mid-speech) | Continue the action naturally in video |
| **Directional Elements** | Lines, angles, body orientation suggesting direction | Camera or subject movement should follow these lines |
| **Potential Energy** | Things that look like they could/should move (hanging objects, balanced items) | Natural ambient motion candidates |
| **Wind/Flow Indicators** | Hair direction, fabric drape, smoke trails, water flow | Tells you which direction ambient motion should go |
| **Implied Speed** | Motion blur, streaks, leaning posture | Determines motion intensity level (LOW/MED/HIGH) |
| **Tension Points** | Clenched hands, rigid posture, taut rope, drawn bow | Movement could release from these tension points |

---

### Element 3: Camera / Composition

Identify the virtual camera characteristics embedded in the image.

| Aspect | What to Extract | Why It Matters for Video |
|--------|----------------|--------------------------|
| **Framing/Shot Type** | ECU, CU, MCU, MS, MWS, WS, EWS | Determines camera movement options. CU = limited movement. WS = more freedom |
| **Angle** | Eye-level, low angle, high angle, Dutch angle | Camera movement should respect or build on this angle |
| **DOF/Bokeh** | Shallow DOF (blurred background), deep DOF (everything sharp) | Shallow DOF implies longer lens -- restrict movement range |
| **Lens Characteristics** | Wide (distortion at edges), telephoto (compressed depth), normal | Affects which camera movements look natural |
| **Depth Layers** | Foreground / midground / background separation | Parallax opportunity -- layers can move at different rates |
| **Composition Rule** | Rule of thirds, centered, leading lines, symmetry | Camera movement should preserve or intentionally break composition |

---

### Element 4: Lighting

Identify all light characteristics for continuity and ambient motion.

| Aspect | What to Extract | Why It Matters for Video |
|--------|----------------|--------------------------|
| **Direction** | Where light comes from (left, right, above, behind, multiple) | Shadows and highlights must remain consistent |
| **Quality** | Hard (sharp shadows) vs. soft (diffused shadows) | Determines how shadows behave during motion |
| **Color Temperature** | Warm (golden/orange), cool (blue), neutral, mixed | Must be maintained -- no color drift in video |
| **Time of Day** | Golden hour, midday, blue hour, night, artificial | Affects ambient motion (cloud shadows, sun movement) |
| **Artificial Sources** | Screens, LEDs, neon, lamps, practicals | These can flicker, pulse, or shift as ambient motion |
| **Volumetric Effects** | God rays, haze interaction, dust in light beams | Prime candidates for subtle ambient motion |

---

### Element 5: Environment

Identify the setting and atmospheric conditions.

| Aspect | What to Extract | Why It Matters for Video |
|--------|----------------|--------------------------|
| **Location Type** | Indoor (office, home, studio) / Outdoor (urban, nature, rooftop) | Determines audio template and ambient motion set |
| **Weather/Atmosphere** | Clear, cloudy, rainy, foggy, dusty, hazy | Weather elements become ambient motion |
| **Background Elements** | Screens, foliage, water, traffic, people, architecture | Each is a potential ambient motion element |
| **Depth Layers** | What is in foreground, midground, background | Different layers move at different speeds (parallax) |
| **Enclosure** | Open sky, ceiling, walls, tight space | Affects camera movement possibilities and audio reverb |
| **Interactive Elements** | Doors, switches, vehicles, tools, devices | Potential action elements if subject interacts |

---

### Element 6: Mood / Style

Identify the overall emotional and aesthetic character.

| Aspect | What to Extract | Why It Matters for Video |
|--------|----------------|--------------------------|
| **Emotional Tone** | Confident, tense, warm, contemplative, urgent, hopeful | Drives emotion-to-motion mapping (camera + subject + ambient) |
| **Visual Style** | Cinematic, documentary, commercial, editorial, casual | Determines movement style (smooth dolly vs. handheld vs. static) |
| **Color Palette** | Dominant colors, saturation level, contrast | Must maintain -- no color grading drift in video |
| **Genre Cues** | Sci-fi elements, noir shadows, romantic soft focus, corporate clean | Style guides all creative decisions |
| **Energy Level** | Calm, moderate, energetic, chaotic | Directly maps to motion intensity (LOW/MED/HIGH) |
| **Production Value** | High-end (Kodak, ARRI look), mid-range, casual (phone quality) | Determines appropriate camera movement sophistication |

---

### Element 7: Text Detection

Identify any readable text elements in the image. This triggers text preservation rules.

| Aspect | What to Extract | Why It Matters for Video |
|--------|----------------|--------------------------|
| **Headlines/Titles** | Large text, headings, slide titles | Must remain sharp and readable throughout — add text preservation instruction |
| **Body Text/Labels** | Smaller informational text, captions, stats | Must stay legible — avoid camera moves that blur small text |
| **Branding/Logos** | Company logos, brand marks, watermarks | Must remain visible and unobstructed |
| **UI Elements** | Dashboard labels, button text, interface text | Keep stable — avoid extreme camera movement |
| **Signage** | Signs, banners, placards in scene | Include in preservation if important to context |
| **Text Position** | Where text is located in frame (top/bottom/center/edges) | Camera push-in must not crop text zones |
| **Text Language** | Language of text (English, Indonesian, etc.) | Relevant for localization context |
| **CTA Elements** | Call-to-action buttons or interactive text | May be candidates for subtle animation (pulse, glow) |

**If text is detected:** Add `"All text, headlines, branding, and overlays remain sharp and readable throughout."` to video prompt. See `text-preservation-rules.md` for full rules.

---

## Analysis Output Template

Use this template to structure your analysis before writing the video prompt. Fill in every field.

```markdown
## IMAGE ANALYSIS

### 1. SUBJECT
- **Who/What:** [description]
- **Appearance:** [clothing, features]
- **Position/Pose:** [standing/sitting, hand placement, body orientation]
- **Expression:** [current emotional expression]
- **Gaze:** [direction eyes are looking]
- **Scale:** [percentage of frame occupied by subject/face]

### 2. MOTION CUES
- **Frozen Action:** [any mid-action elements]
- **Directional Elements:** [lines/angles suggesting motion direction]
- **Potential Energy:** [things that could/should move]
- **Wind/Flow:** [hair, fabric, smoke direction indicators]
- **Implied Speed:** [static/slow/medium/fast implied energy]
- **Tension Points:** [areas of held energy that could release]

### 3. CAMERA / COMPOSITION
- **Shot Type:** [ECU/CU/MCU/MS/MWS/WS/EWS]
- **Angle:** [eye-level/low/high/Dutch]
- **DOF:** [shallow/deep, estimated f-stop feel]
- **Lens Feel:** [wide/normal/telephoto]
- **Depth Layers:** [foreground | midground | background elements]
- **Composition:** [rule of thirds/centered/leading lines/etc.]

### 4. LIGHTING
- **Direction:** [primary light source direction]
- **Quality:** [hard/soft/mixed]
- **Color Temperature:** [warm/cool/neutral/mixed]
- **Time of Day:** [morning/midday/golden hour/evening/night/artificial]
- **Artificial Sources:** [screens, LEDs, practicals visible]
- **Volumetric:** [god rays, haze, dust in light]

### 5. ENVIRONMENT
- **Location:** [specific location type]
- **Weather/Atmosphere:** [atmospheric conditions]
- **Background Elements:** [list all moveable/notable background items]
- **Depth:** [what is in FG / MG / BG]
- **Enclosure:** [open/semi-enclosed/enclosed]
- **Interactive Elements:** [objects that could be interacted with]

### 6. MOOD / STYLE
- **Emotional Tone:** [primary emotion]
- **Visual Style:** [cinematic/documentary/commercial/etc.]
- **Color Palette:** [dominant colors and feel]
- **Genre Cues:** [any genre-specific visual elements]
- **Energy Level:** [LOW/MEDIUM/HIGH]
- **Production Value:** [high-end/mid-range/casual]

---

### 7. TEXT DETECTION
- **Headlines/Titles:** [any large text visible]
- **Body Text/Labels:** [any smaller text, stats, captions]
- **Branding/Logos:** [company logos, watermarks]
- **UI Elements:** [dashboard labels, button text]
- **Text Position:** [location in frame — top/bottom/center/edges]
- **Text Preservation Needed:** [YES/NO — if YES, include preservation instruction in prompt]

---

### MOTION PLAN
- **Camera Movement:** [selected single movement + speed]
- **Subject Motion (intensity):** [LOW/MED/HIGH — specific motions]
- **Ambient Motion:** [what moves in the environment]
- **Audio Direction:** [environmental sounds + exclusions]
- **What Naturally Moves:** [list from framework below]
```

---

## "What Would Naturally Move?" Framework

After completing the 6-element analysis, run through this checklist. For each element present in the image, note the natural motion it implies.

### Living Subjects
| If You See... | It Would Naturally... | Prompt Fragment |
|---------------|----------------------|-----------------|
| A person standing | Breathe, shift weight, blink | `"natural breathing, subtle weight shifts, eye blinks"` |
| A person sitting | Breathe, adjust posture, blink | `"relaxed breathing, subtle postural adjustments"` |
| A person mid-gesture | Complete the gesture | `"gesture completing then returning to rest"` |
| A person speaking | Continue lip movement, gestures | `"speaking with natural lip movement and gestures"` |
| A person's hair (loose) | Drift with air currents | `"hair strands shifting gently"` |
| An animal standing | Breathe, ear twitch, tail movement | `"natural breathing, subtle ear movement"` |
| An animal mid-motion | Continue the motion path | `"continues motion naturally along path"` |

### Environmental Elements
| If You See... | It Would Naturally... | Prompt Fragment |
|---------------|----------------------|-----------------|
| Water (any form) | Ripple, flow, splash | `"water surface micro-ripples"` |
| Foliage / Trees | Sway gently in breeze | `"foliage gentle sway"` |
| Grass | Wave in wind patterns | `"grass swaying in gentle waves"` |
| Clouds | Drift slowly | `"clouds drifting slowly across sky"` |
| Smoke / Steam | Rise and disperse | `"smoke wisps rising and dispersing"` |
| Dust in light | Float and drift | `"dust particles drifting through light beam"` |
| Fire / Candle | Flicker and dance | `"flame flickering naturally"` |
| Curtains / Fabric | Flutter at edges | `"curtain edge gentle flutter"` |
| Flags / Banners | Wave in wind | `"flag waving gently in breeze"` |

### Technological Elements
| If You See... | It Would Naturally... | Prompt Fragment |
|---------------|----------------------|-----------------|
| Monitor / Screen | Display content shifts | `"monitor screen content subtly shifting"` |
| LED indicators | Blink at intervals | `"LED indicator lights blinking naturally"` |
| Neon signs | Flicker occasionally | `"neon sign with subtle flicker"` |
| Vehicles in background | Move along their path | `"background traffic moving at normal pace"` |
| Clock | Second hand ticking | `"clock second hand ticking"` |

### Light Behavior
| If You See... | It Would Naturally... | Prompt Fragment |
|---------------|----------------------|-----------------|
| Sunlight through window | Shift imperceptibly | `"sunlight angle shifting subtly"` |
| Clouds in sky | Cast moving shadows | `"gentle shadow shift as clouds pass"` |
| Screen glow on face | Flicker with content | `"subtle light flicker from screen"` |
| Candle / Fire light | Cast dancing shadows | `"warm flickering light casting shifting shadows"` |
| Reflections on glass | Shift with perspective | `"reflections shifting subtly on glass surface"` |

---

## "Implied Motion Detection" Checklist

Run through these yes/no questions. Each "yes" adds information to your motion plan.

- [ ] **Is the subject mid-action?** If yes: continue that action naturally.
- [ ] **Is there visible wind evidence?** (hair blown, fabric stretched, leaves in air) If yes: maintain wind direction and intensity in all moving elements.
- [ ] **Are there moving vehicles/people in background?** If yes: continue their motion paths.
- [ ] **Is there water visible?** If yes: add surface motion appropriate to the body of water.
- [ ] **Are there screens or electronic displays?** If yes: add subtle content shifting.
- [ ] **Is there atmospheric haze, fog, or dust?** If yes: add drift motion.
- [ ] **Are there flames, smoke, or steam?** If yes: add natural flicker/rise behavior.
- [ ] **Is there visible sky with clouds?** If yes: add slow cloud drift and shadow movement.
- [ ] **Is the subject's hair loose/long?** If yes: add hair movement consistent with any air indicators.
- [ ] **Is there loose fabric?** (curtains, tablecloths, banners) If yes: add gentle movement.
- [ ] **Are there reflective surfaces?** If yes: reflections can shift subtly with camera movement.
- [ ] **Is there depth separation?** (clear FG/MG/BG) If yes: different layers should move at different rates (parallax).
- [ ] **Is this a person who should be breathing?** If yes: always include breathing motion.
- [ ] **Is this a person who should be blinking?** If yes: always include natural blinks.
- [ ] **Are there tension elements?** (clenched fists, drawn bow, taut rope) If yes: consider whether to hold or release the tension.

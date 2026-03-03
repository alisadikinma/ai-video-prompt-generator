# Grok 3 Image-to-Video Reference Guide

> **PRIMARY PLATFORM** -- Grok 3 is the default for ALL image-to-video conversion.
> Override only when a specific feature is needed that Grok 3 does not support (e.g., lip-sync, dialogue).
> For configurable values (durations, orientations, quality gate), see `global-video-config.md`.

---

## 1. Platform Overview

| Setting | Value |
|---------|-------|
| Model | Grok 3 (Aurora autoregressive engine) |
| Mode | Basic prompt (single text field) + Image Reference |
| Capability | Image-to-video animation with auto-generated SFX/audio |
| Architecture | Aurora mixture-of-experts; predicts image tokens sequentially (NOT diffusion-based) |
| Resolution | 720p (HD) recommended |
| Duration | **6s** (default) / **10s** / **15s** |
| Orientations | Landscape 16:9, Portrait 9:16, Square 1:1, Vertical 2:3, Horizontal 3:2 |
| Negative prompts | **Not supported** -- describe only what you WANT |
| Prompt weighting | First 20-30 words receive priority weighting |
| Optimal prompt length | 50-200 words (longer risks dilution) |
| Audio | Auto-generated SFX from prompt direction |
| Lip-sync | Not supported (use VEO 3.1 for dialogue) |

---

## 2. Image-to-Video Prompting Rules

### The Golden Rule

```
The source image IS the video frame.
IMAGE = all visuals (subject, lighting, lens, color, atmosphere)
VIDEO PROMPT = MOTION ONLY (what moves, how the camera moves, what sounds play)
NEVER re-describe static elements already visible in the image.
```

### Core Rules

1. **Image already contains the scene** -- do NOT re-describe static elements (characters, backgrounds, objects, colors, lighting)
2. **Prompt describes ONLY what MOVES and what SOUNDS** -- motion, camera, audio
3. **Keep it short and direct** -- 2-4 sentences, approximately 50-100 words
4. **First 20-30 words are weighted most heavily** -- front-load the primary motion and subject action
5. **Negative prompts do NOT work** -- never write "no blur" or "avoid shaking"; instead write "sharp focus" or "steady camera"
6. **One camera movement per prompt** -- never combine multiple competing camera moves
7. **SFX/audio direction is mandatory** -- always include specific sound cues, never just "add sound"
8. **Use positive, additive language exclusively** -- every word must describe what IS happening

### The Prompt Formula

```
[Primary motion description] + [Camera movement] + [Text preservation if applicable] + [SFX/audio direction]
```

### Prompt Structure Tips (Aurora Architecture)

- Semicolons effectively separate distinct elements within a prompt
- Repeating key descriptors locks them in: "chrome surface; reflective chrome sheen"
- Front-load the most important motion in the first sentence
- Cinematic terminology Grok responds well to: "dolly-in," "crane up," "tracking shot," "orbit," "whip pan"
- Shot types: "wide establishing shot," "medium close-up," "extreme close-up," "eye-level," "low angle"

---

## 3. Text Preservation Rules

> **Apply these rules ONLY when the source image contains text overlays, titles, watermarks, branding, or any readable text elements.**

If the source image has text, ALL text elements must remain visible and readable throughout the entire video duration:
- Headlines, titles, and subtitles remain sharp from first to last frame
- Brand logos, watermarks, and icons stay visible and unobstructed
- Any informational text (stats, labels, captions) stays readable

### How to Preserve Text

- Animate ONLY the visual scene area -- keep text zones undisturbed
- Keep camera movements **slow and subtle** -- no fast zooms, no extreme pans
- Avoid push-in that crops out text zones (especially bottom and top edges)
- Avoid rotation or shake that blurs text
- Prefer: slow drift, subtle parallax, locked camera with subject motion only
- If camera pushes in, frame it so text is never cropped or obscured

### Animated Text Elements (Optional)

If the image contains interactive cues or call-to-action text, those specific elements MAY be animated:
- CTA text: subtle pulse, glow, or scale-up to draw attention
- Directional cues: gentle slide or bounce in the indicated direction
- Icons: glow or illuminate sequentially

### Prompt Language for Text Preservation

Include explicitly in the prompt when text is present:
```
"All text, headlines, branding, and overlays remain sharp and readable throughout."
```

For animated text elements, add:
```
"The [specific CTA/element] subtly pulses to draw attention."
```

---

## 4. SFX & Audio Vocabulary

Grok 3 auto-generates SFX from prompt direction. Be specific -- generic instructions like "add sound" produce poor results. Name exact sounds.

### War / Military
- Gunfire, rapid gunfire bursts, distant explosions
- Bullet impacts on metal, ricochet sounds, shell casings clinking
- Missile launch roar, rocket exhaust whoosh
- Laser beam hum, energy weapon charging whine
- Radar ping, sonar sweep, electronic warning beeps
- Military radio chatter, command center ambient hum
- Helicopter blades chopping, jet flyby sonic boom

### Atmospheric / Environmental
- Wind howling, desert wind gusting, mountain breeze
- Dust and debris settling, leaves rustling
- Distant thunder rumble, lightning crack
- Ocean waves crashing, rain pattering, storm surge
- City ambient noise, traffic hum, street chatter
- Forest ambience: birdsong, insects, creek trickling
- Snow crunching, ice cracking

### Technology / Data
- Holographic display hum, data processing beeps
- Keyboard typing, console alert tones, notification chimes
- Digital interface whoosh, futuristic UI sounds
- Power-up surge, energy shield activation hum
- Satellite communication static crackle
- Server room ambient drone, hard drive seek
- Robotic servo whir, mechanical actuator click

### Emotional / Cinematic
- Dramatic orchestral swell (climax, reveal)
- Tension building low drone (suspense, buildup)
- Heartbeat pulse (urgency, anxiety)
- Warm ambient music (comfort, resolution)
- Silence then sudden impact (shock, twist)
- Cinematic bass drop (transition, impact)
- Piano melody, solo strings (intimacy, emotion)
- Choir swell (epic, transcendence)

### Human / Body
- Breathing: heavy, calm, nervous, gasping
- Footsteps on concrete, gravel, metal, wood, grass, water
- Armor creaking, leather stretching, fabric rustling
- Crowd murmur, gasp, cheer, scream
- Heartbeat, pulse, bone crack
- Laughter, whisper, sigh

### Vehicle / Mechanical
- Engine roar, turbo spool, exhaust pop
- Tire screech, gravel spray, brake squeal
- Ship horn, propeller churn, hull creak
- Train clatter, whistle, braking steel-on-steel
- Bicycle chain, gear shift click

### Impact / Physical
- Metal clang, sword clash, shield bash
- Glass shatter, wood splinter, stone crack
- Body slam, punch impact, thud
- Splash, crash, crumble
- Door slam, gate creak, latch click

### Nature / Wildlife
- Wolf howl, eagle cry, lion roar
- Horse gallop, hooves on stone
- Whale song, dolphin click
- Insect buzz, bee swarm, cicada drone
- Dog bark, cat hiss, bird flutter

### Sci-Fi / Fantasy
- Portal opening whoosh, dimensional rift hum
- Magic spell crackle, enchantment shimmer
- Lightsaber hum, plasma arc
- Spaceship engine rumble, warp drive surge
- Force field ripple, teleportation pop
- Crystal resonance, arcane energy pulse

### Music / Tonal
- Acoustic guitar strum, electric guitar riff
- Drum roll, snare hit, timpani boom
- Synth pad, bass line throb
- Ambient drone, ethereal chime
- Jazz piano, blues harmonica
- Tribal drum rhythm, ethnic flute

---

## 5. Camera Movement Vocabulary

**Rule: ONE camera movement per prompt.** Never combine multiple competing moves.

| Movement | Description | When to Use | Example Prompt Fragment |
|----------|------------|-------------|------------------------|
| Slow push-in | Camera moves toward subject | Emotional close-up, dramatic reveal, intimacy | "camera slowly pushes in toward the subject's face" |
| Slow pull-out | Camera moves away from subject | Reveal scale, establishing context, awe | "camera slowly pulls back revealing the full scene" |
| Slow pan left/right | Camera rotates horizontally | Environmental scanning, following action | "camera slowly pans right across the landscape" |
| Slight drift | Gentle lateral float | Subtle life, ambient scenes, warmth | "camera gently drifts to the right" |
| Static / locked | Camera does not move | Focus entirely on subject action | "camera stays locked, subject moves within frame" |
| Tilt up/down | Camera rotates vertically | Vertical reveal, showing height/depth | "camera slowly tilts upward revealing the sky" |
| Handheld sway | Slight organic wobble | Urgency, documentary feel, realism | "subtle handheld camera movement" |
| Locked + shake | Static with impact vibration | Explosion, impact, earthquake | "camera stays locked with subtle shake from impacts" |
| Dolly (lateral) | Camera slides sideways | Parallax depth, tracking alongside subject | "camera dollies left alongside the walking figure" |
| Crane up/down | Camera rises or descends | Dramatic reveal from above/below, power shift | "camera cranes upward revealing the full cityscape below" |
| Orbit | Camera circles subject | Hero moment, 360 reveal, showcase | "camera slowly orbits around the subject" |

### Movement Speed Guidelines

- **Slow/subtle movements** preserve text readability and prevent motion blur
- **Fast movements** (whip pan, rapid zoom) risk blurring text and confusing the model
- For scenes with text overlays: always use slow or static camera
- For high-energy action: medium-speed camera is acceptable, but avoid fast/extreme moves
- Match camera energy to content energy -- a calm scene needs a calm camera

---

## 6. Content-Type Animation Guide

### Action / High-Energy
| Aspect | Recommendation |
|--------|---------------|
| Duration | 10s (complex action) or 6s (quick impact) |
| Motion | HIGH energy -- primary action plays out (impacts, explosions, rapid movement) |
| Camera | Static with shake, or slow push-in |
| SFX | Loud, dramatic, impactful -- match the visual intensity |
| Tips | Front-load the action verb. Keep motion physically plausible. One primary action per prompt. |

### Ambient / Atmospheric
| Aspect | Recommendation |
|--------|---------------|
| Duration | 6s (loop-friendly) |
| Motion | SUBTLE -- slow atmospheric shifts, particles drifting, light changes, gentle sway |
| Camera | Slight drift or static |
| SFX | Environmental ambience, subtle textures, soft layers |
| Tips | Less is more. Let the image breathe. Gentle motion creates mood without distraction. |

### Data / Technology / UI
| Aspect | Recommendation |
|--------|---------------|
| Duration | 6s |
| Motion | Operational -- systems activating, data flowing, screens glowing, lights pulsing, holographic elements rotating |
| Camera | Slow pan or static |
| SFX | Technology sounds -- hum, beeps, mechanical whir, digital interface tones |
| Tips | Animate light and glow, not the entire interface. Keep data-display elements stable and readable. |

### Dramatic / Cinematic / Epic
| Aspect | Recommendation |
|--------|---------------|
| Duration | 10s or 15s (dramatic payoff needs time) |
| Motion | Maximum drama -- energy rippling, forces colliding, scale revealed, emotional peak |
| Camera | Slow pull-out to reveal scale, or crane up for grandeur |
| SFX | Orchestral swell, impact sounds, cinematic crescendo, bass drop |
| Tips | Build toward a single climactic moment. Let the camera reveal support the drama. |

### Dialogue / Talking Head / Presenter
| Aspect | Recommendation |
|--------|---------------|
| Duration | 6s (short expression) or 10s (longer delivery) |
| Motion | Facial expression shifts, subtle gestures, head turns, eye movement, natural body sway |
| Camera | Very slow push-in for intimacy, or static |
| SFX | Warm ambient background, subtle room tone |
| Tips | Grok 3 does NOT support lip-sync. For actual dialogue, use VEO 3.1 instead. Grok works for silent expression and gesture. |
| Limitation | Avoid complex hand/finger motion -- Grok struggles with detailed hand animation |

### Product / Showcase
| Aspect | Recommendation |
|--------|---------------|
| Duration | 6s (quick showcase) or 10s (detailed) |
| Motion | Product rotating slowly, light catching surfaces, reflections shifting, particles/sparkle |
| Camera | Slow orbit around product, or slight drift |
| SFX | Clean, premium sounds -- subtle whoosh, crystalline chime, soft impact |
| Tips | Keep the product as the clear focal point. Animate light and environment, not product deformation. |

### Landscape / Travel / Establishing
| Aspect | Recommendation |
|--------|---------------|
| Duration | 10s or 15s (immersive) |
| Motion | Clouds drifting, water flowing, wind in vegetation, light shifting, birds flying |
| Camera | Slow pan across vista, crane up, or gentle drift |
| SFX | Full environmental soundscape -- wind, water, wildlife, distance |
| Tips | Layer multiple subtle motions for richness. Wide shots benefit from longer duration. |

---

## 7. Prompt Templates

### Generic Image-to-Video Template

```
[Primary motion -- what moves/animates in the scene, front-loaded with key action].
[Camera movement -- one single, deliberate move].
[Text preservation -- if image contains text overlays].
[SFX/audio -- specific sounds matching the scene mood and content].
```

### Template: Standard Scene (No Text)

```
[Subject/element] [action verb] [motion details], [secondary motion element].
Camera [single movement description].
[Specific SFX sounds matching the scene].
```

### Template: Scene with Text Overlays

```
[Subject/element] [action verb] [motion details], [secondary motion element].
Camera [single movement description].
All text, headlines, branding, and overlays remain sharp and readable throughout.
[Specific SFX sounds matching the scene].
```

### Example Prompts

**Action -- warrior under fire (10s):**
> Bullets slam into the bronze shield creating sparks and metal fragments flying outward, the warrior flinches behind the shield as smoke and dust swirl around the impact zone. Camera stays locked with subtle shake from each impact. Loud rapid gunfire bursts, bullet ricochets on metal, shell casings clinking on stone, dramatic cinematic bass impact.

**Ambient -- city skyline at dusk (6s):**
> Warm golden light slowly shifts across the glass facades of the buildings as distant traffic moves along the highway below, airplane lights blink crossing the sky. Camera gently drifts to the right. Soft city ambient hum, distant traffic drone, faint airplane engine passing overhead.

**Technology -- satellite in orbit (6s):**
> The satellite's solar panels slowly rotate catching sunlight as the cyan scanning beam sweeps across Earth's curved surface below, a faint exhaust trail rises from the atmosphere. Camera stays locked on the satellite. Subtle space ambient hum, faint electronic scanning beeps, distant rocket exhaust whoosh.

**Dramatic -- energy shield under attack (15s):**
> Missiles impact the glowing hexagonal energy shield creating rippling golden shockwaves across its surface, explosion debris scatters outward, the shield pulses brighter with each successive hit while the city below remains untouched. Camera slowly pulls back revealing the full scale of the shield dome. Dramatic orchestral crescendo, deep energy shield hum, missile impact explosions, cinematic bass swell building to climax.

**Product -- sneaker showcase (6s):**
> The shoe slowly rotates on the pedestal as studio light catches the textured surface creating shifting highlights, subtle dust particles drift through the spotlight beam. Camera slowly orbits around the shoe. Clean premium whoosh on rotation, soft crystalline chime on highlight catch, minimal ambient tone.

**Landscape -- mountain lake sunrise (10s):**
> Golden sunrise light gradually spreads across the mountain peaks and reflects on the still lake surface, gentle mist drifts above the water, a flock of birds rises from the treeline in the distance. Camera slowly pans right across the panoramic vista. Morning birdsong, gentle water lapping, soft wind through pine trees, distant bird calls.

**Portrait with text overlay -- motivational quote (6s):**
> The subject's expression shifts subtly into a confident half-smile, soft bokeh lights drift slowly in the warm background, a gentle breeze moves through their hair. Camera slowly pushes in toward the subject's face. All text, headlines, branding, and overlays remain sharp and readable throughout. Warm ambient music, soft inspirational piano notes, gentle atmospheric swell.

---

## 8. Duration Selection Guide

| Duration | Best For | Notes |
|----------|----------|-------|
| **6s** | Standard scenes, ambient loops, quick showcases, simple motion, data/UI | Default choice. Sufficient for most single-action scenes. Keeps file size small. |
| **10s** | Action sequences, dramatic reveals, presenter expressions, product showcases, storytelling | Use when the motion needs time to develop or when multiple elements animate sequentially. |
| **15s** | Epic/cinematic payoffs, landscape panoramas, complex multi-element scenes, extended reveals | Maximum duration. Use for high-impact moments that need full build-up and resolution. Reserve for the most important scenes. |

### Decision Logic

```
Is it a simple, single-motion scene?           --> 6s
Does the action need buildup or payoff?         --> 10s
Is it a cinematic climax or panoramic sweep?    --> 15s
Are you unsure?                                 --> Start with 6s, extend if motion feels rushed
```

---

## 9. Quality Checklist

Every Grok 3 video prompt must pass at least 6 of these 8 checks before delivery.

| # | Check | Description |
|---|-------|-------------|
| 1 | **Motion-only prompt** | Prompt describes ONLY what moves and sounds -- no re-description of static image elements |
| 2 | **Single camera movement** | Exactly one camera movement (or explicitly static) -- no competing moves |
| 3 | **Front-loaded priority** | The most important motion/action appears in the first 20-30 words |
| 4 | **Specific SFX direction** | Audio cues are named specifically (not generic "add sound" or "add music") |
| 5 | **Appropriate duration** | Duration matches content complexity: 6s for simple, 10s for moderate, 15s for cinematic |
| 6 | **Text preservation included** | If source image has text overlays, prompt explicitly states text must remain sharp and readable |
| 7 | **No negative language** | Prompt contains zero negative instructions (no "don't," "avoid," "no blur," "without") |
| 8 | **Physically plausible motion** | Described motion is achievable and natural for the scene content (no impossible hand detail, no physics-breaking action) |

---

## 10. Common Mistakes

| Mistake | Why It Fails | Fix |
|---------|-------------|-----|
| Re-describing the entire scene | Image already contains the visuals; re-describing confuses the model and wastes prompt weight | Describe ONLY what MOVES and what SOUNDS |
| Multiple camera movements | Grok tries to execute all of them, producing jerky or conflicting motion | Pick ONE camera movement per prompt |
| No SFX direction | Model generates silent or random ambient audio | Always include specific, named audio cues |
| Generic audio ("add music") | Produces vague, unfitting background sound | Be specific: "dramatic orchestral swell" or "rapid gunfire bursts" |
| Using negative prompts | Grok 3 ignores negative instructions entirely; they waste prompt space | Rewrite as positive: "sharp focus" instead of "no blur" |
| Too long for simple scene | Over-prompting dilutes priority and produces muddled results | Match duration to complexity: 6s for most scenes |
| Complex hand/finger motion | Grok frequently produces six fingers, merged limbs, wrong thumb placement | Keep hand actions simple or crop hands out of frame |
| Extreme camera movement | Fast zooms and rapid pans blur text and confuse scene coherence | Keep camera movements slow and subtle |
| Text zone cropped by push-in | Camera pushes past text overlays, making them unreadable or cut off | Frame push-in so text zones are never cropped |
| Burying key action mid-prompt | The model weights the first 20-30 words most heavily; late content may be ignored | Front-load the primary action in the first sentence |
| Requesting lip-sync/dialogue | Grok 3 does not support lip-sync; speech will look unnatural | Use VEO 3.1 for any scene requiring spoken dialogue |
| Mixing styles in one prompt | Asking for both "photorealistic" and "anime style" produces incoherent output | Commit to one visual style per prompt |
| Prompting for image generation | Writing prompts that describe what the image should look like, not how it should move | Remember: the image already exists. Prompt for ANIMATION only |

---

## 11. Grok 3 UI Settings Quick Reference

| Setting | Recommended Value | Notes |
|---------|-------------------|-------|
| Model | Grok 3 | Always select Grok 3 for video generation |
| Image Reference | Upload source image (PNG/JPG) | The image that will be animated |
| Generation Mode | Custom | Gives full control over prompt |
| Prompt Type | Basic (single text field) | Use the single prompt field -- no structured/advanced mode |
| Orientation | Match source image aspect ratio | See orientation table below |
| Resolution | High 720p (HD) | Recommended for all use cases |
| Duration | 6s / 10s / 15s | See Duration Selection Guide (Section 8) |

### Orientation Selection

| Source Image Ratio | Closest Grok 3 Orientation |
|-------------------|---------------------------|
| 16:9 (widescreen) | Landscape (16:9) |
| 9:16 (vertical video) | Portrait (9:16) |
| 1:1 (square) | Square (1:1) |
| 4:5 (IG feed) | Vertical (2:3) -- closest match |
| 3:2 (classic photo) | Horizontal (3:2) |
| 2:3 (portrait photo) | Vertical (2:3) |
| 4:3 | Horizontal (3:2) -- closest match |
| 21:9 (ultrawide) | Landscape (16:9) -- closest match |

### Workflow Steps

1. Open Grok 3 Imagine Video interface
2. Upload source image as Image Reference
3. Select orientation matching the source image
4. Set resolution to 720p HD
5. Choose duration (6s default, adjust per content type)
6. Write prompt following the formula: `[motion] + [camera] + [text preservation] + [SFX]`
7. Generate and review
8. If text is blurred or motion is wrong, adjust prompt and regenerate

---

## Quick Reference Card

```
FORMULA:   [motion] + [camera] + [text preservation if needed] + [SFX]
PRIORITY:  First 20-30 words matter most
LENGTH:    50-100 words optimal (max 200)
NEGATIVES: NOT SUPPORTED -- describe only what you want
CAMERA:    ONE movement per prompt
DURATION:  6s default / 10s action / 15s cinematic
TEXT:      Explicitly state "all text remains sharp and readable" when present
AUDIO:     Always name specific sounds -- never generic
HANDS:     Keep simple or out of frame
LIP-SYNC:  Not supported -- use VEO 3.1 for dialogue
```

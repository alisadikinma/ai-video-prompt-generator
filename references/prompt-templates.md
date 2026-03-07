# Prompt Templates
## Per-Platform Video Prompt Templates with Fill-In Sections

> **GOLDEN RULE: IMAGE = ALL VISUALS, VIDEO = MOTION ONLY.**
> The source image already contains every visual detail -- face, wardrobe, environment, lighting, color, composition. The video prompt describes exclusively what MOVES and what SOUNDS. Never re-describe static visual elements that exist in the image.

---

## 1. Grok 3 Template

### Platform Specs
| Parameter | Value |
|-----------|-------|
| Max Duration | 6s / 10s / 15s |
| Resolution | 720p (HD) |
| Orientations | 16:9, 9:16, 1:1, 4:3, 3:4, 2:3, 3:2 (7 ratios) |
| Prompt Weight | First 20-30 words weighted most heavily |
| Word Count | 50-100 words optimal |
| Negative Prompts | NOT supported |
| Audio | Native (SFX + dialogue + music) |
| Lip-sync | Yes (single character, v1.0+, face >=20% frame, MCU/CU only) |
| Dialogue | `Speech: [text]` in Custom mode (see `voice-emotion-direction.md`) |

### SIMPLICITY RULE (Grok-Specific)
```
Max 2 subject motions (1 primary + 1 secondary)
1 camera movement (or static)
1 ambient motion element (optional)
2-3 SFX (1 foreground + 1 ambient + optional accent)
TOTAL: ~5 moving/sounding elements MAX
LESS IS MORE: Grok fills creative gaps — over-specifying causes chaos.
```

### Template
```
[PRIMARY MOTION — the ONE main thing that moves, front-loaded in first 20 words].
[SECONDARY MOTION — one supporting element, optional].
Camera [single move: static / slow push-in / slow pan / slight drift / tilt].
[TEXT PRESERVATION — if image has text: "all text remains sharp and readable throughout"].
[DIALOGUE — Speech: [8-10 words] if lip-sync needed. Static camera required.].
[SFX — 2-3 specific named sounds matching the scene].
```

### Formatting Rules
- **First sentence = primary motion** (most important action, first 20 words)
- **ONE camera movement only.** Never combine moves
- **Max 2 subject motions.** More than 2 concurrent animations = chaos
- Be specific with SFX — name exact sounds, but limit to 2-3 layers
- No negative prompts. Reframe: "sharp focus" instead of "no blur"
- If text/branding in image, explicitly instruct preservation
- For lip-sync: static camera, face >=20% frame, MCU/CU shot

### Example: Simple (Presenter, 6s)
```
Expression warms into a confident smile, one hand gestures gently. Camera stays static. Soft room ambient, warm conversational tone.
```

### Example: Action Scene (10s)
```
Sparks and metal fragments fly from shield impacts, warrior flinches behind the shield. Camera stays locked with subtle shake. Rapid gunfire bursts, bullet ricochets on metal, dramatic bass impact.
```

### Example: Ambient / B-Roll (6s)
```
Golden light slowly shifts across glass facades, distant traffic moves along the highway. Camera gently drifts right. Soft city hum, faint airplane engine overhead.
```

### Example: Carousel Slide with Text (6s)
```
Background slowly recedes while foreground cards lift forward creating depth separation. Camera holds static. All text, headlines, and branding remain sharp and readable throughout. Deep bass hum, crisp digital chirps.
```

### Example: Dialogue / Talking Head (10s)
```
Expression warms into genuine confidence, subtle nod for emphasis. Camera slowly pushes in from MCU toward CU. Speech: You can see every worker, right now, on one screen. Warm room ambient, soft HVAC hum.
```

### Example: Product Demo (15s — 3-act structure)
```
Eyebrows rise in challenge to camera; knowing smile breaks through (0-5s); head tilts forward, one hand rises in presenting gesture (5-10s); single slow nod, jaw sets with conviction (10-15s). Camera pushes in steadily from MCU toward tight CU. Speech: Do you actually know where every worker on your floor is right now? Low tension drone, server hum, bass pulse on the nod.
```

### Template: Product Demo Video — 15s
```
Content: Product demo | Voice: Creator lip-sync | Face >=20% frame

[SETUP 0-5s: ONE bold opening motion — stop the scroll];
[DEVELOP 5-10s: ONE secondary motion responds];
[PAYOFF 10-15s: Resolution — hold or settle].
Camera [single sustained movement across full 15s].
Speech: [max 20-25 words, split into 2-3 short phrases].
[2-3 SFX: foreground action + ambient atmosphere].
```

### Grok Lip-Sync Template (Verified Working)

**Prerequisites:** Face >=20% frame, MCU/CU shot, Custom mode, static or very slow camera.

```
[ONE facial expression shift — smile, nod, or brow raise].
Camera [static OR very slow push-in toward face].
Speech: [8-10 words, punchy, conversational — not formal/written].
[1-2 ambient SFX — room tone, soft background].
```

**Working examples:**

```
# 6s — Short CTA
Warm smile, slight forward lean toward camera. Camera static.
Speech: Start your free pilot today.
Soft ambient tone, gentle atmospheric swell.
```

```
# 10s — Explanation
Expression shifts from focused to knowing smile, subtle nod. Camera slowly pushes in from MCU to CU.
Speech: Every worker, every zone, every second — that is real-time.
Quiet office ambient, soft HVAC hum.
```

```
# 10s — Hook question
Eyebrow raises, slight head tilt, direct eye contact. Camera static, locked.
Speech: Do you know where every worker is right now?
Tension drone, server room hum.
```

**Anti-patterns (DO NOT):**
- Camera panning/orbiting during speech (kills sync)
- More than 15 words in Speech: (garbled output)
- Wide shot with small face (lip-sync won't trigger)
- Complex emotion progression (keep to ONE tone)
- Multiple speakers in same clip (speech applies globally)

---

## 2. VEO 3.1 Template

### Platform Specs
| Parameter | Value |
|-----------|-------|
| Max Duration | 8 seconds |
| Resolution | 720p (default), 1080p |
| Aspect Ratios | 16:9, 9:16 |
| Frame Rate | 24fps |
| Optimal Word Count | 100-150 words |
| Max Tokens | 1,024 |
| Dialogue Limit | 12-15 words per 8s clip |
| Dialogue Format | `[Character] says: "[dialogue]"` (colon syntax REQUIRED) |
| Required Exclusions | `"no subtitles, no audience sounds"` in every prompt |
| Audio | Native audio synthesis, generated in single pass with video |
| Negative Prompts | Supported |

### Template
```
~[DURATION] seconds, [RESOLUTION], [ASPECT RATIO].

Camera: [single movement type from camera library], [speed].

Subject motion: [micro-movements -- blinks, breathing, gestures, expression shifts].

[EXPRESSION SHIFT: if emotional change occurs, describe transition].

Ambient motion: [atmospheric particles, environmental elements, light behavior].

Audio: [specific ambient description], [dialogue if any using colon syntax],
       no subtitles, no audience sounds[, no background music if dialogue].

Maintain exact lighting, environment, and appearance from reference image.

Negative: [exclusions -- no blurry faces, no distortion, no text overlays, no identity morphing].
```

### Formatting Rules
- Always specify duration, resolution, and aspect ratio at the top
- Camera movement uses VEO-verified terms only (see camera-movement-library.md)
- Dialogue MUST use colon syntax: `says:` not `says ""`
- Dialogue max 12-15 words per 8-second clip
- Always include `"no subtitles, no audience sounds"` in audio block
- Always end with negative prompt block
- For I2V: include `"Maintain exact lighting, environment, and appearance from reference image"`
- Audio is NOT optional. Unspecified audio causes model to guess

### Example: Simple (B-Roll Environment)
```
~6 seconds, 720p, 16:9.

Camera: slow pan right across the cityscape, contemplative pacing.

Subject motion: none — environment focus.

Ambient motion: atmospheric haze drifting slowly, distant traffic flowing along
the highway, building lights flickering intermittently, clouds drifting across sky.

Audio: city ambient — distant traffic hum, soft wind, occasional distant horn.
       No music, no subtitles, no audience sounds.

Maintain exact lighting, environment, and appearance from reference image.

Negative: no blurry elements, no distortion, no text overlays, no cartoon effects.
```

### Example: Complex (Creator Dialogue Shot)
```
~8 seconds, 1080p, 9:16.

Camera: gentle dolly push-in toward subject face, ending at medium close-up.

Subject motion: subtle eye blinks every 2-3 seconds, natural teaching gestures
with right hand emphasizing key points, slight head tilts of engagement,
relaxed breathing motion visible in shoulders. Expression shifts from focused
concentration to warm knowing smile at the reveal.

Ambient motion: floating dust particles drifting through warm light beam,
monitor screen behind subject subtly shifting, soft background bokeh alive.

Audio: quiet modern office ambiance — soft HVAC hum, distant keyboard typing.
       Creator says: "This one technique changed everything about how I approach video."
       No background music, no subtitles, no audience sounds.

Maintain exact lighting, environment, and appearance from reference image.

Negative: no blurry face, no distorted hands, no text overlays, no watermarks,
          no identity morphing, no cartoon effects, no audience laughter.
```

---

## 3. Sora 2 Template

### Platform Specs
| Parameter | Value |
|-----------|-------|
| Max Duration | 4s / 8s / 12s (API); 20s (Pro) |
| Resolution | 720p (standard) / 1080p (Pro) |
| Aspect Ratios | 16:9, 9:16, 1:1 |
| Key Rule | ONE camera move + ONE subject action per shot |
| Dialogue Limit | 15-20 words per 10s clip |
| Dialogue Format | `"[Character]: [dialogue]"` |
| Beat Timing | Subject action should be timed in beats |
| Image Reference | Used as first frame — prompt describes what happens NEXT |

### Template
```
[SORA 2 PROMPT]

Duration: [duration] seconds
Resolution: 720p
Aspect: [9:16 or 16:9]

Camera: [single movement], [speed], [stability].

Subject: [one primary action described in beat timing]:
- (0-2s): [initial position/action]
- (2-5s): [development — expression change, gesture, movement]
- (5-[end]s): [completion — final pose/hold]

Ambient: [environmental motion elements].

Audio:
- Ambient: [environmental sounds]
- Effects: [specific SFX]
- [Dialogue if any]: "[Character]: [15-20 words max]"

Physics: Natural motion, realistic timing, gravity applies normally.

Maintain appearance and lighting from reference image. No text overlays, no morphing.
```

### Formatting Rules
- ONE camera movement per shot, absolutely enforced
- ONE primary subject action per shot
- Beat-based timing structures the action across the duration
- Image reference = first frame. Prompt describes what happens NEXT from that frame
- Never re-describe visuals already in the reference image
- Keep dialogue minimal, plan for ADR in post-production

### Example: Simple (Product Reveal)
```
Duration: 6 seconds
Resolution: 720p
Aspect: 16:9

Camera: slow orbit around product, smooth and premium.

Subject: product hero — no human presence.
- (0-2s): light catches surface, specular highlight shifts
- (2-4s): rotation reveals secondary detail, reflection moves
- (4-6s): settling angle with premium light interaction

Ambient: floating dust particles catching light, subtle reflections on polished surface.

Audio:
- Ambient: soft ambient tone, clean studio atmosphere
- Effects: subtle product hum, soft mechanical click

Physics: Natural motion, realistic timing.

Maintain lighting from reference. No text overlays, no morphing.
```

### Example: Complex (Creator Talking Head)
```
Duration: 10 seconds
Resolution: 720p
Aspect: 9:16

Camera: static shot, stable tripod, very gentle drift right.

Subject: Creator maintains eye contact with camera.
- (0-3s): turns slightly toward camera, settled posture, eyes engage viewer
- (3-6s): speaks with measured gestures, one hand rises to emphasize point, subtle head tilt
- (6-10s): expression shifts to warm confidence, slight nod, holds final pose

Ambient: background monitor screen shifting subtly, floating particles in warm light.

Audio:
- Ambient: quiet office atmosphere, soft HVAC hum
- Effects: subtle room tone
- Dialogue: "Creator: The key insight is simpler than you think, and it starts with one small change."

Physics: Natural motion, realistic timing, gravity applies normally. Single action per beat.

Maintain exact appearance and lighting from reference. No text overlays, no morphing, no identity drift.
```

---

## 4. Kling 3.0 Template

### Platform Specs
| Parameter | Value |
|-----------|-------|
| Max Duration | 5s / 10s / 15s |
| Resolution | 1080p |
| Aspect Ratios | 9:16, 16:9 |
| Negative Prompts | Supported |
| Dialogue | NOT natively supported |
| Audio | No native audio (Wan 2.5 variant has audio) |

### Template
```
Camera: [single movement], [speed].

Subject motion: [primary action — gestures, expression shifts, body movement].

Ambient motion: [environmental elements in motion — particles, foliage, water, light].

[Audio atmosphere: environmental sounds description].

Negative prompt: [exclusions — blurry, distorted, cartoon, text overlays, morphing]
```

### Formatting Rules
- Keep prompts concise and direct
- Camera movement + subject motion + ambient motion in clear sections
- Negative prompt goes in the dedicated negative prompt field
- No dialogue generation. All speech must be added in post
- Focus audio direction on environmental sounds only

### Example: Simple (Portrait Animation)
```
Camera: static shot, locked tripod.

Subject motion: subtle eye blinks every 2-3 seconds, gentle breathing motion
in shoulders, micro-expression shift from neutral to slight warm smile.

Ambient motion: hair strands shifting gently with air, soft background bokeh alive.

Audio atmosphere: quiet indoor ambient, soft room tone.

Negative prompt: blurry, distorted hands, cartoon effects, text overlays, identity morphing, unnatural proportions.
```

### Example: Complex (Landscape with Figure)
```
Camera: slow crane shot rising, revealing the full valley below.

Subject motion: figure stands at cliff edge, coat fabric billowing in strong wind,
hair streaming to the left, posture shifts from contemplative to resolute —
shoulders square, chin lifts.

Ambient motion: clouds moving across sky casting shifting shadows on valley floor,
foliage swaying in gusts, distant waterfall mist drifting, birds circling far below.

Audio atmosphere: strong wind howling, distant waterfall roar, bird calls echoing.

Negative prompt: blurry, pixelated, cartoon style, text overlays, distorted proportions,
morphing, unnatural colors, compression artifacts.
```

---

## 5. Seedance 2.0 Template

### Platform Specs
| Parameter | Value |
|-----------|-------|
| Max Duration | 3s - 12s |
| Resolution | Up to 2K |
| Aspect Ratios | 16:9, 9:16, 1:1 |
| Audio | Native audio-video sync |
| Dialogue | Basic short phrases supported |
| Style | Strong on dance/motion/rhythm content |

### Template
```
[SUBJECT]: [who/what is the subject, brief identification].
[ACTION]: [what the subject does — primary motion described clearly].
[CAMERA]: [single camera movement, direction, speed].
[STYLE]: [visual style or mood — cinematic, energetic, dreamy, etc.].
[AUDIO]: [music, SFX, ambient sounds — be specific].
```

### Formatting Rules
- Keep prompts short and punchy. Seedance responds best to clear, direct instructions
- Subject identification can be brief since image provides visuals
- Action should be a single clear motion
- Style keyword guides the overall aesthetic
- Audio description should be specific and mood-appropriate

### Example: Simple (Dancing Figure)
```
Subject: dancer in flowing red dress.
Action: spins gracefully with arms extending outward, dress fabric spiraling.
Camera: slow orbit circling subject.
Style: cinematic, dramatic, graceful.
Audio: orchestral waltz swell, fabric whooshing through air, soft footstep on wooden floor.
```

### Example: Complex (Urban Scene)
```
Subject: street musician with acoustic guitar on busy corner.
Action: fingers strum guitar rhythmically, body sways to the beat, head nods with
the tempo, foot taps keeping time. Passersby slow to listen, one person stops fully.
Camera: gentle dolly push-in from medium shot to medium close-up.
Style: documentary, warm golden hour, authentic street feel.
Audio: acoustic guitar melody clear and present, city traffic ambient underneath,
distant crowd noise, footsteps on concrete, occasional car passing.
```

---

## Universal Rules (All Platforms)

### The Motion-Only Principle
| What the Image Contains | What the Video Prompt Contains |
|------------------------|-------------------------------|
| Face, wardrobe, physical appearance | Camera movement |
| Lighting, color grading, shadows | Subject micro-motion |
| Environment, set, background | Ambient motion |
| Composition, framing, lens feel | Audio specification |
| Film stock, visual style | Transition/continuity |

**NEVER duplicate visual details in the video prompt.**
Always include: `"Maintain exact lighting, environment, and appearance from reference image."`

### One Camera Movement Rule
Every platform enforces or strongly benefits from a single camera movement per prompt. Combining movements produces chaotic, unusable output. Pick the ONE movement that best serves the emotional beat.

### Audio Is Mandatory
Never leave audio unspecified. Every platform will guess if you do not specify, and the guesses are frequently wrong (random laughter, wrong music genre, complete silence where ambience should exist).

### Word Count Guidelines
| Platform | Optimal Range | Maximum |
|----------|--------------|---------|
| Grok 3 | 50-100 words | ~150 words |
| VEO 3.1 | 100-150 words | 1,024 tokens |
| Sora 2 | 80-120 words | ~200 words |
| Kling 3.0 | 50-100 words | ~150 words |
| Seedance 2.0 | 40-80 words | ~120 words |

### Dialogue Limits
| Platform | Max Words per Clip | Format |
|----------|-------------------|--------|
| Grok 3 | 12-15 words / 10s | `Speech: [text]` (Custom mode) |
| VEO 3.1 | 12-15 words / 8s | `says: "dialogue"` (colon syntax) |
| Sora 2 | 15-20 words / 10s | `"Character: dialogue"` |
| Kling 3.0 | Via voice reference | Voice ref URL + dialogue text |
| Seedance 2.0 | 5-10 words / 5-8s | Short phrases only |

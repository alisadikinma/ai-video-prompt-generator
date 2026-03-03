# VEO 3.1 Image-to-Video Reference Guide
## SECONDARY Platform — Use when lip-sync/dialogue needed. Default is Grok 3.

---

## Section 1: Technical Specs

| Specification | Value | Notes |
|---------------|-------|-------|
| Resolution | 1080p | 1080p only for 8-second clips; 720p default |
| Duration | 4s, 6s, 8s | 8s required for extensions |
| Aspect Ratios | 16:9, 9:16 | 1:1 NOT supported |
| Frame Rate | 24fps | Fixed |
| Max Tokens | 1,024 | Optimal prompt length: 100-150 words |
| Extensions | +7s per hop | Max 20 extensions (~148s total) |
| Reference Images | Up to 3 | Asset or style type |
| Extension Resolution | 720p only | 1080p cannot extend |
| Extension Context | Final 24 frames (1s) | Uses last second for continuity |

### Pricing

| Quality | With Audio | Without Audio |
|---------|------------|---------------|
| Standard | $0.40/second | $0.20/second |
| VEO 3.1 Fast | $0.15/second | $0.10/second |

8-second clip with audio: $3.20 (standard) or $1.20 (fast).

---

## Section 2: Audio Constraints (CRITICAL)

**Audio is NOT optional.** Unspecified audio causes the model to guess, often incorrectly (random "studio audience" laughter is common).

| Parameter | Constraint |
|-----------|------------|
| Dialogue per 8s | 12-15 words MAX |
| Syllables per 8s | 20-25 syllables MAX |
| Dialogue Format | `[Character] says: "[dialogue]"` |
| Required Exclusions | "no subtitles, no audience sounds" |

### Dialogue Timing by Duration

| Clip Duration | Max Words | Example |
|---------------|-----------|---------|
| 4 seconds | 8-10 words | "Welcome to the channel, let's dive in." |
| 6 seconds | 12-15 words | "Today I'll show you something that will change how you work." |
| 8 seconds | 15-20 words | "This technology is revolutionizing the industry, and I'm going to explain exactly why." |

### Audio Specification Templates

**Office/Professional:**
```
Audio: Quiet modern office ambiance -- soft HVAC hum,
       distant keyboard typing, occasional muffled voices.
       No music, no audience sounds, no subtitles.
```

**Home/Casual:**
```
Audio: Comfortable home atmosphere -- soft room tone,
       subtle ambient life sounds (distant traffic, birds).
       No music, no audience, no subtitles.
```

**Studio:**
```
Audio: Professional event atmosphere -- room tone with subtle reverb,
       soft audience presence (no laughter/applause unless specified).
       No music, no subtitles.
```

**Tech/Server:**
```
Audio: Data center atmosphere -- server fan hum,
       subtle electronic ambient, cool mechanical space.
       No music, no voice, no subtitles.
```

**Outdoor/Natural:**
```
Audio: Natural outdoor ambiance -- wind, birds,
       environmental sounds appropriate to location.
       No music unless specified, no subtitles.
```

### Dialogue Audio Format

```
Audio: [ambient as above]
       [Character name] says: "[Exactly 12-15 words maximum]"
       No subtitles, no text overlays.
```

---

## Section 3: Camera Movement Library (VEO-Verified)

### 3.1 Static Shots

| Term | Effect | When to Use |
|------|--------|-------------|
| `static shot` | No movement | Stability, authority, formal |
| `locked-off shot` | Fixed tripod feel | Documentary, observation |
| `fixed camera` | Intentional stillness | Contemplation, tension |

### 3.2 Push/Pull Movements

| Term | Effect | Emotional Impact |
|------|--------|------------------|
| `smooth dolly push-in` | Approach subject | Building intimacy, focus |
| `gentle dolly push-in` | Subtle approach | Soft revelation |
| `slow dolly-in` | Gradual approach | Growing tension, emphasis |
| `dolly-out` | Retreat from subject | Detachment, reveal context |
| `gentle dolly pull-back` | Soft retreat | Conclusion, release |

### 3.3 Lateral Movements

| Term | Effect | Best For |
|------|--------|----------|
| `tracking shot following subject` | Parallel movement | Walking, action |
| `smooth tracking shot` | Polished lateral | Professional feel |
| `truck left` | Camera moves left | Reveal, transition |
| `truck right` | Camera moves right | Reveal, transition |

### 3.4 Rotational Movements

| Term | Effect | Emotional Impact |
|------|--------|------------------|
| `slow pan left/right` | Horizontal reveal | Environment scan |
| `whip pan` | Fast horizontal | Energy, transition |
| `tilt up` | Vertical reveal upward | Scale, power |
| `tilt down` | Vertical reveal downward | Vulnerability, detail |

### 3.5 Complex Movements

| Term | Effect | When to Use |
|------|--------|-------------|
| `crane shot rising` | Vertical ascent | Grand reveal, triumph |
| `crane shot descending` | Vertical descent | Intimate arrival |
| `orbit shot circling subject` | 360-degree rotation | Dynamic tension |
| `180-degree arc shot` | Half orbit | Dramatic emphasis |
| `Steadicam floating movement` | Smooth complex path | Immersive following |

### 3.6 Stylistic Movements

| Term | Effect | Aesthetic |
|------|--------|-----------|
| `handheld camera` | Organic shake | Documentary, visceral |
| `documentary-style` | Observational | Realism, authenticity |
| `shaky cam` | Intentional instability | Tension, chaos |

### Movement to Emotion Quick Reference

| Desired Emotion | Camera Movement |
|-----------------|-----------------|
| Authority | Static or very slow push-in |
| Intimacy | Gentle push-in |
| Energy | Tracking, orbit |
| Tension | Slow push-in or handheld |
| Revelation | Quick push-in or sudden stop |
| Detachment | Pull-back, static |

---

## Section 4: I2V Motion Description Library

### Principle

For Image-to-Video: **Describe MOTION only, not visuals.** The model already sees the image.

### 4.1 Subject Micro-Movements

**Face and Expression:**
```
"subtle eye blinks every 2-3 seconds"
"gentle micro-expressions shifting"
"slight narrowing of eyes in focus"
"subtle smile emerging gradually"
"eyebrows raising slightly in interest"
"natural facial muscle micro-movements"
```

**Head and Posture:**
```
"subtle head tilt suggesting thought"
"gentle nod of understanding"
"slight turn toward camera"
"natural postural sway while standing"
"subtle forward lean of engagement"
"relaxed breathing motion in shoulders"
```

**Hands and Gestures:**
```
"subtle hand gesture emphasizing point"
"fingers gently tapping surface"
"natural hand position adjustment"
"gesture completing then returning to rest"
"subtle fidget of held object"
```

### 4.2 Ambient Motion Elements

**Atmospheric:**
```
"floating dust particles drifting through light beam"
"subtle haze drift across frame"
"gentle smoke wisps rising"
"atmospheric particles catching light"
"volumetric rays shifting subtly"
```

**Environmental:**
```
"monitor screen content subtly shifting"
"LED indicator lights blinking naturally"
"subtle fabric movement from air"
"background foliage gentle sway"
"water surface micro-ripples"
"curtain edge gentle flutter"
```

**Light and Shadow:**
```
"subtle light flicker from screen"
"gentle shadow shift as clouds pass"
"warm light slowly intensifying"
"cool ambient light subtle pulse"
```

### 4.3 Emotion-to-Motion Mapping

**Authority/Confidence:**
- Camera: static shot or very slow dolly push-in
- Subject: minimal movement, steady posture, deliberate slow gestures
- Expression: unwavering gaze, subtle controlled smile

**Curiosity/Engagement:**
- Camera: gentle tracking or subtle orbit
- Subject: slight head tilts, engaged forward lean, active eye movement
- Expression: brightening eyes, raised brows, open expression

**Tension/Intensity:**
- Camera: slow push-in building pressure, or handheld slight shake
- Subject: rigid stillness or tense micro-movements
- Expression: fixed intense gaze, tight jaw, minimal blinks

**Warmth/Connection:**
- Camera: gentle approach or soft orbit
- Subject: relaxed natural movement, genuine gestures
- Expression: warm smile developing, soft eye contact

**Contemplation/Thought:**
- Camera: static or very slow drift
- Subject: subtle weight shifts, hand to chin, gaze movement
- Expression: thoughtful distant look, processing visible

---

## Section 5: Lip-Sync Mastery

### 5.1 The Colon Syntax (CRITICAL)

The single most important technical detail for VEO 3.1 lip sync. This triggers the audio system correctly and prevents unwanted subtitle generation.

**CORRECT Format:**
```
A woman says: Welcome to my channel!
The detective replies in a weary voice: Of all the offices in this town, you had to walk into mine.
He looks at camera and says: This changes everything.
```

**INCORRECT Format (causes subtitles or sync failures):**
```
A woman says "Welcome to my channel"
She says, "Welcome"
"Welcome to my channel" (no speaker attribution)
```

**Why colon syntax works:** The colon format triggers VEO's audio generation system directly, while quote-only format often gets interpreted as caption/subtitle instruction.

### 5.2 Face Requirements

**Minimum Face Size:**

| Face Size (% of frame) | Lip Sync Quality |
|------------------------|------------------|
| 30%+ of frame | Excellent -- clear articulation |
| 20-30% of frame | Good -- reliable sync |
| 15-20% of frame | Marginal -- micro-movements |
| <15% of frame | FAILS -- cannot render accurately |

**Shot Type Recommendations:**

| Shot Type | Lip Sync Quality | Use Case |
|-----------|------------------|----------|
| Close-up (CU) | Best | Hook, CTA, emotional moments |
| Medium Close-up (MCU) | Excellent | Dialogue, explanation |
| Medium Shot (MS) | Good | Context with dialogue |
| Wide Shot (WS) | Poor -- avoid for dialogue | - |

**MCU or CU is required for reliable lip sync.**

### 5.3 Lip Sync Trigger Keywords

| Keyword/Phrase | Effect |
|----------------|--------|
| `"clearly enunciates"` | Forces visible, distinct mouth movements |
| `"visible mouth openings"` | Emphasizes lip articulation |
| `"speaks slowly over ~5-6 seconds"` | Controls pacing |
| `"no background music"` | Prevents audio from masking consonants |
| `"his/her jaw moves realistically with the dialogue"` | Reinforces sync |
| `"(no subtitles!)"` | Prevents caption generation |

### 5.4 Word Count Rule (<=15 words)

| Duration | Max Words | Optimal Speech |
|----------|-----------|----------------|
| 3-6 seconds | 8-15 words | OPTIMAL -- natural pacing, tight sync |
| ~8 seconds | 15-20 words | Maximum recommended per clip |
| Under 2 seconds | - | AI gibberish or awkward silences |
| Over 8 seconds | - | Unnaturally fast, robotic speech |

### 5.5 Pronunciation Tips

For challenging words, spell phonetically:
- "foh-fur" instead of "fofr"
- "eye-oh-tee" instead of "IoT"

### 5.6 Lip Sync Troubleshooting

| Problem | Cause | Fix |
|---------|-------|-----|
| Frozen/barely moving mouths | Camera too far from subject | Switch to MCU/CU, add "clearly enunciates", "visible mouth openings" |
| Off-beat synchronization | Dialogue too long or audio interference | Shorten to 3-6s, add "no background music", add pacing instruction |
| No audio generated | Wrong mode or quality setting | Select "Highest Quality (Experimental Audio)", generate at 720p |
| Unwanted subtitles | Wrong syntax | Use colon syntax `says:`, add "(no subtitles!)" at end |
| Identity drift | Model confuses identity with transient attributes | Use exact same character description verbatim, use 1-3 reference images |

---

## Section 6: Prompt Formula

### 6.1 Five-Part Foundation

```
[Cinematography] + [Subject] + [Action] + [Context] + [Style & Ambiance]
```

### 6.2 Eight-Part Professional Framework

```
[Subject] + [Context] + [Action] + [Style] + [Camera] + [Composition] + [Ambiance] + [Audio]
```

### 6.3 Complete I2V Prompt Template

```
"~8 seconds, 1080p, 16:9.

Camera: [movement type], [speed].

Subject motion: [micro-movements -- blinks, breathing, subtle gestures].

Expression shift: [if any emotional change].

Ambient motion: [particles, environmental elements].

Audio: [specific ambient], [music or no music], no subtitles, no audience sounds.

Maintain exact lighting, environment, and appearance from reference image."
```

### 6.4 Dialogue Shot Template

```
[VEO 3.1 -- DIALOGUE SHOT]

Duration: ~[4-6] seconds
Resolution: 1080p
Aspect: 9:16 vertical

FRAMING
Shot: [MCU or CU -- face must be 20%+ of frame]
Camera: [static or gentle push-in]
Composition: [subject centered or rule of thirds]

SUBJECT
[Full character description]
Expression: [emotion] -- [specific facial details]
Looking directly at camera.

DIALOGUE
[Character] says: "[3-6 seconds of speech, 8-15 words max]"

LIP SYNC ENHANCEMENT
Clearly enunciates.
Visible mouth openings.
Jaw moves realistically with dialogue.
[Optional: "speaks slowly over ~X seconds"]

AUDIO
Ambient: [environment sound]
No background music.
No subtitles, no text overlays.

CONTINUITY
Maintain exact appearance from reference image.
```

### 6.5 Complete Prompt Example

```
"Medium shot, a confident tech entrepreneur
in a modern glass office overlooking city skyline
gesturing while explaining a concept, slight forward lean
cinematic photorealistic style, Kodak Vision3 500T color
smooth dolly push-in toward subject
rule of thirds, lead room right
warm afternoon sunlight, atmospheric haze, subtle dust particles
Audio: quiet office ambiance, soft ventilation hum, no music, no audience sounds"
```

---

## Section 7: Content Templates

### 7.1 Talking Head / Hook Shot

```
[VEO 3.1 -- HOOK SHOT]

Duration: ~3-4 seconds
Resolution: 1080p
Aspect: 9:16 (vertical social)

Camera: Medium-speed dolly push-in toward subject face,
        ending at close-up.

Subject: Direct eye contact with camera throughout.
         Expression shifts from neutral to "wait until you hear this" --
         subtle eyebrow raise, hint of knowing intrigue.
         Minimal body movement, all attention on face.

Ambient: Single floating dust particle crossing light beam.
         Subtle background screen glow flicker.

Audio: Brief attention-catching sound (subtle whoosh or tone),
       then quiet focused atmosphere.
       No music, no subtitles, no audience sounds.

Transition: End on close-up hold, ready for cut.
Negative: No blurry face, no distortion, no cartoon effects.
```

### 7.2 B-Roll: Product/Tech Detail

```
[VEO 3.1 -- B-ROLL PRODUCT]

Duration: ~4-6 seconds
Resolution: 1080p
Aspect: 16:9

Camera: Slow orbit around product, or gentle dolly past.
        Smooth, premium movement speed.

Subject: Product hero, no human presence.
         Subtle light interaction on surfaces.
         Specular highlights gently shifting.

Ambient: Floating dust particles catching light.
         Subtle reflection movements.
         Premium atmosphere.

Audio: Soft ambient tone,
       subtle product-appropriate sound (soft click, gentle hum).
       No music unless specified, no voice.

Transition: Smooth movement continuing off-frame.
Negative: No jarring movements, no cheap feel.
```

### 7.3 Action / Explanation Shot

```
[VEO 3.1 -- EXPLANATION SHOT]

Duration: ~8 seconds
Resolution: 720p (for extension compatibility)
Aspect: 9:16 or 16:9

Camera: Static or very gentle drift, prioritizing clarity.
        Subtle reframe if gesture moves subject.

Subject: Natural teaching gestures, hands visible when explaining.
         Regular eye contact with camera.
         Subtle postural shifts maintaining energy.
         Natural breathing visible in shoulders.

Expression: Engaged explainer mode -- bright eyes,
            occasional emphasis expressions matching content.

Ambient: Minimal distraction.
         Subtle screen content shift if visible.
         Clean professional environment.

Audio: Clear speaking space atmosphere.
       "[Subject] says: '[12-15 word explanation segment]'"
       Soft room tone, no music, no subtitles.

Transition: Hold final frame for extension compatibility.
Negative: No rushed speech, no competing sounds.
```

### 7.4 Atmospheric / Environment B-Roll

```
[VEO 3.1 -- B-ROLL ENVIRONMENT]

Duration: ~6-8 seconds
Resolution: 720p or 1080p
Aspect: 16:9 (cinematic)

Camera: Slow pan across environment, or gentle crane rise/descend.
        Contemplative pacing.

Subject: Environment itself, no human focus.
         Architectural or natural elements.
         Depth layers (foreground, mid, background).

Ambient: Atmospheric haze or particles.
         Natural environmental motion (leaves, water, flags).
         Light shifts (clouds passing, time suggestion).

Audio: Rich environmental ambiance appropriate to location.
       City: distant traffic, urban hum.
       Office: HVAC, quiet activity.
       Nature: wind, birds, water.
       No music unless mood requires, no voice.

Transition: Movement continuing for flexible edit points.
```

### 7.5 CTA Shot (Call to Action)

```
[VEO 3.1 -- CTA SHOT]

Duration: ~4-6 seconds
Resolution: 1080p
Aspect: 9:16 (vertical social)

Camera: Static or very gentle push-in ending at close-up.
        Intimate, personal framing.

Subject: Direct warm eye contact throughout.
         Expression: genuine, inviting, trustworthy.
         Subtle forward lean suggesting "join me."
         Natural smile developing.

Ambient: Clean, undistracting.
         Warm atmosphere matching invitation tone.

Audio: Warm personal delivery space.
       "[Subject] says: '[8-12 word invitation/CTA]'"
       Soft pleasant room tone.
       Optional: gentle positive music fade in.
       No subtitles.

Transition: Gentle hold or slow fade-ready.
Negative: No salesy energy, no pressure feel.
```

---

## Section 8: Quality Checklist

### Pre-Generation Checklist

- [ ] Script dialogue fits 3-6 second rule per clip
- [ ] Face will occupy 20%+ of frame in dialogue shots
- [ ] Using colon syntax for all dialogue (`says:` not `says ""`)
- [ ] Lip sync keywords included ("clearly enunciates", etc.)
- [ ] "No background music" specified for dialogue clips
- [ ] "No subtitles" specified (multiple times if needed)
- [ ] Character description is verbatim across all prompts

### VEO Prompt Checklist

- [ ] Duration <= 8 seconds
- [ ] Resolution: 1080p (or 720p for extensions)
- [ ] Aspect: 16:9 or 9:16
- [ ] Camera movement uses VEO-verified term from Section 3
- [ ] Dialogue <= 15 words
- [ ] Audio block complete with exclusions
- [ ] Transition instruction included
- [ ] No visual details repeated from image prompt (I2V)
- [ ] "Maintain exact appearance from reference image" included

### Lip Sync Quality Checklist

- [ ] Shot type: MCU or CU (face 20%+ of frame)
- [ ] Colon syntax: `says:` not `says ""`
- [ ] Dialogue duration: 3-6 seconds optimal
- [ ] Keywords: "clearly enunciates", "visible mouth openings"
- [ ] Audio: "no background music"
- [ ] Subtitles: "(no subtitles!)" at end

---

## Section 9: Common Failures and Fixes

| Problem | Root Cause | Fix |
|---------|-----------|-----|
| Random audience laughter | Audio not specified | Always specify audio block with explicit exclusions |
| Subtitles appearing | Quote syntax instead of colon | Use `says:` colon syntax, add "(no subtitles!)" multiple times |
| Frozen/barely moving mouths | Face too small in frame | Switch to MCU/CU, add "clearly enunciates" |
| Off-beat lip sync | Dialogue too long | Shorten to 3-6 seconds of speech, add pacing instruction |
| No audio generated | Wrong quality setting or 1080p upscale bug | Select "Highest Quality (Experimental Audio)", generate at 720p |
| Identity drift between clips | Character description varies | Use exact same verbatim description + 1-3 reference images |
| Extension fails | Starting clip is 1080p | Generate base clip at 720p for extension compatibility |
| Visual details wrong in I2V | Prompt describes visuals already in image | Describe MOTION ONLY; model already sees the image |
| Content with children auto-muted | Google policy | No fix -- auto-muted per Google policy |
| Extension defaults to VEO 2 | Extension bug | Re-generate as new clip instead of extending |

### Positive Framing (Preferred Over Negatives)

Instead of: "no buildings" --> Write: "natural landscape without man-made structures"
Instead of: "no blur" --> Write: "crystal-clear sharp focus throughout"

### Negative Prompt Block (When Needed)

```
Negative: no subtitles, no text overlays, no watermarks,
          no blurry faces, no distorted hands, no cartoon effects,
          no unrealistic proportions, no compression artifacts,
          no audience sounds, no laugh track.
```

---

*VEO 3.1 I2V Reference Guide -- SECONDARY platform for lip-sync/dialogue-heavy content*

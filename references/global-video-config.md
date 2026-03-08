# Global Video Config — Single Source of Truth

> **All other files reference this config.** To change any setting, edit THIS file only.
> Reference files, SKILL.md, agent.md, and CLAUDE.md all point here for configurable values.

---

## How to Change a Setting

1. Find the setting below
2. Change the value
3. Done — all other files reference `global-video-config.md` for these values

---

## 1. Platform Priority

| Priority | Platform | When to Use |
|----------|----------|-------------|
| `PRIMARY` | **Grok Imagine** (Grok 3) | Default for ALL image-to-video. Now has lip-sync + native audio. Fastest + cheapest. |
| `SECONDARY` | VEO 3.1 | Best lip-sync quality, production-grade dialogue, 1080p |
| `SECONDARY` | Seedance 2.0 | Multi-shot storytelling, audio sync, quad-modal input |
| `TERTIARY` | Sora 2 | Complex physics, elaborate motion, best temporal consistency |
| `TERTIARY` | Kling 3.0 | Multi-shot sequences, voice reference, cinematic visuals |

```
DEFAULT PLATFORM: Grok Imagine (Grok 3)
OVERRIDE ONLY WHEN: need production-grade lip-sync (VEO 3.1), complex physics (Sora 2),
                     multi-shot native (Kling 3.0/Seedance 2.0), or 1080p+ resolution
```

> **Version note:** Grok specs reflect Grok Imagine v1.0 (Feb 2026). Kling specs reflect v3.0 (Feb 2026).
> **Last verified:** March 2026

---

## 2. Platform Technical Specs

| Setting | Grok Imagine | VEO 3.1 | Sora 2 | Kling 3.0 | Seedance 2.0 |
|---------|-------------|---------|--------|-----------|-------------|
| `duration` | 1s-15s (granular); UI: 6s/10s/15s | 4s / 6s / 8s | 4s / 8s / 12s (API); 20s (Pro) | 5s / 10s / 15s | 3s - 12s |
| `resolution` | 720p HD (default 480p — must request 720p) | 1080p | 720p (standard) / 1080p (Pro) | 1080p | Up to 2K |
| `audio` | Native (SFX + dialogue + music) | Native (dialogue+SFX) | Native (comprehensive) | Native (voice reference) | Native sync |
| `lip_sync` | Yes (single character, v1.0+) | Yes (best quality) | Limited | Yes | Yes |
| `dialogue_syntax` | `Speech: [text]` | `Character says: "text"` | Quotes below prose | Via audio section | Voice ref URL + text |
| `negative_prompt` | No | Yes | Yes | Yes | Yes |
| `image_input` | Yes (reference) | Yes (up to 3) | Yes (first frame) | Yes (image_url) | Yes (up to 9) |
| `orientations` | 16:9, 9:16, 1:1, 4:3, 3:4, 2:3, 3:2 | 16:9, 9:16 | 16:9, 9:16, 1:1 | 9:16, 16:9 | 16:9, 9:16, 1:1 |
| `video_extension` | Yes (chain up to 30s) | No | No | Multi-shot native | Multi-shot native |

---

## 2a. Grok Complexity Limits (HARD RULES)

> **Grok Imagine is fast and cheap but has strict complexity limits. Exceeding them produces illogical, chaotic animation.**

```
GROK SIMPLICITY RULE:
  Subject motions:  Max 2 (1 primary + 1 secondary)
  Camera:           1 movement OR static (Grok-verified terms only)
  Ambient motion:   Max 1 element (particles, light shift, foliage — pick ONE)
  SFX layers:       2-3 (1 foreground + 1 ambient + optional accent)
  TOTAL elements:   ~5 MAX

  Lip-sync camera:  STATIC or very slow push-in ONLY
  Lip-sync face:    >=20% of frame, MCU/CU required
  Lip-sync words:   8-10 (6s) / 12-15 (10s) / 20-25 (15s)
  Emotion:          ONE tone per clip (no progressions)

  Physics:          SIMPLE ONLY (drift, sway, settle — no collisions, liquid, cloth sim)
  Hands:            Simple gestures only (open hand, point) — no finger detail
  Concurrent UI:    Max 2-3 animations, sequenced temporally not simultaneous
```

**LESS IS MORE:** Grok fills creative gaps on its own. Over-specifying forces the model into impossible territory and produces illogical results.

---

## 2b. Prompt Philosophy — Intention-Driven Prompting (CRITICAL)

> **The fundamental shift: from "directing every detail" to "setting clear intentions."**
> AI video models are NOT a film crew. They are a single entity executing everything at once.
> Over-specifying competing instructions produces chaotic, unnatural, robotic results.
> Under-specifying strategically lets the model use its training data (millions of real human videos) to fill in natural details.

### The One Intention Rule

Every prompt must be answerable in ONE sentence:
```
"In this clip, [subject] [does ONE thing]."
```

Everything else (camera, ambient, SFX) SUPPORTS that single intention — never competes.

| Approach | Example | Result |
|----------|---------|--------|
| BAD: Multiple intentions | "She turns, notices camera, raises eyebrow, smirks, tosses hair, walks toward lens" | Chaotic, rushed, unnatural |
| GOOD: One intention | "She glances toward camera with quiet confidence" | Natural, focused, compelling |
| BAD: Body-part choreography | "Eyebrows snap up, smile breaks, hand rises, weight shifts to left foot" | Robotic execution of discrete actions |
| GOOD: Intention-driven | "Reacts with quiet surprise" | Model fills in natural micro-expressions from training data |

### The State Change Rule

Every clip must have a TRANSFORMATION — what changes between frame 1 and last frame?

```
STATE CHANGE = THE STORY
Start state → End state = narrative arc, even in 6 seconds.
```

| Start State | End State | Story | Duration |
|-------------|-----------|-------|----------|
| Focused concentration | Satisfied smile | Discovery | 6s |
| Still, quiet room | Alive with activity | Awakening | 10s |
| Confident posture | Forward lean, open gesture | Invitation | 6s |
| Walking, scanning | Pauses, shoulders drop | Disappointment | 10s |
| Tense, rigid | Relaxes, exhales | Relief | 6s |

**If you can't name the state change, the prompt has no story.**

### Cinematographer's Note Voice

Write prompts like a STORYBOARD NOTE — terse, visual, one moment per frame.
NOT like a novel, NOT like a screenplay, NOT like a Hollywood director briefing.

```
BAD (Hollywood director — over-directed):
"Supervisor strides aggressively down the walkway, clipboard slapping against
his thigh, head snaps left scanning each empty station, jaw clenches tight,
fists ball at his sides; he spins back toward the line, chest heaving with
frustration. Camera tilts down from wall clock to floor level."

GOOD (Cinematographer's note — intention-driven):
"Supervisor walks the empty aisle, scanning vacant stations. Quiet frustration.
Camera tracks alongside, steady. Factory hum, boots on epoxy, distant conveyor."
```

### Direct Intentions, Not Body Parts

Tell the model WHAT happens, not HOW each body part moves. The model was trained on millions of real human videos — it knows how humans move.

| Approach | Prompt | Why |
|----------|--------|-----|
| BAD: Body-part directing | "Alis naik, mata melebar, mulut terbuka, tangan ke dada" | Mechanical, robotic execution |
| GOOD: Intention directing | "Reacts with quiet wonder" | Model fills in natural micro-expressions |
| BAD: Choreography | "Steps forward with left foot, shifts weight, extends right arm" | Stiff, unnatural sequence |
| GOOD: Intention | "Steps closer, reaching out" | Natural weight transfer and motion |

### Emotion Default = Subtle

Default to SUBTLE emotion. Escalate ONLY for deliberate dramatic moments.

| Level | Example | When to Use |
|-------|---------|-------------|
| **SUBTLE** (DEFAULT) | "a quiet smile", "slight nod" | 80% of clips — most natural |
| **MODERATE** | "breaks into warm grin", "leans forward with interest" | Payoff moments, reveals |
| **STRONG** | "erupts with laughter", "slams table" | Climax ONLY — use sparingly |

**Current default error:** Plugin defaults to STRONG/MODERATE. Fix: default to SUBTLE, let the model's training produce natural human behavior.

### Duration = Storyline Complexity (NOT Options)

Duration is determined by the STORYLINE of each clip, not offered as multiple options.

```
RULE: Analyze the narration text and story beat, then pick ONE duration.
  - Short narration (≤10 words) + simple moment → 6s
  - Medium narration (11-15 words) + moderate complexity → 10s
  - Long narration (16-25 words) + dramatic/cinematic beat → 15s
  - NEVER generate multiple duration variants for the same clip
```

### B-Roll = Describe the Moment, Not Choreograph It

For B-roll scenes, describe the SCENE STATE and let the model bring it to life.

```
BAD (choreographed):
"Steam rises from coffee mug, camera pushes in, papers flutter,
light shifts from window, dust particles drift through beam"

GOOD (scene state — documentary observer):
"Steam curls from coffee mug on cluttered desk. Early morning light.
Quiet office hum, distant keyboard."
```

### Trust the Model

AI video models are trained on millions of real-world videos. They know:
- How humans walk, breathe, blink, react
- How light behaves on surfaces
- How fabric moves in wind
- How environments sound

**When you over-specify, you OVERRIDE this knowledge with worse instructions.**
Leave supporting details (ambient motion, secondary expressions, physics) unspecified when possible. The model's default behavior is often more natural than explicit direction.

---

## 3. Content Type Animation Rules (CRITICAL)

| Content Type | Animation Style | Voice / Lip-sync | Design Preservation | Headlines |
|-------------|----------------|------------------|--------------------|-----------|
| **Carousel Animation** | SIMPLE but MINDBLOWING — minimal movement, maximum creative impact | NO voice, NO narration — SFX only | YES — do NOT change image design | MUST persist start-to-finish |
| **Short Video** | HOLLYWOOD QUALITY — dramatic, cinematic, bold | YES — creator voice anchor + lip-sync | NO — creative freedom | Optional |
| **Product Promo** | HOLLYWOOD QUALITY — dramatic, cinematic, bold | YES — creator voice anchor + lip-sync | NO — creative freedom | Optional |
| **Pure B-Roll** | HOLLYWOOD QUALITY — cinematic motion | NO voice — SFX only | NO — creative freedom | N/A |

```
CAROUSEL  = Simple but mindblowing animation + SFX only + preserve design + headlines always visible
NON-CAROUSEL = Hollywood quality animation + voiceover lip-sync + creative freedom + stop the scroll
```

---

## 4. Default Duration Rules

| Content Type | Default Duration | Platform | Notes |
|-------------|-----------------|----------|-------|
| Standard scene | 6s | Grok Imagine | Default choice |
| Hook / high-energy | 10s | Grok Imagine | Front-load action |
| Climax / dramatic payoff | 10s | Grok Imagine | Maximum impact at 10s |
| CTA / engagement | 10s | Grok Imagine | Bookend with hook |
| Dialogue / talking head (budget) | 6s - 10s | Grok Imagine | `Speech:` syntax, single character lip-sync |
| Dialogue / talking head (quality) | 8s | VEO 3.1 | Best lip-sync, production-grade |
| Complex physics | 8s - 12s | Sora 2 | Best physics accuracy |
| Multi-shot narrative | 10s - 15s | Seedance 2.0 / Kling 3.0 | Native multi-shot support |

---

## 5. Creator Identity (USER-PROVIDED)

| Setting | Value |
|---------|-------|
| `creator_face` | `ref/creator-face.png` — clear face photo |
| `creator_brand` | `ref/creator-brand.png` — brand icon/logo |

**Session start:** Confirm `ref/` folder exists with both files before generating creator-facing prompts.

---

## 6. Output Conventions

| Setting | Value |
|---------|-------|
| `output_file_pattern` | `video-prompt-{platform}.md` |
| `grok3_output` | `video-prompt-grok3.md` |
| `veo31_output` | `video-prompt-veo31.md` |
| `sora2_output` | `video-prompt-sora2.md` |
| `kling30_output` | `video-prompt-kling30.md` |
| `seedance20_output` | `video-prompt-seedance20.md` |
| `multi_platform_output` | Separate file per platform |

---

## 7. Quality Gate

| Setting | Value |
|---------|-------|
| `quality_gate_points` | 13 |
| `minimum_pass` | 9/13 (all platforms), 11/13 (Grok with voice) |
| `auto_revise_below` | 9/13 (all platforms), 11/13 (Grok with voice) |

---

## 8. Golden Rule

```
IMAGE prompt = ALL VISUALS (subject, lighting, lens, color, atmosphere)
VIDEO prompt = MOTION ONLY (camera movement, micro-motion, audio/SFX)
NEVER duplicate visual details already in the image inside the video prompt.
Use: "Maintain exact appearance from reference image."
```

---

## 9. Orientation Mapping (Source → Video Platform)

| Source Format | Source Ratio | Grok Imagine | VEO 3.1 | Sora 2 |
|--------------|-------------|-------------|---------|--------|
| IG Feed | 4:5 | 4:3 (native match) | 9:16 | 9:16 |
| TikTok/Reels | 9:16 | Portrait (9:16) | 9:16 | 9:16 |
| LinkedIn | 4:5 or 1:1 | 4:3 or Square (1:1) | 9:16 | 1:1 |
| YouTube | 16:9 | Landscape (16:9) | 16:9 | 16:9 |
| Presentation | 4:3 | 4:3 (native) | 16:9 | 16:9 |
| Custom | Any | Match closest (7 ratios available) | Match closest | Match closest |

> **Grok I2V note:** Image-to-video defaults to input image's aspect ratio unless explicitly overridden.

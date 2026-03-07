# Voice & Audio Modes — Content Type Rules

> Different content types require different audio approaches. This file defines the rules for voice, narration, and SFX across content types.

---

## 1. Audio Mode Matrix

| Content Type | Voice Mode | Face Segments | B-Roll Segments | SFX |
|-------------|-----------|---------------|-----------------|-----|
| **Carousel Animation** (LinkedIn, IG) | NO VOICE | N/A — animation + SFX only | Animation + SFX only | YES |
| **Short Video** (TikTok, Reels, Shorts) | CREATOR VOICE | Lip-sync (on-screen speech) | Narration (off-screen, same voice) | YES |
| **Product Promo** | CREATOR VOICE | Lip-sync (on-screen speech) | Narration (off-screen, same voice) | YES |
| **Pure B-Roll** | NO VOICE or MUSIC | N/A | Ambient SFX only | YES |

---

## 2. Carousel Animation Mode (LinkedIn, IG Feed)

**Rule: Animation + SFX ONLY. No voiceover. No narration. No dialogue.**

The carousel image IS the video frame — Grok 3 animates it with motion + auto-generated SFX.

### 2.1 Core Rules

- Prompt describes ONLY what **MOVES** and what **SOUNDS**
- No dialogue, no narration, no voiceover
- SFX and ambient audio only
- Duration: **6s** (default) or **10s** (dramatic/CTA) — only these two options

### 2.2 Animation Philosophy: SIMPLE but MINDBLOWING

**Keep the animation minimal in complexity but maximum in creative impact.** The image is a finished carousel slide — animate what's already there with clever, unexpected motion that makes viewers stop scrolling.

| Rule | Description |
|------|-------------|
| **Animate existing elements** | Only animate objects/elements already visible in the image |
| **No new objects** | Never add characters, objects, or effects not in the original image |
| **No layout changes** | Keep composition, framing, and layout exactly as designed |
| **Simple but creative motion** | Pick ONE clever animation idea — a single unexpected movement that creates a "wow" moment (e.g., parallax depth pop, cinematic light sweep, element isolation float, dramatic reveal timing) |
| **Preserve color grading** | Don't alter the color palette or visual style |
| **Less is more** | One well-chosen creative motion beats five generic ones |

### 2.3 Headline Persistence (MANDATORY)

**All headlines and text MUST remain visible and readable from FIRST frame to LAST frame of the video.**

- Explicitly state: "All headlines, text, branding, and watermarks remain sharp, visible, and readable from start to finish"
- Use STATIC or SLOW DRIFT camera — never fast movement that blurs text
- Never crop, obscure, or animate away any text element
- Text zones must stay stable — animate the scene AROUND the text, not the text itself

### 2.4 Prompt Formula
```
[ONE clever creative motion] + [slow/static camera] + [headline persistence instruction] + [SFX/ambient audio]
```

### 2.5 Examples
```
# Simple but mindblowing — parallax depth pop
Background world map slowly recedes while foreground data cards lift forward creating dramatic 3D depth separation. Camera holds static. All headlines, text, branding, and watermarks remain sharp, visible, and readable from start to finish. Deep bass hum, crisp digital chirps on each data point activation.
```
```
# Simple but mindblowing — cinematic light sweep
A golden light beam sweeps diagonally across the entire frame, each element it touches briefly glows and sharpens. Camera static. All headlines, text, branding, and watermarks remain sharp, visible, and readable from start to finish. Warm cinematic whoosh, subtle sparkle chimes on contact.
```

---

## 3. Short Video / Product Promo Mode (TikTok, Reels, Shorts)

**Rule: Creator voice ANCHOR throughout entire video. Lip-sync on face shots, narration on B-roll.**

### Animation: HOLLYWOOD QUALITY — WOW & AMAZING!

Unlike carousel mode (which preserves the design), short video and product promo content MUST aim for **Hollywood-grade cinematic quality**:

- **Bold camera movements** — dynamic push-ins, orbits, crane shots, whip pans
- **Dramatic transitions** — morphs, reveals, parallax depth effects
- **Cinematic motion** — full subject animation, environmental effects, particle systems
- **Creative freedom** — transform, distort, add visual effects for maximum impact
- **Goal: stop the scroll** — make viewers pause with stunning visual motion

### Voice & Lip-sync: MANDATORY for non-carousel

Every short video and product promo MUST include voiceover with lip-sync:

| Scenario | Platform | Syntax |
|----------|----------|--------|
| Face on screen (best quality) | VEO 3.1 | `[Creator] says: "dialogue"` |
| Face on screen (budget) | Grok 3 | `Speech: [dialogue]` |
| B-roll (off-screen narration) | Grok 3 / VEO 3.1 | `Creator narrates off-screen: "text"` |
| Multi-character | Seedance 2.0 / Kling 3.0 | Via audio section / voice ref |

> **No silent videos** — every non-carousel video has creator voice from start to finish.

### 3.1 Creator Voice Anchor (CRITICAL)

The creator's voice must be **consistent and present throughout the ENTIRE video** — not just face segments. This creates the "anchor" that ties the video together.

| Segment Type | Audio Approach |
|-------------|---------------|
| **Face on screen** | Creator speaks ON-CAMERA with lip-sync |
| **B-Roll** | Creator narrates OFF-CAMERA (voiceover) — same voice, same tone |
| **Transition** | Voice continues seamlessly across cuts |

**Key rules:**
1. **Same voice throughout** — the creator's voice never changes or disappears
2. **Lip-sync ONLY when face is visible** — use VEO 3.1 (best quality) or Grok 3 (budget, `Speech:` syntax)
3. **Narration continues on B-roll** — voice continues as voiceover even when face not on screen
4. **No awkward silence** — every segment has either speech or ambient (never dead silence)
5. **Voice tone consistency** — same energy, pace, and personality across all segments
6. **Voice gender anchoring** — explicitly state creator voice gender in EVERY off-screen narration prompt (see 3.1a)

### 3.1a Voice Gender Anchoring (CRITICAL — Prevents Voice Hijack)

> **Problem:** Grok uses visible faces in the image to determine voice characteristics for `Speech:`. When a non-creator face (e.g., female worker, different person) is visible in a B-roll image, Grok generates voice matching THAT face — not the creator's voice. This breaks voice consistency across the video.

**Rule: EVERY off-screen narration prompt MUST explicitly anchor the creator's voice gender and characteristics.**

| Scenario | Risk | Fix |
|----------|------|-----|
| B-roll with NO faces visible | Low — Grok picks neutral voice | Still add voice anchor for consistency |
| B-roll with CREATOR face visible | Low — Grok matches creator | Add voice anchor as safety |
| B-roll with NON-CREATOR face visible | **HIGH — Grok matches wrong face** | **MANDATORY voice anchor** |
| B-roll with MULTIPLE faces visible | **HIGH — Grok picks random face** | **MANDATORY voice anchor** |

**Grok 3 syntax — off-screen narration with voice anchor:**
```
A [gender] narrator voice. Speech: [narration text]
```

**Examples:**
```
# BAD — no voice anchor, female supervisor visible in image
Speech: Night shift. Three AM. Your supervisor finds an operator asleep.
→ Grok sees female face → generates female voice → breaks male creator anchor

# GOOD — explicit voice anchor
A male narrator voice. Speech: Night shift. Three AM. Your supervisor finds an operator asleep.
→ Grok forced to use male voice regardless of visible faces

# GOOD — with voice quality
A deep confident male voice narrates. Speech: Every worker tracked. Every second counted.
→ Explicit gender + tone anchoring
```

**VEO 3.1 syntax — off-screen narration with voice anchor:**
```
Male narrator says: "[narration text]"
```

**Implementation checklist:**
1. Define creator voice gender ONCE in Creator Voice Profile at top of output file
2. In EVERY off-screen narration prompt, prefix Speech: with `A [gender] narrator voice.`
3. For lip-sync clips (creator face on-screen), voice anchor is optional (face anchors it)
4. When non-creator faces are visible in image, voice anchor is **MANDATORY**

### 3.2 Segment Audio Rules

#### Face Segments (Creator On-Screen)
```
Platform: VEO 3.1 (production-grade lip-sync) or Grok 3 (budget lip-sync)

VEO 3.1 syntax:
  [Creator] says: "[dialogue — max 12-15 words per 8s]"
  Quiet ambient: [room tone or environment]. No background music.
  No subtitles, no audience sounds.

Grok 3 syntax:
  Speech: [dialogue — max 12-15 words per 10s]
  [Ambient SFX description]

Face: >=20% of frame, MCU or CU shot
Lip-sync: colon syntax for VEO, Speech: prefix for Grok
```

See `voice-emotion-direction.md` for emotion modifiers, pacing, and anti-robotic techniques.

#### B-Roll Segments (Creator Off-Screen Narration)
```
Platform: Grok 3 (PRIMARY) or VEO 3.1
Audio: Creator narrates off-screen: "[narration text]"
       Ambient: [environment-appropriate SFX]
       No subtitles, no text overlays.
Voice: Same creator voice as face segments — continuous narration
```

### 3.3 Voice Profile Anchor

Define once, maintain across all segments:

```
## Creator Voice Profile
- Gender: [male/female]
- Age range: [e.g., 25-35]
- Accent: [e.g., Indonesian native, Jakarta accent]
- Tone: [e.g., warm, confident, casual Gen-Z energy]
- Pace: [e.g., medium-fast, conversational]
- Energy: [e.g., enthusiastic but not hyperactive]
```

This profile anchors the AI-generated voice (VEO) or TTS voice (Chatterbox) to maintain consistency.

### 3.4 Product Demo — Lip-Sync MANDATORY (Grok 3)

Product demo videos follow the same HOLLYWOOD QUALITY rules as short videos:

- Creator-facing clips: MUST use `Speech: [text]` syntax for lip-sync
- B-roll / dashboard clips: SFX only (no Speech:)
- 15s clip budget: max 20-25 words of dialogue
- Face must be >=20% of frame for reliable lip-sync
- If production-grade lip-sync needed: route to VEO 3.1
- Animation: dramatic, cinematic, bold — stop the scroll

### 3.4a Grok Lip-Sync Limitations (CRITICAL)

> **Grok lip-sync is social media grade. Manage expectations.**

| Requirement | Details |
|------------|---------|
| Face size | **>=20% of frame** — MCU or CU shot required |
| Camera during speech | **Static or very slow push-in ONLY** — any other movement kills sync |
| Dialogue length | **8-10 words (6s), 12-15 words (10s)** — shorter = cleaner |
| Min words | **3+ words** — fewer triggers silence or gibberish |
| Emotion | **ONE tone per clip** — no complex progressions |
| Speakers | **Single character only** — multi-character unreliable |
| Voice quality | Social media grade — NOT broadcast/production |

**When lip-sync fails on Grok, check these first:**
1. Is the face large enough? (>=20% of frame)
2. Is the camera static during Speech:?
3. Is the dialogue too long? (>15 words)
4. Are there multiple faces in the scene?
5. Is the prompt too complex? (Grok simplicity limit: max 2 motions + 1 camera)

**If 2+ of these fail → route to VEO 3.1 instead.**

### 3.5 Platform Routing for Voice Content

```
Face segment (best lip-sync)      → VEO 3.1 (production-grade, says: syntax)
Face segment (budget lip-sync)    → Grok 3 (social media grade, Speech: syntax)
Multi-character dialogue           → Seedance 2.0 or Kling 3.0
B-roll with narration              → Grok 3 (add narration as audio direction) or VEO 3.1
B-roll without narration           → Grok 3 (SFX only)
Product demo (creator face)        → Grok 3 (Speech: syntax) or VEO 3.1 (says: syntax)
Product demo (B-roll/dashboard)    → Grok 3 (SFX only)
```

### 3.6 Script-to-Segment Mapping

When converting a script to video prompts:

| Script Element | Video Segment | Audio |
|---------------|--------------|-------|
| Hook line (spoken to camera) | Face shot, MCU | Lip-sync via VEO 3.1 |
| Explanation (while showing product) | B-roll of product | Off-screen narration |
| Data/stats (while showing graphic) | B-roll of infographic | Off-screen narration |
| CTA (spoken to camera) | Face shot, CU | Lip-sync via VEO 3.1 |
| Transition (between topics) | B-roll establishing | Narration continues |

---

## 4. Audio Direction Templates

### Carousel Animation (No Voice)
```
[Specific SFX matching the scene]. No voiceover, no narration, no dialogue. Pure ambient and sound effects.
```

### Face Segment (Lip-Sync)
```
[Creator name] says: "[dialogue text]"
Quiet ambient: [environment sounds]. No background music. No subtitles, no audience sounds, no text overlays.
```

### B-Roll with Narration
```
Creator narrates off-screen: "[narration text]"
Ambient: [environment-specific SFX]. No subtitles.
```

### B-Roll Pure SFX
```
[Detailed SFX matching scene]. No voiceover, no narration. Pure environmental audio.
```

---

## 5. Content Type Detection

Auto-detect content type from user context:

| Signal | Content Type | Audio Mode |
|--------|-------------|-----------|
| "carousel", "LinkedIn carousel", "IG carousel" | Carousel Animation | SFX only, no voice |
| "short video", "TikTok", "Reels", "Shorts" | Short Video | Creator voice anchor |
| "product promo", "product demo", "ad" | Product Promo / Demo | Creator voice anchor |
| "b-roll", "stock footage", "ambient" | Pure B-Roll | SFX only |
| No specific signal | Default | Ask user |

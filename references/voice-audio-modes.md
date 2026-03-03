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

- Prompt describes ONLY what **MOVES** and what **SOUNDS**
- No dialogue, no narration, no voiceover
- SFX and ambient audio only
- Text preservation for baked-in headlines/branding
- Duration: 6s default, 10s for dramatic/CTA

**Prompt formula:**
```
[motion description] + [camera movement] + [text preservation] + [SFX/ambient audio]
```

**Example:**
```
The holographic data displays pulse with live updates, golden arcs animate across the world map connecting nodes. Camera gently drifts right. All text and branding remain sharp and readable throughout. Command center ambient hum, console alert tones, keyboard typing clicks, digital interface whooshes.
```

---

## 3. Short Video / Product Promo Mode (TikTok, Reels, Shorts)

**Rule: Creator voice ANCHOR throughout entire video. Lip-sync on face shots, narration on B-roll.**

### 3.1 Creator Voice Anchor (CRITICAL)

The creator's voice must be **consistent and present throughout the ENTIRE video** — not just face segments. This creates the "anchor" that ties the video together.

| Segment Type | Audio Approach |
|-------------|---------------|
| **Face on screen** | Creator speaks ON-CAMERA with lip-sync |
| **B-Roll** | Creator narrates OFF-CAMERA (voiceover) — same voice, same tone |
| **Transition** | Voice continues seamlessly across cuts |

**Key rules:**
1. **Same voice throughout** — the creator's voice never changes or disappears
2. **Lip-sync ONLY when face is visible** — use VEO 3.1 for face segments (best lip-sync)
3. **Narration continues on B-roll** — voice continues as voiceover even when face not on screen
4. **No awkward silence** — every segment has either speech or ambient (never dead silence)
5. **Voice tone consistency** — same energy, pace, and personality across all segments

### 3.2 Segment Audio Rules

#### Face Segments (Creator On-Screen)
```
Platform: VEO 3.1 (best lip-sync)
Audio: [Creator] says: "[dialogue — max 12-15 words per 8s]"
       Quiet ambient: [room tone or environment]. No background music.
       No subtitles, no audience sounds.
Face: >=20% of frame, MCU or CU shot
Lip-sync: colon syntax required for VEO
```

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

### 3.4 Platform Routing for Voice Content

```
Face segment (lip-sync needed) → VEO 3.1 (ONLY platform with reliable lip-sync)
B-roll with narration → Grok 3 (add narration as audio direction) or VEO 3.1
B-roll without narration → Grok 3 (SFX only)
Product demo → Grok 3 (SFX) or Seedance 2.0 (audio sync)
```

### 3.5 Script-to-Segment Mapping

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
| "product promo", "product demo", "ad" | Product Promo | Creator voice anchor |
| "b-roll", "stock footage", "ambient" | Pure B-Roll | SFX only |
| No specific signal | Default | Ask user |

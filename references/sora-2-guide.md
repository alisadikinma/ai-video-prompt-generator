# Sora 2 Image-to-Video Reference Guide
## TERTIARY Platform — Use for complex physics and >8s single clips.

---

## Section 1: Technical Specs

### Model Variants

| Parameter | sora-2 | sora-2-pro |
|-----------|--------|------------|
| Resolution | 1280x720 (landscape), 720x1280 (portrait) | 1280x720, 720x1280, 1024x1792, 1792x1024 |
| Duration | 4s, 8s, 12s | 4s, 8s, 12s (API); up to 20s (ChatGPT Pro) |
| Best For | Rapid iteration, concept validation | Cinematic footage, shallow DOF, marketing |
| Cost | ~$0.10/second | ~$0.30-$0.50/second |

### Resolution and Aspect Ratios

| Aspect Ratio | Dimensions | Use Case |
|--------------|------------|----------|
| 16:9 | 1280x720, 1792x1024 | YouTube, standard landscape |
| 9:16 | 720x1280, 1024x1792 | TikTok, Instagram Reels, Shorts |
| 1:1 | Square crop from above | Social media feeds |

Frame rate: 24fps for cinematic work, 30fps for smoother action.

### Access Tiers

| Tier | Monthly Cost | Resolution Cap | Duration Cap |
|------|-------------|----------------|--------------|
| ChatGPT Plus | $20 | 720p | 5s at 720p, 10s at 480p |
| ChatGPT Pro | $200 | 1080p | Up to 20s |
| API | Per-second billing | Full access | 12s max |

**Credit consumption:** 720p costs ~16 credits/second; 1080p costs ~40 credits/second. Credits do not roll over.

### Key Limitation

Resolution is 720p (not 1080p like VEO 3.1). Plan for upscaling in post if higher resolution is needed.

---

## Section 2: Image Reference = First Frame (CRITICAL)

When uploading a reference image, Sora 2 uses it as the **first-frame anchor**. The text prompt defines what happens NEXT.

- The image locks in: composition, character design, wardrobe, environment
- The prompt controls: motion, camera movement, audio, what changes

**Golden Rule:** Focus prompts on ACTION, not appearance -- appearance is already defined by the image.

### Input Image Requirements

**Critical constraint:** Reference images must **exactly match** target video resolution.

| Format | Supported |
|--------|-----------|
| JPEG/JPG | Yes |
| PNG | Yes |
| WebP | Yes |

**Optimal source images feature:**
- Single clear subject with defined focal point
- Clean compositional structure (rule of thirds positioning)
- Lighting that matches intended video tone
- Negative space allowing room for motion
- Neutral backgrounds for character consistency

**Avoid:** Cluttered compositions, low resolution, heavy stylization, complex multi-subject arrangements.

### Advanced Reference Techniques

- **Storyboard input:** Sora 2 parses multi-panel grids (4 panels max, struggles above 6)
- **Character consistency:** Upload full-body shots against neutral backgrounds, repeat exact descriptors verbatim
- **Scene annotations:** Add directional overlays to images ("Camera moves from HERE -> HERE") -- Sora 2 follows them

---

## Section 3: ONE Move + ONE Action Rule (CRITICAL)

**ONE camera movement + ONE subject action per shot.** Multiple competing movements cause chaotic, inconsistent output.

This is the single most important rule for Sora 2 prompt engineering.

### High-Reliability Camera Movements

| Movement | Prompt Phrase |
|----------|---------------|
| Tracking shot | "Slow tracking shot stays with the hiker" |
| Pan | "Gentle pan right to reveal the lake" |
| Tilt | "Slow tilt up to show Earth hanging in sky" |
| Dolly/Push | "Slow push-in toward the music box" |
| Crane | "Crane down through drifting pollen" |
| Handheld | "Subtle handheld micro-shake for realism" |
| Steadicam | "Steadicam following runner down hallway" |
| Arc | "Slow arc around the couple dancing" |

**Speed specification:** Use precise timing -- "Camera pans left 30 degrees over 2 seconds" or "Slow push-in 3 seconds."

### Shot Types (All Well-Supported)

Wide establishing, medium, close-up, extreme close-up, over-the-shoulder, POV, Dutch angle, bird's eye, low angle, high angle.

### Lens Focal Lengths

```
24mm  -- Wide, immersive (landscapes, interiors)
35mm  -- Documentary/street, close to human eye
50mm  -- Standard, portrait versatility
85mm  -- Portrait lens, flattering compression
100mm+ -- Telephoto, subject isolation
```

### Anamorphic and DOF

- "Anamorphic 2.0x lens, shallow DOF, volumetric light" produces horizontal flares, oval bokeh
- "Shallow depth of field (sharp subject, blurred background)"
- "Rack focus from foreground hands to skyline"

---

## Section 4: Beat-Based Timing

Beat-based timing is highly effective with Sora 2. Structure actions across the clip duration.

### Timing Format

```
Actions:
- [Beat 1 with timing: 0-2s]
- [Beat 2 with timing: 2-4s]
- [Beat 3 with timing: 4-6s]
```

### Example Timing Patterns

**4-second portrait animation:**
```
- Subject turns head 45 degrees toward camera (0-2s)
- Eyes settle on lens, slight smile forms (2-3s)
- Breathing visible, holds gaze (3-4s)
```

**8-second environment animation:**
```
- Leaves drift through foreground (0-3s)
- Light shifts subtly as clouds pass (3-6s)
- Bird crosses distant background (6-8s)
```

**4-second action sequence:**
```
- Subject pushes off from starting position (0-1s)
- Full sprint across frame, camera tracks (1-3s)
- Subject slides to stop, dust particles visible in light (3-4s)
```

### Physics Descriptions

Explicitly state forces for best results:
- "Silk fabric billowing in 5mph breeze"
- "Water pours downward, making tiny ripples inside glass"
- "Board clips curb and tumbles; wheels wobble"
- "Realistic physics: momentum, weight, ground contact. No morphing."

---

## Section 5: Prompt Structure and Examples

### Optimal Prompt Template

```
[Scene action description -- what happens from this starting point]

Cinematography:
Camera: [framing + single movement]
Lens: [focal length + depth of field]
Lighting: [key source, fill, color temperature]
Mood: [emotional tone]

Actions:
- [Beat 1 with timing: 0-2s]
- [Beat 2 with timing: 2-4s]

Dialogue (if needed):
"[Brief natural lines]"
```

**Length guidelines:** 50-200 words provides balanced control. Under 50 allows creative variation; over 200 risks fragmentation. Never exceed 8-10 competing elements per prompt.

### Cinematic Portrait Animation

```
[Subject from reference image] slowly turns toward camera, eyes meeting lens with subtle warmth.

Cinematography:
Camera: Medium close-up, slow push-in over 4 seconds
Lens: 85mm; f/1.8 shallow depth of field
Lighting: Soft window light from camera left, warm practical fill from below frame
Mood: Intimate, contemplative

Actions:
- Subject turns head 45 degrees toward camera (0-2s)
- Eyes settle on lens, slight smile forms (2-3s)
- Breathing visible, holds gaze (3-4s)
```

### B-Roll Environment Animation

```
[Environment from reference image] comes alive with subtle atmospheric motion.

Cinematography:
Camera: Slow tracking shot left to right, 30 degrees over 8 seconds
Lens: 35mm; deep focus
Lighting: Golden hour backlighting, volumetric rays through atmosphere
Mood: Cinematic establishing, epic scale

Actions:
- Leaves drift through foreground (0-3s)
- Light shifts subtly as clouds pass (3-6s)
- Bird crosses distant background (6-8s)

Ambient sound: Wind through trees, distant city hum
```

### Product Video

```
[Product from reference] positioned on surface, camera reveals design details.

Cinematography:
Camera: 180 degree slow arc around product, stopping at hero angle
Lens: 50mm macro; extreme shallow DOF isolating product
Lighting: Three-point studio setup, soft key from 10 o'clock, rim light from behind
Mood: Premium, aspirational

Actions:
- Camera begins arc revealing left profile (0-3s)
- Continues to front hero angle (3-6s)
- Subtle reflection catches light in final frame (6-8s)

No visible text. No hands in frame. Clean background throughout.
```

### Dialogue Scene

```
[Character from reference] delivers line with natural expression and timing.

Cinematography:
Camera: Medium shot, locked-off tripod, slight breathing motion
Lens: 50mm; moderate depth of field
Lighting: Soft key from window left, cool fill from opposite, warm practical in background
Mood: Conversational, grounded

Actions:
- Character shifts weight, prepares to speak (0-1s)
- Delivers dialogue (1-3s)
- Settles, maintains eye contact with off-screen listener (3-4s)

Dialogue:
Character: "I've been waiting for this moment."

Keep dialogue brief -- one natural line. Plan for ADR refinement.
```

---

## Section 6: Audio Handling

### Plan for ADR (Automated Dialogue Replacement)

Sora 2 generates audio natively, but **audio quality is weak compared to VEO 3.1**. For production work:

1. Generate video with native audio for timing reference
2. Record or synthesize replacement audio (ElevenLabs, Google TTS, Azure Neural TTS)
3. Replace audio track in post-production
4. Align replacement audio to visual lip movements

### Audio Best Practices

- Keep dialogue to 1-2 short exchanges per 4-second clip
- Lips may continue moving after dialogue ends -- plan for post-production trimming
- Longer speeches consistently fail -- break into separate clips
- Native audio is best for ambient sound effects and environmental audio
- For music or voice-over, always plan to replace in post

### Descriptive Negation for Audio

Sora 2 has no official negative prompt parameter, but descriptive negation works:
- "No text or captions on screen"
- "No visible letters in the scene"
- "No blur, no overexposure, no jagged lines"
- "No watermarks, no text artifacts"

---

## Section 7: Quality Checklist

### Pre-Generation

- [ ] Reference image matches target video resolution exactly
- [ ] Prompt describes ACTION, not appearance (appearance comes from image)
- [ ] Only ONE camera movement per shot
- [ ] Only ONE subject action per shot
- [ ] Beat-based timing specified for each action
- [ ] 50-200 words, no more than 8-10 competing elements
- [ ] Physics interactions explicitly described with forces

### Multi-Shot Consistency

- [ ] Exact physical descriptors copy-pasted verbatim across all prompts
- [ ] Same lens family used across all shots (e.g., 35mm/50mm spherical primes)
- [ ] Style spine maintained (film stock, color grade, palette)
- [ ] Continuity anchors repeated ("same red windbreaker", "freckled cheeks")

### Post-Generation

- [ ] Subject clarity and emotional delivery
- [ ] Smooth camera motion without jitters
- [ ] Realistic physics and continuity
- [ ] No artifacts (distorted elements, unnatural motion)
- [ ] Proper audio sync and duration
- [ ] Character/environment consistency across shots

---

## Section 8: Common Failures and Fixes

| Problem | Root Cause | Fix |
|---------|-----------|-----|
| Jittery movements / morphing | Multiple competing actions | Limit to ONE move + ONE action; add "no morphing", "consistent scale" |
| Mouths keep moving after dialogue | Speech timing mismatch | Place dialogue in dedicated block, keep to 1-2 lines per 4s clip, plan ADR |
| Garbled/unreadable text | Text rendering is poor | Avoid on-screen text entirely -- add in post-production |
| Water flowing upward / physics glitches | Implicit physics | Explicitly state physics rules: "Water pours downward", describe surfaces/forces |
| Details shimmer between frames | Lighting inconsistency | Unify lighting across all prompts, add "stable lighting, no sudden brightness changes" |
| Wrong finger count / proportion drift | Complex body rendering | Be hyper-specific about object relationships, add "keep proportions consistent" |
| Quality degrades at 10-12s | Duration too long | Split into two 4-second clips and stitch -- consistently outperforms single 8s+ generations |
| Real person photos blocked | Content policy | Convert to stylized art first, or use Cameo feature for self |
| Crowd scenes fail (5+ people) | Too many subjects | Limit to 2-3 subjects per generation |

### Duration vs Quality

| Duration | Quality Level | Recommendation |
|----------|---------------|----------------|
| 4 seconds | Highest fidelity, best prompt adherence | Use for single actions, precise camera work |
| 8 seconds | Good quality, supports 3-4 dialogue lines | Short sequences, fuller exchanges |
| 10-12 seconds | Quality degrades, consistency risks | Split into shorter clips instead |

**Key insight:** Two stitched 4-second clips consistently outperform a single 8-second generation for complex scenes.

---

## Section 9: Content Policies

- Real person likeness without consent: blocked
- Public figures via text-to-video: blocked
- Visible moving watermark on all sora.com downloads (exception: Cameo-only content)
- C2PA metadata embedded in all assets
- API available in US and Canada only

### Real Person Workaround

Convert reference photos to stylized/illustrated versions first, or use detailed text descriptions instead of photo uploads. The Cameo feature (self-recording verification video) is the only permitted method for real person generation.

---

*Sora 2 I2V Reference Guide -- TERTIARY platform for complex physics and >8s single clips*

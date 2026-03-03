# Kling 2.5 / Wan 2.5 Image-to-Video Reference Guide
## TERTIARY Platform — Use for motion fluidity and cinematic visuals.

Converted from sparkfluence `videoSpecs.ts` platform specifications (fal.ai models).

---

## Section 1: Technical Specs — Kling 2.5 Turbo

| Specification | Value |
|---------------|-------|
| Platform Key | `kling-25-turbo` |
| Display Name | Kling 2.5 Turbo |
| Supported Durations | 5s, 10s |
| Max Duration | 10s |
| Resolution | auto (platform-determined) |
| Audio Support | No |
| Negative Prompt | Yes (supported) |
| Seed Support | No |
| Reference Image Param | `image_url` |
| cfg_scale | 0.5 |
| Cost Estimate | ~$0.10/video |

### Kling 2.5 Strengths

- Top-tier motion fluidity
- Cinematic visuals
- Excellent prompt precision

### Kling 2.5 Best For

- HOOK segments
- CTA segments
- Creator shots
- Short clips (5s)

---

## Section 2: Technical Specs — Wan 2.5

| Specification | Value |
|---------------|-------|
| Platform Key | `wan-25` |
| Display Name | Wan 2.5 |
| Supported Durations | 5s, 10s |
| Max Duration | 10s |
| Resolution | 1080p |
| Audio Support | Yes |
| Negative Prompt | Yes (supported) |
| Seed Support | Yes (for reproducibility) |
| Prompt Expansion | Yes (enabled by default) |
| Reference Image Param | `image_url` |
| Cost Estimate | ~$0.15/video |

### Wan 2.5 Strengths

- 1080p resolution output
- Audio support (background music, ambient)
- Prompt expansion for richer output
- Seed for reproducibility

### Wan 2.5 Best For

- B-roll with BGM
- Longer narratives
- High-resolution output

---

## Section 3: Platform Selection Logic

```
Needs audio?           --> Wan 2.5
Needs explicit 1080p?  --> Wan 2.5
Needs seed/repro?      --> Wan 2.5
Default (best motion)  --> Kling 2.5 Turbo
```

### Decision Function

| Requirement | Platform |
|-------------|----------|
| Audio needed (BGM, ambient, SFX) | Wan 2.5 |
| High-res 1080p explicit | Wan 2.5 |
| Seed for reproducibility | Wan 2.5 |
| Best motion quality (default) | Kling 2.5 Turbo |

---

## Section 4: Camera Movements (Verified for fal.ai)

| Key | Camera Term | Effect |
|-----|------------|--------|
| `push-in` | smooth dolly push-in | Intimacy, emphasis |
| `pull-back` | gentle dolly pull-back | Reveal, context |
| `track` | tracking shot following subject | Following, energy |
| `pan` | slow pan left/right | Horizontal reveal |
| `orbit` | orbit shot circling subject | Tension, interest |
| `static` | static locked-off shot | Stability, authority |
| `drift` | subtle drift | Natural, organic |

---

## Section 5: Video Prompt Builder Pattern

### Core Pattern

```
Camera: [camera movement term]. [Subject motion description]. [Ambient motion description].
```

### Kling 2.5 Prompt Builder

Input parameters:
- `duration`: 5 or 10 seconds
- `cameraMovement`: one of the verified camera keys
- `subjectMotion`: description of subject movement
- `ambientMotion`: (optional) environmental motion
- `negativePrompt`: (optional) override default

Output structure:
```json
{
  "prompt": "Camera: smooth dolly push-in. Subject leans forward with subtle hand gesture. Floating dust particles in light beam.",
  "negative_prompt": "blur, distort, low quality, artifacts",
  "duration": "5",
  "cfg_scale": 0.5
}
```

### Wan 2.5 Prompt Builder

Additional parameters beyond Kling:
- `audioUrl`: (optional) URL to audio file
- `enablePromptExpansion`: (default true) allow model to expand prompt

Output structure:
```json
{
  "prompt": "Camera: smooth dolly push-in. Subject leans forward with subtle hand gesture. Floating dust particles in light beam.",
  "negative_prompt": "low resolution, error, worst quality, low quality, defects",
  "duration": "5",
  "resolution": "1080p",
  "audio_url": "https://...",
  "enable_prompt_expansion": true
}
```

---

## Section 6: Negative Prompt Defaults

### Kling 2.5 Turbo Default

```
blur, distort, low quality, artifacts
```

### Wan 2.5 Default

```
low resolution, error, worst quality, low quality, defects
```

### Extended Negative Prompt (When Needed)

```
blur, distort, low quality, artifacts, watermark, text overlay,
unrealistic proportions, cartoon effects, compression artifacts
```

---

## Section 7: Environment Audio Templates (Wan 2.5 Only)

Since Kling 2.5 does not support audio, these templates apply only when using Wan 2.5.

| Environment | Audio Description |
|-------------|-------------------|
| Office | Quiet office -- soft HVAC hum, distant typing. No music, no subtitles. |
| Home | Home -- soft room tone, distant traffic. No music, no subtitles. |
| Studio | Clean studio -- minimal room tone, professional. No music, no subtitles. |
| Tech | Data center -- server fan hum, electronic ambient. No music, no subtitles. |
| Outdoor | City street -- distant traffic, urban atmosphere. No music, no subtitles. |
| Cafe | Cafe ambiance -- soft chatter, coffee machine. No music, no subtitles. |
| Nature | Nature -- birds chirping, gentle wind. No music, no subtitles. |

Default fallback: Office audio template.

---

## Section 8: Duration Rules per Segment Type

| Segment Type | Min Duration | Max Duration | Default |
|--------------|-------------|-------------|---------|
| HOOK | 3s | 5s | 5s |
| FORE / FORESHADOW | 3s | 5s | 5s |
| BODY | 5s | 10s | 5s |
| PEAK | 5s | 10s | 5s |
| TWIST | 5s | 10s | 5s |
| CTA | 3s | 5s | 5s |
| LOOP-END | 2s | 5s | 5s |
| ENDING_CTA | 3s | 5s | 5s |

### Dialogue Word Limits (Based on Indonesian Speech Rate)

Speech rate baseline: 130 WPM with 0.80 safety margin.

| Duration | Max Words | Calculation |
|----------|-----------|-------------|
| 5 seconds | 9 words | 130/60 x 5 x 0.80 = 8.7 |
| 10 seconds | 17 words | 130/60 x 10 x 0.80 = 17.3 |

General formula: `Math.floor((130 / 60) * durationSeconds * 0.80)`

---

## Section 9: Quality Checklist

### Pre-Generation

- [ ] Platform selected correctly (audio needed -> Wan 2.5, default -> Kling 2.5 Turbo)
- [ ] Duration is supported (5s or 10s only)
- [ ] Camera movement uses verified fal.ai term from Section 4
- [ ] Prompt follows Camera + Subject Motion + Ambient pattern
- [ ] Negative prompt specified
- [ ] cfg_scale set to 0.5 for Kling 2.5
- [ ] Reference image URL provided via `image_url` parameter

### For Wan 2.5 Specifically

- [ ] Resolution set to "1080p"
- [ ] Audio URL provided if BGM needed
- [ ] Prompt expansion enabled/disabled as appropriate
- [ ] Seed specified if reproducibility is needed

### Prompt Quality

- [ ] Motion description only (no visual details from reference image)
- [ ] Single camera movement (not multiple competing movements)
- [ ] Subject motion is specific and achievable in duration
- [ ] Ambient motion adds atmosphere without competing with subject
- [ ] "Maintain exact appearance from reference image" included

### Post-Generation

- [ ] Motion is fluid, not jittery
- [ ] Camera movement matches requested type
- [ ] Subject identity preserved from reference image
- [ ] No artifacts (blur, distortion, quality degradation)
- [ ] Duration matches requested length
- [ ] Audio present and appropriate (Wan 2.5 only)

---

## Section 10: Complete Prompt Examples

### Hook Shot (Kling 2.5 Turbo, 5s)

```
Prompt: "Camera: smooth dolly push-in. Subject makes direct eye contact,
subtle eyebrow raise, hint of knowing intrigue. Minimal body movement,
all attention on face. Single floating dust particle crossing light beam."

Negative: "blur, distort, low quality, artifacts"
Duration: "5"
cfg_scale: 0.5
```

### B-Roll with Audio (Wan 2.5, 10s)

```
Prompt: "Camera: slow pan left/right. City skyline at golden hour,
warm light shifting across buildings. Atmospheric haze drifting.
Gentle cloud movement in background."

Negative: "low resolution, error, worst quality, low quality, defects"
Duration: "10"
Resolution: "1080p"
enable_prompt_expansion: true
```

### CTA Shot (Kling 2.5 Turbo, 5s)

```
Prompt: "Camera: static locked-off shot. Subject smiles warmly at camera,
subtle forward lean suggesting invitation. Natural breathing visible,
genuine expression developing. Clean undistracting background."

Negative: "blur, distort, low quality, artifacts"
Duration: "5"
cfg_scale: 0.5
```

### Explanation Shot (Kling 2.5 Turbo, 10s)

```
Prompt: "Camera: subtle drift. Subject gestures naturally while explaining,
hands visible, regular eye contact with camera. Subtle postural shifts
maintaining energy. Clean professional environment, minimal distraction."

Negative: "blur, distort, low quality, artifacts"
Duration: "10"
cfg_scale: 0.5
```

---

*Kling 2.5 / Wan 2.5 I2V Reference Guide -- TERTIARY platform for motion fluidity and cinematic visuals*

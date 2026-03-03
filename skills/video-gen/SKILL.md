---
name: video-gen
description: |
  Standalone AI video prompt generator. Converts any image to platform-optimized
  video prompts for Grok 3 (PRIMARY), VEO 3.1, Sora 2, Kling 2.5, and Seedance 2.0.
  Use this skill whenever the user wants to:
  - Convert an image to a video animation prompt
  - Generate video prompts from carousel slides
  - Create I2V (image-to-video) prompts for any AI video platform
  - Batch-process a folder of images into video prompts
  - Choose the best video platform for their content
  Triggers on: image to video, video prompt, animate image, I2V, convert to video,
  Grok video, VEO prompt, bikin video, animasi gambar, generate video.
---

# Image-to-Video Prompt Generator

Converts any image to platform-optimized video prompts.
Every video must feel alive — natural motion, cinematic camera, immersive audio.

---

## Reference Files (Read On-Demand)

| Task | Read First |
|------|-----------|
| ANY prompt | `references/global-video-config.md` (ALWAYS — read FIRST) |
| Grok 3 prompt (DEFAULT) | + `references/grok-3-guide.md` (PRIMARY platform) |
| VEO 3.1 prompt | + `references/veo-31-guide.md` (lip-sync, dialogue) |
| Sora 2 prompt | + `references/sora-2-guide.md` (complex physics) |
| Kling 2.5 prompt | + `references/kling-25-guide.md` (motion fluidity) |
| Seedance 2.0 prompt | + `references/seedance-20-guide.md` (multi-shot, audio sync) |
| Camera movement selection | + `references/camera-movement-library.md` |
| Motion description | + `references/motion-description-library.md` |
| SFX/audio direction | + `references/sfx-audio-vocabulary.md` |
| Image analysis | + `references/image-analysis-framework.md` |
| Prompt format | + `references/prompt-templates.md` |
| Text in image | + `references/text-preservation-rules.md` |
| Quality scoring | + `references/quality-checklist.md` |
| Indonesian content | + `references/localization-id.md` |
| Voice/audio mode | + `references/voice-audio-modes.md` (carousel vs short video vs product promo) |

---

## Content Type → Audio Mode (CRITICAL)

| Content Type | Audio Mode | Voice | Platform |
|-------------|-----------|-------|----------|
| **Carousel Animation** (LinkedIn, IG) | SFX only | NO voice, NO narration | Grok 3 |
| **Short Video** (TikTok, Reels, Shorts) | Creator voice anchor | Lip-sync on face, narration on B-roll | VEO 3.1 (face) + Grok 3 (B-roll) |
| **Product Promo** | Creator voice anchor | Lip-sync on face, narration on B-roll | VEO 3.1 (face) + Grok 3 (B-roll) |
| **Pure B-Roll** | SFX only | NO voice | Grok 3 |

### Creator Voice Anchor Rule (Short Video / Product Promo)
1. Creator voice is **consistent throughout entire video** — never disappears
2. **Face on screen** → lip-sync (creator speaks on-camera) → use **VEO 3.1**
3. **B-roll** → narration (creator voice off-screen, same voice) → use **Grok 3** or **VEO 3.1**
4. Same voice tone, pace, and energy across ALL segments
5. See `references/voice-audio-modes.md` for full rules

---

## Hard Rules (NON-NEGOTIABLE)

1. **GOLDEN RULE: IMAGE = VISUALS, VIDEO = MOTION.** Never re-describe visual elements already in the image. Video prompt describes ONLY what MOVES and what SOUNDS
2. **ONE camera movement per prompt.** Never combine multiple competing camera moves
3. **SFX/audio is MANDATORY.** Every video prompt must include specific audio direction — never generic "add sound"
4. **Grok 3 is PRIMARY.** Default to Grok 3 unless a specific feature requires another platform (lip-sync → VEO, physics → Sora 2, multi-shot → Seedance)
5. **Duration must match content.** 6s for simple/ambient, 10s for standard/action, 15s for complex/dramatic
6. **Text preservation when applicable.** If image contains text (headlines, branding, labels), include preservation instruction
7. **Quality gate minimum 6/8.** Every prompt must pass the 8-point quality checklist before output
8. **Negative prompts ONLY where supported.** Grok 3 does NOT support negative prompts — never include them for Grok 3

---

## Fixed Technical Specs

| Setting | Grok 3 (PRIMARY) | VEO 3.1 | Sora 2 | Kling 2.5 | Seedance 2.0 |
|---------|-----------------|---------|--------|-----------|-------------|
| Duration | 6s / 10s / 15s | 8s | 10s / 15s | 10s | 4s - 15s |
| Resolution | 720p HD | 1080p | 720p | auto | 2K |
| Audio | Auto SFX | Native | Plan ADR | No | Native sync |
| Lip-sync | No | Yes | Limited | No | Yes |
| Neg. prompt | No | Yes | Yes | Yes | Yes |
| Image input | Reference | Up to 3 | First frame | image_url | Up to 9 |
| Prompt length | 50-100 words | 100-150 words | 150+ words | 50-150 words | 50-150 words |

---

## Workflow: Single Image → Video Prompt

### Step 0: INPUT COLLECTION

Ask the user:
1. **Image path** — single image file path
2. **Content type** — carousel animation (SFX only) / short video (voice anchor) / product promo (voice anchor) / pure b-roll (SFX only)
3. **Target platform** — default Grok 3 (or user specifies VEO/Sora/Kling/Seedance)
4. **Duration preference** — or auto-detect based on content
5. **Output folder** (optional) — write to file or print to console
6. **Context** (optional) — additional info about what the image is for
7. **Script/narration text** (if short video/promo) — what the creator says on each segment

### Step 1: IMAGE ANALYSIS (Structured — Claude Vision)

Read the image using Claude's multimodal Read tool. Extract structured 6-element analysis:

```
## Image Analysis

### 1. Subject
- Who/what: [primary subject description]
- Position/pose: [where in frame, body language]
- Expression: [emotional state if face visible]

### 2. Motion Cues
- Implied movement: [frozen action, directional elements]
- What would naturally move: [hair, clothing, particles, water, etc.]
- Potential energy: [things about to happen]

### 3. Camera/Composition
- Shot type: [CU/MCU/MS/WS/EWS]
- Angle: [eye-level/low/high/overhead]
- DOF: [shallow/deep, bokeh presence]
- Depth layers: [foreground/midground/background]

### 4. Lighting
- Direction: [front/back/side/top/Rembrandt/butterfly]
- Quality: [hard/soft]
- Color temp: [warm/cool/neutral, estimated Kelvin]
- Time of day: [morning/afternoon/golden hour/night]

### 5. Environment
- Location: [indoor/outdoor, specific setting]
- Atmosphere: [clear/hazy/foggy/rainy/dusty]
- Background elements: [what could animate naturally]

### 6. Mood/Style
- Emotional tone: [peaceful/dramatic/eerie/joyful/tense]
- Visual style: [photorealistic/cinematic/stylized]
- Color palette: [warm/cool/saturated/muted]
```

### Step 2: PLATFORM ROUTING

**Default: Grok 3** unless user specifies or content requires otherwise.

```
Platform Decision Tree:
├── DEFAULT → Grok 3 (PRIMARY)
├── Need lip-sync/dialogue? → VEO 3.1
├── Complex physics/elaborate motion? → Sora 2
├── Need highest resolution (2K)? → Seedance 2.0
├── Multi-shot narrative + audio? → Seedance 2.0
├── Motion fluidity priority? → Kling 2.5
└── User override? → use specified platform
```

Present recommendation to user with brief rationale. User can override.

### Step 3: PROMPT GENERATION

Based on platform, read the platform-specific guide + shared references.

1. **Select camera movement** from `camera-movement-library.md` — match content emotion
2. **Describe subject motion** from `motion-description-library.md` — micro-movements, gestures
3. **Add ambient/environmental motion** — particles, environmental elements
4. **Add SFX/audio direction** from `sfx-audio-vocabulary.md` — specific and detailed
5. **Apply text preservation** if image has text — from `text-preservation-rules.md`
6. **Format to platform template** from `prompt-templates.md`
7. **Set duration** based on content complexity

### Step 4: QUALITY GATE

Score the prompt against the 8-point quality checklist:

```
### Quality: [N]/8
✓ Motion Match | ✓ One Camera | ✓ No Re-description | ✓ Specific SFX
✓ Duration OK | ✓ Text Safe | ✓ Platform OK | ✓ Negative Prompt
```

**Minimum 6/8.** If below, auto-revise by adding missing elements before output.

### Step 5: OUTPUT

```
# Video Prompt — [Platform Name]

**Source Image:** `[filename]`
**Platform:** [Grok 3 / VEO 3.1 / Sora 2 / Kling 2.5 / Seedance 2.0]
**Duration:** [N]s | **Resolution:** [res] | **Orientation:** [ratio]

## Image Analysis Summary
[Key findings from Step 1 — 3-4 lines]

## Video Prompt
[Full prompt text — ready to copy-paste into platform]

## Technical Settings
| Setting | Value |
|---------|-------|
| Duration | [N]s |
| Resolution | [res] |
| Orientation | [ratio] |
| Camera | [movement] |
| Audio | [SFX summary] |

## Quality: [N]/8
✓ Motion Match | ✓ One Camera | ✓ No Re-description | ✓ Specific SFX
✓ Duration OK | ✓ Text Safe | ✓ Platform OK | ✓ Negative Prompt
```

If output folder provided → write to `{path}/video-prompt-{platform}.md`
If no folder → print to console

---

## Workflow: Batch (Folder) → Full Video Set

### Step 0: FOLDER INPUT

Ask the user:
1. **Folder path** — containing multiple images
2. **Target platform(s)** — default Grok 3, or multi-platform
3. **Context file** (auto-detect) — if `carousel-prompt.md` exists, read for slide types + emotional arc
4. **Output folder** — same folder or specified path

### Step 1-4: PROCESS EACH IMAGE

For each image in the folder (sorted by filename):
1. Run Image Analysis (Step 1)
2. Platform Routing (Step 2) — same platform for all unless multi-platform
3. Prompt Generation (Step 3)
4. Quality Gate (Step 4)

### Step 5: BATCH OUTPUT

```
# Video Animation Prompts — [Platform Name]
# Source: [folder path]

Platform: [name] | Images: [N] | Duration Total: [sum]s

---

## Image [N]: [filename]
**Duration:** [N]s | **Camera:** [movement] | **Emotion:** [tone]

### Video Prompt
[Full prompt text]

### Quality: [N]/8
[checklist]

---

[... repeat for all images ...]

---

## Duration Summary

| # | Image | Duration | Camera | Emotion |
|---|-------|----------|--------|---------|
| 1 | [filename] | [N]s | [movement] | [tone] |
| ... | ... | ... | ... | ... |
| **Total** | | **[sum]s** | | |

## Video Continuity Checklist
- [ ] All prompts describe ONLY motion and sound
- [ ] Each prompt has exactly ONE camera movement
- [ ] SFX/audio specific and matches content per image
- [ ] Duration appropriate for each image
- [ ] Camera variety across sequence
- [ ] Consistent audio style across related images
- [ ] All prompts pass 6/8 quality gate
```

Output to: `{folder}/video-prompt-{platform}.md`

---

## Workflow: Multi-Platform Export

Generate video prompts for the SAME image(s) across multiple platforms:

1. Analyze image(s) once (Step 1)
2. For each platform: generate platform-optimized prompt (Steps 2-4)
3. Output separate file per platform: `video-prompt-grok3.md`, `video-prompt-veo31.md`, etc.

---

## Carousel Integration

When a `carousel-prompt.md` file exists in the input folder:

1. **Read carousel context** — extract slide types (Hook/Foreshadow/Body/CTA), emotional arc, topic
2. **Map slide types to motion intensity:**
   - Hook → HIGH energy, dramatic motion
   - Foreshadow → SUBTLE, tension building
   - Body → OPERATIONAL, matching content type
   - CTA → WARM, inviting, interactive
3. **Maintain emotional arc** across the video sequence
4. **Auto-detect text elements** from carousel slide structure (headlines, branding)

---

## Duration Selection Guide

| Content / Complexity | Recommended | Platform |
|---------------------|-------------|----------|
| Simple ambient scene | 6s | Grok 3 |
| Standard action/motion | 10s | Grok 3 |
| Complex dramatic scene | 10-15s | Grok 3 / Seedance 2.0 |
| Dialogue / talking head | 8s | VEO 3.1 |
| Physics simulation | 10-15s | Sora 2 |
| Multi-shot narrative | 10-15s | Seedance 2.0 |
| Quick ambient loop | 4-6s | Seedance 2.0 / Grok 3 |

---

## Creator Identity (Optional)

If user provides creator face/brand references:

1. Confirm `ref/creator-face.png` and `ref/creator-brand.png` exist
2. Include face consistency note: "Maintain exact appearance from reference image"
3. Apply creator-specific prompting patterns (wardrobe, lighting, expression)

Not required — plugin works with any image regardless of creator identity.

# AI Video Prompt Generator — Claude Project Instructions

## Project Overview

**AI Video Prompt Generator** — Standalone Claude Code plugin that converts any image to platform-optimized video prompts for 5 major AI video platforms.

| Component | Details |
|-----------|---------|
| Plugin Type | Claude Code Plugin (standalone) |
| Input | Any image (single file or folder) |
| Output | Platform-optimized video prompts (markdown) |
| Primary Platform | **Grok 3** (default for ALL conversions) |
| Secondary | VEO 3.1 (lip-sync), Seedance 2.0 (multi-shot) |
| Tertiary | Sora 2 (physics), Kling 3.0 (motion fluidity, multi-shot) |

## Architecture

| Path | Purpose |
|------|---------|
| `.claude-plugin/plugin.json` | Plugin metadata (name, version, author) |
| `hooks/hooks.json` | SessionStart hook definition |
| `hooks/session-start.sh` | Session start — announces available skills |
| `skills/video-gen/SKILL.md` | Main skill — image → video prompt generation |
| `skills/video-validate/SKILL.md` | Cross-file consistency checker (6 checks) |
| `skills/video-add-platform/SKILL.md` | Scaffold new platform (automates 7-step process) |
| `agents/image-to-video-batch.md` | Subagent for batch processing folders |
| `agents/quality-reviewer.md` | Subagent for parallel quality gate verification |
| `references/` | 16 reference docs read on-demand by skill/agent |

### Reference Files

| File | When Used |
|------|-----------|
| `global-video-config.md` | ALWAYS (read FIRST) — single source of truth for all configurable values |
| `grok-3-guide.md` | Grok Imagine (Grok 3) prompts (PRIMARY) — Aurora engine, lip-sync, native audio, dialogue (Speech:), SFX, text preservation |
| `veo-31-guide.md` | VEO 3.1 prompts — lip-sync, dialogue, audio constraints, VEO-verified camera terms |
| `sora-2-guide.md` | Sora 2 prompts — I2V specs, beat-based timing, ONE move + ONE action |
| `kling-25-guide.md` | Kling 2.5/3.0 prompts — Turbo + Wan 2.5 specs, motion fluidity |
| `seedance-20-guide.md` | Seedance 2.0 prompts — quad-modal input, multi-shot, audio sync |
| `camera-movement-library.md` | Unified camera movement library (all platforms, cross-referenced) |
| `motion-description-library.md` | Subject micro-movements, ambient motion, emotion-based intensity |
| `sfx-audio-vocabulary.md` | SFX vocabulary by 13+ categories (incl. enterprise/industrial), platform-specific audio rules |
| `image-analysis-framework.md` | 7-element structured analysis for extracting video-relevant info from images (incl. text detection) |
| `prompt-templates.md` | Per-platform prompt templates with fill-in sections and examples |
| `text-preservation-rules.md` | Text preservation for images with baked-in text overlays |
| `quality-checklist.md` | 10-point video quality gate (incl. complexity check), per-platform variations, common mistakes |
| `voice-audio-modes.md` | Content type audio rules: carousel (SFX only) vs short video (creator voice anchor) vs product promo |
| `voice-emotion-direction.md` | Voice emotion control, natural delivery, anti-robotic techniques, dialogue pacing, platform voice capabilities |
| `localization-id.md` | Indonesian SFX terms, motion descriptions, cultural context |

## Key Concepts

### Content Type → Audio + Animation Mode (CRITICAL)
```
Carousel Animation (LinkedIn/IG):
  Audio  → SFX only, NO voice, NO narration
  Motion → SIMPLE but MINDBLOWING — minimal movement, maximum creative impact
  Duration → 6s (default) or 10s (dramatic/CTA) only
  Text   → Headlines MUST persist start-to-finish, always visible & readable

Short Video (TikTok/Reels/Shorts):
  Audio  → Creator voice ANCHOR + lip-sync (MANDATORY)
  Motion → HOLLYWOOD QUALITY — dramatic, cinematic, bold, stop the scroll

Product Promo:
  Audio  → Creator voice ANCHOR + lip-sync (MANDATORY)
  Motion → HOLLYWOOD QUALITY — creative freedom, maximum impact

Pure B-Roll:
  Audio  → SFX only, no voice
  Motion → HOLLYWOOD QUALITY — cinematic motion encouraged
```

### Golden Rule
```
IMAGE prompt = ALL VISUALS (subject, lighting, lens, color, atmosphere)
VIDEO prompt = MOTION ONLY (camera movement, micro-motion, audio/SFX)
NEVER duplicate visual details already in the image inside the video prompt.
```

### Platform Priority
```
🟢 PRIMARY   → Grok 3 (default for ALL image-to-video conversion)
🟡 SECONDARY → VEO 3.1 (lip-sync, dialogue), Seedance 2.0 (multi-shot, audio sync)
🔵 TERTIARY  → Sora 2 (complex physics), Kling 3.0 (motion fluidity, multi-shot)
```

### Platform Specs

| Platform | Duration | Resolution | Audio | Lip-sync | Dialogue |
|----------|----------|------------|-------|----------|----------|
| **Grok 3** | **1s-15s** (UI: 6s/10s/15s) | 720p | Native (SFX+dialogue+music) | Yes (single char) | `Speech: [text]` |
| VEO 3.1 | 4s / 6s / 8s | 1080p | Native | Yes (best) | `says: "text"` |
| Sora 2 | 4s / 8s / 12s | 720p / 1080p (Pro) | Native | Limited | Quotes below prose |
| Kling 3.0 | 5s / 10s / 15s | 1080p | Native (voice ref) | Yes | Voice ref + text |
| Seedance 2.0 | 3s - 12s | Up to 2K | Native sync | Yes | Audio section |

### Image Analysis Framework
7-element structured analysis via Claude Vision:
1. Subject (who/what, appearance, position, expression)
2. Motion Cues (implied movement, frozen action, directional elements)
3. Camera/Composition (framing, angle, DOF, depth layers)
4. Lighting (direction, quality, color temp, time of day)
5. Environment (location, atmosphere, background elements)
6. Mood/Style (emotional tone, visual style, color palette)
7. Text Detection (headlines, branding, labels — triggers text preservation)

### Quality Gate
- 10-point checklist per video prompt
- Minimum 7/10 to pass (Grok: 8/10)
- Auto-revise if below threshold
- Factors: Motion match, One camera, No re-description, Specific SFX, Duration OK, Text safe, Platform OK, Negative prompt, Zero re-description, **Complexity appropriate**

### Grok Simplicity Rule (CRITICAL)
```
Max 2 subject motions + 1 camera + 1 ambient + 2-3 SFX (~5 elements MAX)
LESS IS MORE — over-specifying causes chaotic, illogical animation
Lip-sync: face >=20% frame, MCU/CU, static camera, 8-10 words (6s)
Physics: simple only (drift, sway) — no collisions, liquid, cloth sim
Hands: simple gestures only — no finger detail
```

### Grok Lip-Sync Expression Limit (CRITICAL)
```
Multiple facial expression directions COMPETE with lip-sync and WIN.
Grok must choose: animate expressions OR animate lip-sync — not both.

RULE: Max 1 simple expression + Speech:. Never stack.
  - Face must stay toward camera (no "turns to look at screen")
  - Speech: must be clearly separated in prompt, not buried mid-paragraph
  - BAD:  "Eyebrows snap up, smile breaks, hand rises. Speech: text"
  - GOOD: "Warm smile, slight nod. Speech: text"
```

## Capabilities

1. **Single image → video prompt** — analyze 1 image, generate prompt for selected platform
2. **Batch processing** — process folder of images, maintain continuity, output per-platform files
3. **Multi-platform export** — generate prompts for same image across multiple platforms
4. **Carousel integration** — if carousel-prompt.md exists, use slide types + emotional arc for context
5. **Platform routing** — auto-suggest best platform based on content, user can override
6. **Quality gate** — 10-point scoring, minimum 7/10 (Grok: 8/10), auto-revision
7. **Text preservation** — detect and preserve text overlays in image-to-video conversion
8. **SFX/audio direction** — detailed, specific audio cues matching scene content
9. **Creator identity** (optional) — maintain face/brand consistency from reference images
10. **Add platform** — scaffold all files for a new video platform via `/video-add-platform`
11. **Quality review** — parallel quality gate verification via `quality-reviewer` subagent

## Conventions

### Changing a Global Setting
1. Edit `references/global-video-config.md` — single source of truth
2. No need to edit other files — they all reference global-video-config.md

### Adding a New Platform Guide
Use `/video-add-platform` skill to automate the full 7-step scaffold, or manually:
1. Create `.md` file in `references/` (e.g., `new-platform-guide.md`)
2. Add entry to Reference Files table in `skills/video-gen/SKILL.md`
3. Add entry to Reference Files table in `agents/image-to-video-batch.md`
4. Update this CLAUDE.md file
5. Update `references/global-video-config.md` Platform Specs table
6. Update supporting references (prompt-templates, quality-checklist)
7. Run `/video-validate` to verify consistency

### File Naming
- Reference files: lowercase, kebab-case (e.g., `grok-3-guide.md`)
- Output files: `video-prompt-{platform}.md` (e.g., `video-prompt-grok3.md`)
- No spaces in filenames

## Debugging

| Issue | Check |
|-------|-------|
| **Illogical/chaotic animation (Grok)** | **Too many concurrent motions — max 2 subject + 1 ambient. Simplify prompt.** |
| **Lip-sync not working (Grok)** | **Face >=20% frame, MCU/CU, static camera, max 8-10 words, Custom mode, Speech: syntax** |
| **Lip-sync mouth not moving (Grok)** | **Too many facial expressions competing with lip-sync — max 1 expression + Speech:. Face must stay toward camera. Speech: clearly separated, not buried mid-paragraph** |
| **Weird physics (Grok)** | **Grok can't simulate momentum/gravity/collisions. Use simple motion: drift, sway, settle** |
| **Hand/finger deformities (Grok)** | **Keep hands simple (open gesture, point) or crop out of frame** |
| Prompt too long for Grok 3 | Keep under 100 words — first 20-30 words matter most |
| Prompt too short for VEO | Use 100-150 words for optimal VEO results |
| Re-describes scene | Only describe MOTION + SOUND — image already has visuals |
| Multiple camera moves | Pick ONE — never combine competing moves. Grok: use verified terms only |
| No SFX | Every prompt must have specific audio direction |
| Generic audio | Be specific: "dramatic orchestral swell" not "add music." Grok: max 2-3 SFX layers |
| Text blurred in video | Slow down camera, add text preservation instruction |
| Text cropped | Avoid push-in that frames out text areas |
| Wrong platform | Check platform decision tree — Grok 3 is default |
| Lip-sync not working (VEO) | Use says: colon syntax, face >=20% frame, MCU/CU shot |
| Quality too low | Min 7/10 (Grok: 8/10) — check each of 10 factors |
| Negative prompt in Grok 3 | Grok 3 does NOT support negative prompts — remove them |
| Duration mismatch | Check global-video-config.md for platform durations |
| Same camera every image | Vary movements across batch — check camera-movement-library.md |

## Hooks

| Hook | Type | Trigger | Behavior |
|------|------|---------|----------|
| Reference edit warning | PreToolUse | Edit/Write on `references/` | Warns to run `/video-validate` |
| Infrastructure guard | PreToolUse | Edit/Write on `plugin.json`, `marketplace.json`, `hooks.json` | Blocks edit, requires user confirmation |
| Reference edit reminder | PostToolUse | Edit/Write on `references/` | Reminds to run `/video-validate` after edit |

---

**Version:** 1.0.0
**Last Updated:** March 2026

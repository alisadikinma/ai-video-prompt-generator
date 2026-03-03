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
| Tertiary | Sora 2 (physics), Kling 2.5 (motion fluidity) |

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
| `references/` | 15 reference docs read on-demand by skill/agent |

### Reference Files

| File | When Used |
|------|-----------|
| `global-video-config.md` | ALWAYS (read FIRST) — single source of truth for all configurable values |
| `grok-3-guide.md` | Grok 3 prompts (PRIMARY) — Aurora engine, SFX vocab, text preservation, camera movements |
| `veo-31-guide.md` | VEO 3.1 prompts — lip-sync, dialogue, audio constraints, VEO-verified camera terms |
| `sora-2-guide.md` | Sora 2 prompts — I2V specs, beat-based timing, ONE move + ONE action |
| `kling-25-guide.md` | Kling 2.5 prompts — Turbo + Wan 2.5 specs, motion fluidity |
| `seedance-20-guide.md` | Seedance 2.0 prompts — quad-modal input, multi-shot, audio sync |
| `camera-movement-library.md` | Unified camera movement library (all platforms, cross-referenced) |
| `motion-description-library.md` | Subject micro-movements, ambient motion, emotion-based intensity |
| `sfx-audio-vocabulary.md` | SFX vocabulary by 12+ categories, platform-specific audio rules |
| `image-analysis-framework.md` | 6-element structured analysis for extracting video-relevant info from images |
| `prompt-templates.md` | Per-platform prompt templates with fill-in sections and examples |
| `text-preservation-rules.md` | Text preservation for images with baked-in text overlays |
| `quality-checklist.md` | 8-point video quality gate, per-platform variations, common mistakes |
| `voice-audio-modes.md` | Content type audio rules: carousel (SFX only) vs short video (creator voice anchor) vs product promo |
| `localization-id.md` | Indonesian SFX terms, motion descriptions, cultural context |

## Key Concepts

### Content Type → Audio Mode (CRITICAL)
```
Carousel Animation (LinkedIn/IG) → SFX only, NO voice, NO narration
Short Video (TikTok/Reels/Shorts) → Creator voice ANCHOR throughout:
  - Face on screen = lip-sync (VEO 3.1)
  - B-roll = off-screen narration (same creator voice)
Product Promo → Same as short video (creator voice anchor)
Pure B-Roll → SFX only, no voice
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
🔵 TERTIARY  → Sora 2 (complex physics), Kling 2.5 (motion fluidity)
```

### Platform Specs

| Platform | Duration | Resolution | Audio | Lip-sync |
|----------|----------|------------|-------|----------|
| **Grok 3** | **6s / 10s / 15s** | 720p | Auto SFX | No |
| VEO 3.1 | 8s | 1080p | Native | Yes |
| Sora 2 | 10s / 15s | 720p | Plan ADR | Limited |
| Kling 2.5 | 10s | auto | No | No |
| Seedance 2.0 | 4s - 15s | 2K | Native sync | Yes |

### Image Analysis Framework
6-element structured analysis via Claude Vision:
1. Subject (who/what, appearance, position, expression)
2. Motion Cues (implied movement, frozen action, directional elements)
3. Camera/Composition (framing, angle, DOF, depth layers)
4. Lighting (direction, quality, color temp, time of day)
5. Environment (location, atmosphere, background elements)
6. Mood/Style (emotional tone, visual style, color palette)

### Quality Gate
- 8-point checklist per video prompt
- Minimum 6/8 to pass
- Auto-revise if below threshold
- Factors: Motion match, One camera, No re-description, Specific SFX, Duration OK, Text safe, Platform OK, Negative prompt

## Capabilities

1. **Single image → video prompt** — analyze 1 image, generate prompt for selected platform
2. **Batch processing** — process folder of images, maintain continuity, output per-platform files
3. **Multi-platform export** — generate prompts for same image across multiple platforms
4. **Carousel integration** — if carousel-prompt.md exists, use slide types + emotional arc for context
5. **Platform routing** — auto-suggest best platform based on content, user can override
6. **Quality gate** — 8-point scoring, minimum 6/8, auto-revision
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
| Prompt too long for Grok 3 | Keep under 100 words — first 20-30 words matter most |
| Prompt too short for VEO | Use 100-150 words for optimal VEO results |
| Re-describes scene | Only describe MOTION + SOUND — image already has visuals |
| Multiple camera moves | Pick ONE — never combine competing moves |
| No SFX | Every prompt must have specific audio direction |
| Generic audio | Be specific: "dramatic orchestral swell" not "add music" |
| Text blurred in video | Slow down camera, add text preservation instruction |
| Text cropped | Avoid push-in that frames out text areas |
| Wrong platform | Check platform decision tree — Grok 3 is default |
| Lip-sync not working | Switch to VEO 3.1, face >=20% frame, MCU/CU shot |
| Quality too low | Min 6/8 — check each of 8 factors is addressed |
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

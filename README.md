# AI Video Prompt Generator

Standalone Claude Code plugin that converts any image to platform-optimized video prompts for 5 major AI video platforms.

## Supported Platforms

| Platform | Priority | Duration | Resolution | Best For |
|----------|----------|----------|------------|----------|
| **Grok 3** | PRIMARY | 1s-15s (UI: 6s/10s/15s) | 720p | Default for all I2V, lip-sync, native audio, dialogue (`Speech:`) |
| VEO 3.1 | Secondary | 4s / 6s / 8s | 1080p | Best lip-sync, dialogue, talking head |
| Seedance 2.0 | Secondary | 3s - 12s | Up to 2K | Multi-shot, audio sync |
| Sora 2 | Tertiary | 4s / 8s / 12s | 720p / 1080p | Complex physics, elaborate motion |
| Kling 3.0 | Tertiary | 5s / 10s / 15s | 1080p | Motion fluidity, multi-shot, voice ref |

## Features

- Single image or batch folder processing (never skips images)
- Structured 7-element image analysis via Claude Vision (incl. text detection + face role)
- Platform-specific prompt optimization with content type awareness
- Intention-driven prompting — direct WHAT happens, not HOW each body part moves
- 13-point video quality gate (min 9/13, Grok with voice: 11/13)
- Story intention + state change required for every clip
- Emotion defaults to SUBTLE — escalate only for deliberate climax
- Voice gender anchoring — prevents Grok voice hijack from non-creator faces
- Grok simplicity rule — max 2 subject motions + 1 camera + 1 ambient + 2-3 SFX
- Lip-sync expression limit — max 1 facial expression with `Speech:`
- Text preservation for images with baked-in text
- 13+ SFX/audio categories (incl. enterprise/industrial)
- Voice emotion direction — anti-robotic techniques, dialogue pacing
- Content type audio modes: carousel (SFX only), short video (creator voice), product promo, pure B-roll
- Unified camera movement library (all platforms, cross-referenced)
- Carousel integration (reads carousel-prompt.md for context)
- Multi-platform export
- New platform scaffolding (automates 7-step setup)
- Parallel quality review via subagent
- Indonesian localization

## Install

```bash
# Step 1: Add marketplace
claude plugins marketplace add alisadikinma/ai-content-suite

# Step 2: Install plugin
claude plugins install ai-video-prompt-generator

# Optional: Choose scope
claude plugins install ai-video-prompt-generator --scope user    # All projects
claude plugins install ai-video-prompt-generator --scope project # This project only
```

Or via **Manage Plugins UI** → **Marketplaces** tab → paste `alisadikinma/ai-content-suite` → **Add**, then install from **Plugins** tab.

## Skills

| Skill | Invoke | Description |
|-------|--------|-------------|
| `video-gen` | `/video-gen` | Main skill — convert image(s) to video prompts |
| `video-validate` | `/video-validate` | Cross-file consistency checker (6 checks) |
| `video-add-platform` | `/video-add-platform` | Scaffold all files for a new AI video platform |

## Agents

| Agent | Description |
|-------|-------------|
| `image-to-video-batch` | Batch processing folders of images with continuity + voice consistency |
| `quality-reviewer` | Parallel quality gate verification (13-point scoring) |

## Quick Start

1. Install the plugin (see above)
2. Invoke: `/video-gen`
3. Provide image path
4. Get platform-optimized video prompt

## Golden Rule

```
IMAGE = ALL VISUALS (subject, lighting, lens, color, atmosphere)
VIDEO = MOTION ONLY (camera movement, micro-motion, audio/SFX)
NEVER duplicate visual details already in the image.
```

## Key Rules

**Intention-Driven Prompting** — Every prompt answers: "In this clip, [subject] [does ONE thing]." Direct intentions, not body parts. Trust the model — it knows how humans move.

**State Change** — Every clip has a transformation: start state → end state = the story. No state change = no story.

**Emotion = Subtle by Default** — Default to subtle ("quiet smile", "slight nod"). Escalate only for deliberate climax moments.

**One Duration Per Clip** — Analyze storyline complexity → pick ONE duration (6s/10s/15s). Never generate multiple variants.

**Grok Simplicity** — Less is more. Max ~5 elements per prompt. Over-specifying causes chaotic animation.

**Lip-Sync Expression Limit** — Max 1 facial expression + `Speech:`. Multiple expressions compete with lip-sync and win (mouth won't move).

**Voice Gender Anchoring** — Every `Speech:` prompt must have explicit voice gender anchor (`A [gender] voice.` or `A [gender] narrator voice.`) to prevent Grok from using visible non-creator faces to determine voice.

**No Image Skipping** — Every image the user provides must have a video prompt. Differentiate similar images with varied camera, motion, or emotional beats.

## Architecture

```
.claude-plugin/plugin.json     Plugin metadata
hooks/hooks.json               SessionStart hook definition
hooks/session-start.sh         Announces available skills on session start
skills/video-gen/SKILL.md      Main skill — image → video prompt
skills/video-validate/SKILL.md Cross-file consistency checker
skills/video-add-platform/     New platform scaffolding
agents/image-to-video-batch.md Batch processing subagent
agents/quality-reviewer.md     Quality gate subagent
references/                    16 reference docs (read on-demand)
```

### Reference Files

| File | Purpose |
|------|---------|
| `global-video-config.md` | Single source of truth for all configurable values |
| `grok-3-guide.md` | Grok 3 — Aurora engine, lip-sync, native audio, `Speech:`, SFX |
| `veo-31-guide.md` | VEO 3.1 — lip-sync, dialogue, audio constraints |
| `sora-2-guide.md` | Sora 2 — I2V specs, beat-based timing |
| `kling-25-guide.md` | Kling 2.5/3.0 — Turbo + Wan 2.5 specs, motion fluidity |
| `seedance-20-guide.md` | Seedance 2.0 — quad-modal input, multi-shot, audio sync |
| `camera-movement-library.md` | Unified camera movement library (all platforms) |
| `motion-description-library.md` | Subject micro-movements, ambient motion, emotion-based intensity |
| `sfx-audio-vocabulary.md` | SFX vocabulary by 13+ categories |
| `image-analysis-framework.md` | 7-element structured image analysis |
| `prompt-templates.md` | Per-platform prompt templates with examples |
| `text-preservation-rules.md` | Text preservation for baked-in text overlays |
| `quality-checklist.md` | 13-point quality gate, per-platform variations |
| `voice-audio-modes.md` | Content type audio rules + voice gender anchoring |
| `voice-emotion-direction.md` | Voice emotion control, anti-robotic techniques |
| `localization-id.md` | Indonesian SFX terms, motion descriptions |

## License

MIT

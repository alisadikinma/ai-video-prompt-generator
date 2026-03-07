# AI Video Prompt Generator

Standalone Claude Code plugin that converts any image to platform-optimized video prompts for 5 major AI video platforms.

## Supported Platforms

| Platform | Priority | Duration | Best For |
|----------|----------|----------|----------|
| **Grok 3** | PRIMARY | 1s-15s (UI: 6s/10s/15s) | Default for all I2V, lip-sync, native audio |
| VEO 3.1 | Secondary | 4s / 6s / 8s | Best lip-sync, dialogue, talking head |
| Seedance 2.0 | Secondary | 3s - 12s | Multi-shot, audio sync, 2K |
| Sora 2 | Tertiary | 4s / 8s / 12s | Complex physics, elaborate motion |
| Kling 3.0 | Tertiary | 5s / 10s / 15s | Motion fluidity, multi-shot, voice ref |

## Features

- Single image or batch folder processing
- Structured 7-element image analysis via Claude Vision (incl. text detection)
- Platform-specific prompt optimization
- 10-point video quality gate (min 7/10, Grok: 8/10)
- Text preservation for images with baked-in text
- 13+ SFX/audio categories (incl. enterprise/industrial)
- Unified camera movement library
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
| `image-to-video-batch` | Batch processing folders of images |
| `quality-reviewer` | Parallel quality gate verification (10-point scoring) |

## Quick Start

1. Install the plugin (see above)
2. Invoke: `/video-gen`
3. Provide image path
4. Get platform-optimized video prompt

## Golden Rule

```
IMAGE = ALL VISUALS (subject, lighting, lens, color, atmosphere)
VIDEO = MOTION ONLY (camera movement, micro-motion, audio/SFX)
```

## License

MIT

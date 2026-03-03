# AI Video Prompt Generator

Standalone Claude Code plugin that converts any image to platform-optimized video prompts for 5 major AI video platforms.

## Supported Platforms

| Platform | Priority | Duration | Best For |
|----------|----------|----------|----------|
| **Grok 3** | PRIMARY | 6s / 10s / 15s | Default for all I2V conversion |
| VEO 3.1 | Secondary | 8s | Lip-sync, dialogue, talking head |
| Seedance 2.0 | Secondary | 4s - 15s | Multi-shot, audio sync, 2K |
| Sora 2 | Tertiary | 10s / 15s | Complex physics, elaborate motion |
| Kling 2.5 | Tertiary | 10s | Motion fluidity, cinematic |

## Features

- Single image or batch folder processing
- Structured 6-element image analysis via Claude Vision
- Platform-specific prompt optimization
- 8-point video quality gate (min 6/8)
- Text preservation for images with baked-in text
- 12+ SFX/audio categories
- Unified camera movement library
- Carousel integration (reads carousel-prompt.md for context)
- Multi-platform export
- New platform scaffolding (automates 7-step setup)
- Parallel quality review via subagent
- Indonesian localization

## Install

### Via Marketplace (if you already have `alisadikinma-ai-agent-expert` marketplace)

```bash
/plugin install ai-video-prompt-generator@alisadikinma-ai-agent-expert
```

### From Scratch

```bash
# Step 1 — Add marketplace
/plugin marketplace add alisadikinma/ai-image-carousel-prompt-gen

# Step 2 — Install plugin
/plugin install ai-video-prompt-generator@alisadikinma-ai-agent-expert
```

## Skills

| Skill | Invoke | Description |
|-------|--------|-------------|
| `image-to-video` | `/image-to-video` | Main skill — convert image(s) to video prompts |
| `validate-video-refs` | `/validate-video-refs` | Cross-file consistency checker (6 checks) |
| `add-platform` | `/add-platform` | Scaffold all files for a new AI video platform |

## Agents

| Agent | Description |
|-------|-------------|
| `image-to-video-batch` | Batch processing folders of images |
| `quality-reviewer` | Parallel quality gate verification (8-point scoring) |

## Quick Start

1. Install the plugin (see above)
2. Invoke: `/image-to-video`
3. Provide image path
4. Get platform-optimized video prompt

## Golden Rule

```
IMAGE = ALL VISUALS (subject, lighting, lens, color, atmosphere)
VIDEO = MOTION ONLY (camera movement, micro-motion, audio/SFX)
```

## License

MIT

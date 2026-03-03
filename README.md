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
- Indonesian localization

## Skills

| Skill | Description |
|-------|-------------|
| `image-to-video` | Main skill — convert image(s) to video prompts |
| `validate-video-refs` | Cross-file consistency checker (6 checks) |

## Agent

| Agent | Description |
|-------|-------------|
| `image-to-video-batch` | Subagent for batch processing folders of images |

## Quick Start

```bash
# Install from marketplace
claude plugin install ai-video-prompt-generator

# Or install from GitHub
claude plugin install https://github.com/alisadikinma/ai-video-prompt-generator.git
```

1. Invoke: `/image-to-video`
2. Provide image path
3. Get platform-optimized video prompt

## Golden Rule

```
IMAGE = ALL VISUALS (subject, lighting, lens, color, atmosphere)
VIDEO = MOTION ONLY (camera movement, micro-motion, audio/SFX)
```

## License

MIT

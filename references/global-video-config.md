# Global Video Config — Single Source of Truth

> **All other files reference this config.** To change any setting, edit THIS file only.
> Reference files, SKILL.md, agent.md, and CLAUDE.md all point here for configurable values.

---

## How to Change a Setting

1. Find the setting below
2. Change the value
3. Done — all other files reference `global-video-config.md` for these values

---

## 1. Platform Priority

| Priority | Platform | When to Use |
|----------|----------|-------------|
| `PRIMARY` | **Grok 3** | Default for ALL image-to-video conversion |
| `SECONDARY` | VEO 3.1 | Lip-sync, dialogue-heavy, creator talking head |
| `SECONDARY` | Seedance 2.0 | Multi-shot storytelling, audio sync, longest duration |
| `TERTIARY` | Sora 2 | Complex physics, elaborate motion, multi-shot narrative |
| `TERTIARY` | Kling 2.5 | Motion fluidity, cinematic visuals |

```
DEFAULT PLATFORM: Grok 3
OVERRIDE ONLY WHEN: specific feature needed that Grok 3 doesn't support
```

---

## 2. Platform Technical Specs

| Setting | Grok 3 | VEO 3.1 | Sora 2 | Kling 2.5 | Seedance 2.0 |
|---------|--------|---------|--------|-----------|-------------|
| `duration` | 6s / 10s / 15s | 8s | 10s / 15s | 10s | 4s - 15s |
| `resolution` | 720p HD | 1080p | 720p | auto | 2K |
| `audio` | Auto SFX | Native (dialogue+SFX) | Plan ADR | No | Native sync |
| `lip_sync` | No | Yes (best) | Limited | No | Yes |
| `negative_prompt` | No | Yes | Yes | Yes | Yes |
| `image_input` | Yes (reference) | Yes (up to 3) | Yes (first frame) | Yes (image_url) | Yes (up to 9) |
| `orientations` | 16:9, 9:16, 1:1, 2:3, 3:2 | 16:9, 9:16 | 16:9, 9:16, 1:1 | 9:16, 16:9 | 16:9, 9:16, 1:1 |

---

## 3. Default Duration Rules

| Content Type | Default Duration | Platform |
|-------------|-----------------|----------|
| Standard scene | 6s | Grok 3 |
| Hook / high-energy | 10s | Grok 3 |
| Climax / dramatic payoff | 10s - 15s | Grok 3 |
| CTA / engagement | 10s | Grok 3 |
| Dialogue / talking head | 8s | VEO 3.1 |
| Complex physics | 10s | Sora 2 |
| Multi-shot narrative | 10s - 15s | Seedance 2.0 |

---

## 4. Creator Identity (USER-PROVIDED)

| Setting | Value |
|---------|-------|
| `creator_face` | `ref/creator-face.png` — clear face photo |
| `creator_brand` | `ref/creator-brand.png` — brand icon/logo |

**Session start:** Confirm `ref/` folder exists with both files before generating creator-facing prompts.

---

## 5. Output Conventions

| Setting | Value |
|---------|-------|
| `output_file_pattern` | `video-prompt-{platform}.md` |
| `grok3_output` | `video-prompt-grok3.md` |
| `veo31_output` | `video-prompt-veo31.md` |
| `sora2_output` | `video-prompt-sora2.md` |
| `kling25_output` | `video-prompt-kling25.md` |
| `seedance20_output` | `video-prompt-seedance20.md` |
| `multi_platform_output` | Separate file per platform |

---

## 6. Quality Gate

| Setting | Value |
|---------|-------|
| `quality_gate_points` | 8 |
| `minimum_pass` | 6/8 |
| `auto_revise_below` | 6/8 |

---

## 7. Golden Rule

```
IMAGE prompt = ALL VISUALS (subject, lighting, lens, color, atmosphere)
VIDEO prompt = MOTION ONLY (camera movement, micro-motion, audio/SFX)
NEVER duplicate visual details already in the image inside the video prompt.
Use: "Maintain exact appearance from reference image."
```

---

## 8. Orientation Mapping (Source → Video Platform)

| Source Format | Source Ratio | Grok 3 | VEO 3.1 | Sora 2 |
|--------------|-------------|--------|---------|--------|
| IG Feed | 4:5 | Vertical (2:3) | 9:16 | 9:16 |
| TikTok/Reels | 9:16 | Portrait (9:16) | 9:16 | 9:16 |
| LinkedIn | 4:5 or 1:1 | Vertical (2:3) or Square (1:1) | 9:16 | 1:1 |
| YouTube | 16:9 | Landscape (16:9) | 16:9 | 16:9 |
| Custom | Any | Match closest | Match closest | Match closest |

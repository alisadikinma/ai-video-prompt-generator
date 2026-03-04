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
| `PRIMARY` | **Grok Imagine** (Grok 3) | Default for ALL image-to-video. Now has lip-sync + native audio. Fastest + cheapest. |
| `SECONDARY` | VEO 3.1 | Best lip-sync quality, production-grade dialogue, 1080p |
| `SECONDARY` | Seedance 2.0 | Multi-shot storytelling, audio sync, quad-modal input |
| `TERTIARY` | Sora 2 | Complex physics, elaborate motion, best temporal consistency |
| `TERTIARY` | Kling 3.0 | Multi-shot sequences, voice reference, cinematic visuals |

```
DEFAULT PLATFORM: Grok Imagine (Grok 3)
OVERRIDE ONLY WHEN: need production-grade lip-sync (VEO 3.1), complex physics (Sora 2),
                     multi-shot native (Kling 3.0/Seedance 2.0), or 1080p+ resolution
```

> **Version note:** Grok specs reflect Grok Imagine v1.0 (Feb 2026). Kling specs reflect v3.0 (Feb 2026).
> **Last verified:** March 2026

---

## 2. Platform Technical Specs

| Setting | Grok Imagine | VEO 3.1 | Sora 2 | Kling 3.0 | Seedance 2.0 |
|---------|-------------|---------|--------|-----------|-------------|
| `duration` | 1s-15s (granular); UI: 6s/10s/15s | 4s / 6s / 8s | 4s / 8s / 12s (API); 20s (Pro) | 5s / 10s / 15s | 3s - 12s |
| `resolution` | 720p HD (default 480p — must request 720p) | 1080p | 720p (standard) / 1080p (Pro) | 1080p | Up to 2K |
| `audio` | Native (SFX + dialogue + music) | Native (dialogue+SFX) | Native (comprehensive) | Native (voice reference) | Native sync |
| `lip_sync` | Yes (single character, v1.0+) | Yes (best quality) | Limited | Yes | Yes |
| `dialogue_syntax` | `Speech: [text]` | `Character says: "text"` | Quotes below prose | Via audio section | Voice ref URL + text |
| `negative_prompt` | No | Yes | Yes | Yes | Yes |
| `image_input` | Yes (reference) | Yes (up to 3) | Yes (first frame) | Yes (image_url) | Yes (up to 9) |
| `orientations` | 16:9, 9:16, 1:1, 4:3, 3:4, 2:3, 3:2 | 16:9, 9:16 | 16:9, 9:16, 1:1 | 9:16, 16:9 | 16:9, 9:16, 1:1 |
| `video_extension` | Yes (chain up to 30s) | No | No | Multi-shot native | Multi-shot native |

---

## 3. Content Type Animation Rules (CRITICAL)

| Content Type | Animation Style | Voice / Lip-sync | Design Preservation | Headlines |
|-------------|----------------|------------------|--------------------|-----------|
| **Carousel Animation** | SUBTLE — drift, pulse, glow only | NO voice, NO narration — SFX only | YES — do NOT change image design | MUST persist start-to-finish |
| **Short Video** | HOLLYWOOD QUALITY — dramatic, cinematic, bold | YES — creator voice anchor + lip-sync | NO — creative freedom | Optional |
| **Product Promo** | HOLLYWOOD QUALITY — dramatic, cinematic, bold | YES — creator voice anchor + lip-sync | NO — creative freedom | Optional |
| **Pure B-Roll** | HOLLYWOOD QUALITY — cinematic motion | NO voice — SFX only | NO — creative freedom | N/A |

```
CAROUSEL  = Subtle animation + SFX only + preserve design + headlines always visible
NON-CAROUSEL = Hollywood quality animation + voiceover lip-sync + creative freedom + stop the scroll
```

---

## 4. Default Duration Rules

| Content Type | Default Duration | Platform | Notes |
|-------------|-----------------|----------|-------|
| Standard scene | 6s | Grok Imagine | Default choice |
| Hook / high-energy | 10s | Grok Imagine | Front-load action |
| Climax / dramatic payoff | 10s - 15s | Grok Imagine | Reserve 15s for most important |
| CTA / engagement | 10s | Grok Imagine | Bookend with hook |
| Dialogue / talking head (budget) | 6s - 10s | Grok Imagine | `Speech:` syntax, single character lip-sync |
| Dialogue / talking head (quality) | 8s | VEO 3.1 | Best lip-sync, production-grade |
| Complex physics | 8s - 12s | Sora 2 | Best physics accuracy |
| Multi-shot narrative | 10s - 15s | Seedance 2.0 / Kling 3.0 | Native multi-shot support |

---

## 5. Creator Identity (USER-PROVIDED)

| Setting | Value |
|---------|-------|
| `creator_face` | `ref/creator-face.png` — clear face photo |
| `creator_brand` | `ref/creator-brand.png` — brand icon/logo |

**Session start:** Confirm `ref/` folder exists with both files before generating creator-facing prompts.

---

## 6. Output Conventions

| Setting | Value |
|---------|-------|
| `output_file_pattern` | `video-prompt-{platform}.md` |
| `grok3_output` | `video-prompt-grok3.md` |
| `veo31_output` | `video-prompt-veo31.md` |
| `sora2_output` | `video-prompt-sora2.md` |
| `kling30_output` | `video-prompt-kling30.md` |
| `seedance20_output` | `video-prompt-seedance20.md` |
| `multi_platform_output` | Separate file per platform |

---

## 7. Quality Gate

| Setting | Value |
|---------|-------|
| `quality_gate_points` | 8 |
| `minimum_pass` | 6/8 |
| `auto_revise_below` | 6/8 |

---

## 8. Golden Rule

```
IMAGE prompt = ALL VISUALS (subject, lighting, lens, color, atmosphere)
VIDEO prompt = MOTION ONLY (camera movement, micro-motion, audio/SFX)
NEVER duplicate visual details already in the image inside the video prompt.
Use: "Maintain exact appearance from reference image."
```

---

## 9. Orientation Mapping (Source → Video Platform)

| Source Format | Source Ratio | Grok Imagine | VEO 3.1 | Sora 2 |
|--------------|-------------|-------------|---------|--------|
| IG Feed | 4:5 | 4:3 (native match) | 9:16 | 9:16 |
| TikTok/Reels | 9:16 | Portrait (9:16) | 9:16 | 9:16 |
| LinkedIn | 4:5 or 1:1 | 4:3 or Square (1:1) | 9:16 | 1:1 |
| YouTube | 16:9 | Landscape (16:9) | 16:9 | 16:9 |
| Presentation | 4:3 | 4:3 (native) | 16:9 | 16:9 |
| Custom | Any | Match closest (7 ratios available) | Match closest | Match closest |

> **Grok I2V note:** Image-to-video defaults to input image's aspect ratio unless explicitly overridden.

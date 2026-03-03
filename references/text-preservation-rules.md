# Text Preservation Rules — Image-to-Video

> When converting images that contain baked-in text (headlines, branding, watermarks, labels, HUD data) to video, the text MUST remain readable throughout the entire animation.

---

## 1. Core Principle

The source image IS the video frame — the AI model animates it. Any text already baked into the image must stay sharp and readable from first frame to last frame.

**Applies when:** The input image contains visible text elements (headlines, subtitles, brand names, data labels, watermarks, page numbers, CTA text).

**Does NOT apply when:** The input image is a pure visual with no text overlays.

---

## 2. Text Preservation Rules

### HARD RULES (Non-Negotiable)

1. **Do NOT re-describe text** — the image already contains it
2. **Explicitly state preservation** — include "all text, headline, branding, and watermark remain sharp and readable throughout" in every prompt where text exists
3. **Camera movements SLOW and SUBTLE** — fast zooms, extreme pans, or rotation will blur text
4. **Never crop text zones** — avoid push-in that frames out areas containing text
5. **Avoid rotation or shake** — blurs text and makes it unreadable

### Camera Movement Constraints for Text Safety

| Movement | Text Safe? | Notes |
|----------|-----------|-------|
| Static / locked | YES | Best for text-heavy images |
| Slow drift | YES | Subtle enough to keep text sharp |
| Slow push-in | CAUTION | Only if text zone stays in frame |
| Slow pull-back | YES | Reveals more, text stays visible |
| Slow pan | CAUTION | Text at edges may exit frame |
| Fast zoom | NO | Blurs text |
| Whip pan | NO | Blurs everything |
| Orbit | CAUTION | Only very slow orbit, text may warp |
| Handheld/shake | NO | Blurs text |

### Safe Camera Strategy

```
Text-heavy image → prefer STATIC or SLOW DRIFT
Partial text      → prefer camera away from text zone (e.g., animate top, keep bottom text static)
No text           → any camera movement acceptable
```

---

## 3. Animated Text Elements

Some text elements SHOULD be animated for engagement:

| Element | Animation | Purpose |
|---------|-----------|---------|
| CTA text | Subtle pulse, glow, scale up | Draw attention to action |
| Interactive cue (e.g., "SWIPE") | Slide-right/bounce | Encourage interaction |
| Social media icons | Glow one by one | Interactive engagement |
| Data/stats text | Fade in, count up | Reveal information |

**Rule:** Static text = preserve. Interactive text = animate for engagement.

---

## 4. Prompt Fragment for Text Preservation

### Standard (any platform)
```
All text, headline, branding, and watermark remain sharp and readable throughout.
```

### With animated CTA
```
All headline and branding text remains sharp and readable throughout. The CTA text subtly pulses to draw attention.
```

### With interactive elements
```
All text, headline, branding remain sharp and readable throughout. [Interactive element] gently [animation type] as an interactive cue.
```

---

## 5. Platform Support

| Platform | Text Preservation | Notes |
|----------|------------------|-------|
| Grok 3 | Manual in prompt | Best — explicitly state in prompt, model respects it well |
| VEO 3.1 | Manual in prompt | Add "no text overlays" to prevent model adding its own text |
| Sora 2 | Manual in prompt | Add preservation instruction, keep camera subtle |
| Kling 2.5 | Manual in prompt | Include in prompt, use static/drift camera |
| Seedance 2.0 | Manual in prompt | Include in prompt, avoid complex camera on text areas |

---

## 6. Common Mistakes

| Mistake | Fix |
|---------|-----|
| Text blurred by fast camera | Slow down camera to drift/static |
| Text cropped by push-in | Ensure text zone stays in frame throughout |
| Text zone animated | Animate ONLY the visual scene area, keep text zone stable |
| No preservation instruction | ALWAYS include text preservation line in prompt |
| Text too small to read in video | Consider if text matters — if not, don't preserve; if yes, use static camera |

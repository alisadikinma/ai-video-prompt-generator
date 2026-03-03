# Video Quality Checklist

> 8-point scoring system for every video prompt. Minimum 6/8 to pass. Auto-revise if below threshold.

---

## 1. Video Quality Gate — 8 Points

| # | Factor | Check | Required |
|---|--------|-------|----------|
| 1 | **Motion matches content** | Motion intensity matches the scene's emotional tone (subtle for calm, dramatic for action) | ALL |
| 2 | **ONE camera movement** | Single camera movement only — no competing moves | ALL |
| 3 | **No visual re-description** | Prompt describes MOTION + SOUND only, never re-describes static image elements | ALL |
| 4 | **Specific SFX/audio** | Audio direction is detailed and specific (not generic "add sound") | ALL |
| 5 | **Duration appropriate** | Duration matches content complexity (6s simple, 10s standard, 15s complex) | ALL |
| 6 | **Text preservation** | If image has text: headlines, branding readable throughout | IF TEXT |
| 7 | **Platform constraints met** | Duration, resolution, prompt length within platform limits | ALL |
| 8 | **Negative prompt included** | Quality exclusions specified (where platform supports it) | IF SUPPORTED |

**Minimum: 6/8.** Revise before output if below threshold.

---

## 2. Quality Output Format

```
### Quality: [N]/8
✓ Motion Match | ✓ One Camera | ✓ No Re-description | ✓ Specific SFX
✓ Duration OK | ✓ Text Safe | ✓ Platform OK | ✓ Negative Prompt
```

If a check fails:
```
### Quality: [N]/8
✓ Motion Match | ✗ One Camera (has push-in AND pan) | ✓ No Re-description | ...
→ FIX: Remove pan, keep push-in only
```

---

## 3. Per-Platform Checklist Variations

### Grok 3 (PRIMARY)
- [ ] Duration: 6s, 10s, or 15s
- [ ] Orientation set (16:9 / 9:16 / 1:1 / 2:3 / 3:2)
- [ ] First 20-30 words contain most important elements
- [ ] No negative prompt used (Grok doesn't support it)
- [ ] SFX/audio direction specific and detailed
- [ ] ONE camera movement only
- [ ] Motion describes ONLY what MOVES and SOUNDS
- [ ] Text preservation if image has text overlays
- [ ] Prompt length: 50-100 words (optimal)

### VEO 3.1
- [ ] Duration: max 8s
- [ ] Resolution: 1080p
- [ ] Aspect: 9:16 or 16:9
- [ ] Camera movement uses VEO-verified term
- [ ] Subject micro-motion described
- [ ] Audio block complete (ambient + dialogue + exclusions)
- [ ] Dialogue: max 12-15 words, format "[Character] says:"
- [ ] "No subtitles, no audience sounds, no text overlays"
- [ ] Lip-sync: face >=20% frame, MCU/CU shot
- [ ] Negative prompt included

### Sora 2
- [ ] Duration: 10s or 15s
- [ ] Resolution: 720p
- [ ] ONE camera move only
- [ ] ONE subject action only
- [ ] Beat-based timing included (turns 0-2s, pauses 2-4s, completes 4-6s)
- [ ] Audio in dedicated block
- [ ] No visual re-description
- [ ] Negative prompt included

### Kling 2.5
- [ ] Duration: 5s or 10s
- [ ] Camera movement described
- [ ] Subject motion described
- [ ] Ambient motion (if applicable)
- [ ] Negative prompt: "blur, distort, low quality, artifacts" minimum
- [ ] cfg_scale: 0.5

### Seedance 2.0
- [ ] Duration: 4s-15s
- [ ] Resolution: up to 2K
- [ ] Clear concrete prompt (not vague)
- [ ] Camera movement keyword included
- [ ] Physics-specific if applicable
- [ ] Style qualifiers included
- [ ] Audio sync direction if needed
- [ ] Negative prompt included

---

## 4. Video Continuity Checklist (Batch Processing)

When generating video prompts for multiple images (batch/carousel):

- [ ] All prompts describe ONLY motion and sound (no re-description of static elements)
- [ ] Each prompt has exactly ONE camera movement
- [ ] SFX/audio is specific and matches content per image
- [ ] Duration appropriate for each image's content
- [ ] Text preservation applied where image has text
- [ ] Emotional arc maintained across sequence (if applicable)
- [ ] Camera variety across sequence (not all same movement)
- [ ] Consistent audio style/mood across related images
- [ ] Platform constraints met for ALL prompts
- [ ] All prompts pass 6/8 quality gate

---

## 5. Common Mistakes & Fixes

| Mistake | Fix |
|---------|-----|
| Re-describing the entire scene | Only describe what MOVES and SOUNDS — image already has the scene |
| Multiple camera moves | Pick ONE — push-in OR pan, not both |
| No SFX direction | Always include specific audio cues — never skip |
| Generic audio ("add music") | Be specific: "dramatic orchestral swell" or "rapid gunfire bursts" |
| Duration too long for simple scene | 6s is enough for subtle motion — only complex/dramatic needs 10-15s |
| Complex hand/finger motion | Keep hand actions simple — AI struggles with detailed fingers |
| Camera too fast for text | Keep moves slow and subtle when image has text |
| Text zone cropped | Avoid push-in that frames out text areas |
| Same camera move for all images | Vary camera movements across a batch for visual interest |
| Prompt too long for Grok 3 | Keep under 100 words — first 20-30 words matter most |
| Prompt too short for VEO 3.1 | Use 100-150 words for optimal VEO results |
| Missing audio exclusions (VEO) | Always add "no subtitles, no audience sounds, no text overlays" |
| Lip-sync face too small (VEO) | Face must be >=20% of frame, use MCU or CU |
| Dialogue too long (VEO) | Max 12-15 words per 8s clip |

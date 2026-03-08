# Video Quality Checklist

> 13-point scoring system for every video prompt. Minimum 9/13 to pass (Grok with voice: 11/13). Auto-revise if below threshold.

---

## 1. Video Quality Gate — 13 Points

| # | Factor | Check | Required |
|---|--------|-------|----------|
| 1 | **Story intention clear** | Prompt has ONE clear intention answerable as "In this clip, [subject] [does one thing]." Motion intensity matches scene's emotional tone. No competing intentions. | ALL |
| 2 | **ONE camera movement** | Single camera movement only — no competing moves | ALL |
| 3 | **No visual re-description** | Prompt describes MOTION + SOUND only, never re-describes static image elements | ALL |
| 4 | **Specific SFX/audio** | Audio direction is detailed and specific (not generic "add sound") | ALL |
| 5 | **Duration matches storyline** | Duration fits narration length + story beat complexity (6s short/simple, 10s medium, 15s dramatic). ONE duration per clip — never multiple variants. | ALL |
| 6 | **Text preservation** | If image has text: headlines, branding readable throughout | IF TEXT |
| 7 | **Platform constraints met** | Duration, resolution, prompt length within platform limits | ALL |
| 8 | **Negative prompt included** | Quality exclusions specified (where platform supports it) | IF SUPPORTED |
| 9 | **Zero re-description** | Prompt contains NO descriptions of static visual elements already in the source image (clothing, colors, positions, environment setup). Every word describes MOTION or SOUND exclusively. | ALL |
| 10 | **Scene complexity appropriate** | Grok: max 2 subject motions + 1 camera + 1 ambient + 2-3 SFX. No complex physics, no multi-object interactions, no detailed hand/finger motion. VEO/Sora: higher complexity OK. | GROK |
| 11 | **Voice anchor present** | Every Speech: prompt has explicit voice gender anchor (`A [gender] voice.` or `A [gender] narrator voice.`). Prevents Grok from using visible non-creator faces to determine voice. MANDATORY for all clips in voiced content (lip-sync AND off-screen narration). | IF VOICE |
| 12 | **State change present** | Clip has a clear transformation from start state to end state (e.g., "scanning → disappointment", "still → alive"). If you can't name the state change, the prompt has no story. | ALL |
| 13 | **Emotion = subtle by default** | Emotion direction defaults to SUBTLE ("quiet smile", "slight nod") unless clip is a deliberate dramatic climax. No over-acting, no theatrical rage, no body-part choreography. Intentions, not body parts. | ALL |

**Minimum: 9/13 (all platforms), 11/13 (Grok with voice).** Revise before output if below threshold.

---

## 2. Quality Output Format

```
### Quality: [N]/13
✓ Story Intention | ✓ One Camera | ✓ No Re-description | ✓ Specific SFX
✓ Duration OK | ✓ Text Safe | ✓ Platform OK | ✓ Negative Prompt | ✓ Zero Re-description
✓ Complexity OK | ✓ Voice Anchor | ✓ State Change | ✓ Subtle Emotion
```

If a check fails:
```
### Quality: [N]/13
✓ Story Intention | ✗ One Camera (has push-in AND pan) | ✓ No Re-description | ...
→ FIX: Remove pan, keep push-in only
```

---

## 3. Per-Platform Checklist Variations

### Grok 3 (PRIMARY — Grok Imagine v1.0+)
- [ ] **Story intention clear** — ONE sentence: "In this clip, [subject] [does one thing]"
- [ ] **State change defined** — start state → end state named before writing prompt
- [ ] **Emotion = subtle by default** — no over-acting, no body-part choreography
- [ ] Duration matches storyline complexity (6s short, 10s medium, 15s dramatic) — ONE duration, not multiple
- [ ] Orientation matches source image aspect ratio
- [ ] **First 20-30 words = primary intention** (front-loaded, most important action)
- [ ] No negative prompt used (Grok doesn't support it)
- [ ] **Max 2 subject motions** (1 primary + 1 secondary) — no stacking 5+ animations
- [ ] ONE camera movement only (Grok-verified terms: static, slow push-in, slow pan, tilt, drift, orbit, handheld)
- [ ] **Max 2-3 SFX layers** (1 foreground + 1 ambient + optional accent)
- [ ] Motion describes ONLY what MOVES and SOUNDS — zero re-description
- [ ] Text preservation if image has text overlays
- [ ] Prompt length: 50-100 words (6s/10s), 100-150 words (15s)
- [ ] **No complex physics** (multi-object collisions, liquid, cloth simulation)
- [ ] **No detailed hand/finger motion** (keep hands simple or out of frame)
- [ ] **Lip-sync check** (if Speech: used): face >=20% frame, MCU/CU, static camera, max 8-10 words (6s) / 12-15 words (10s)
- [ ] **Lip-sync expression limit** (if Speech: used): MAX 1 facial expression direction — multiple expressions compete with lip-sync and win. Face must stay toward camera throughout. Speech: clearly separated in prompt, not buried mid-paragraph
- [ ] **Voice anchor present** (if Speech: used): `A [gender] voice.` before Speech: on lip-sync clips, `A [gender] narrator voice.` before Speech: on off-screen narration clips — prevents voice gender hijack from visible non-creator faces

### VEO 3.1
- [ ] Duration: 4s / 6s / 8s
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
- [ ] Duration: 4s / 8s / 12s (API); up to 20s (Pro)
- [ ] Resolution: 720p (standard) / 1080p (Pro)
- [ ] ONE camera move only
- [ ] ONE subject action only
- [ ] Beat-based timing included (turns 0-2s, pauses 2-4s, completes 4-6s)
- [ ] Audio in dedicated block
- [ ] No visual re-description
- [ ] Negative prompt included

### Kling 3.0
- [ ] Duration: 5s / 10s / 15s
- [ ] Camera movement described
- [ ] Subject motion described
- [ ] Ambient motion (if applicable)
- [ ] Negative prompt: "blur, distort, low quality, artifacts" minimum
- [ ] cfg_scale: 0.5

### Seedance 2.0
- [ ] Duration: 3s - 12s
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
- [ ] Each prompt has clear story intention and state change
- [ ] Emotion defaults to subtle — no over-acting or body-part choreography
- [ ] All prompts pass 9/13 quality gate (Grok with voice: 11/13)

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
| Too many simultaneous animations (Grok) | Max 2 subject motions + 1 ambient. Sequence temporally, don't stack |
| Complex physics in Grok prompt | Grok can't simulate momentum, gravity, collisions reliably. Keep motion simple |
| Detailed hand/finger motion (Grok) | Produces 6 fingers, merged limbs. Keep hands simple or crop out |
| Camera moving during lip-sync (Grok) | Use static or very slow push-in only when Speech: is present |
| Multiple expressions + lip-sync (Grok) | **Max 1 facial expression when Speech: is present — expressions compete with lip-sync** |
| Face turns away during lip-sync (Grok) | **Face must stay toward camera throughout Speech: — no "turns to look at screen"** |
| Speech: buried in paragraph (Grok) | **Keep Speech: as a clearly separated sentence — not mid-paragraph** |
| Prompt too short for VEO 3.1 | Use 100-150 words for optimal VEO results |
| Missing audio exclusions (VEO) | Always add "no subtitles, no audience sounds, no text overlays" |
| Lip-sync face too small (VEO) | Face must be >=20% of frame, use MCU or CU |
| Dialogue too long (VEO) | Max 12-15 words per 8s clip |
| **Over-directed acting (theatrical)** | **Direct INTENTIONS not body parts. "Quiet frustration" not "jaw clenches, fists ball, head snaps left"** |
| **No state change in clip** | **Every clip needs start state → end state. If nothing transforms, there's no story** |
| **Multiple duration variants** | **Pick ONE duration based on storyline complexity — never generate 6s + 10s + 15s for same clip** |
| **Body-part choreography** | **"Eyebrows snap, smile breaks, hand rises" → robotic. Use "reacts with quiet wonder" instead** |
| **B-roll over-choreographed** | **Describe the MOMENT, not the choreography. "Steam curls from mug, morning light" not "steam rises + camera pushes + papers flutter"** |

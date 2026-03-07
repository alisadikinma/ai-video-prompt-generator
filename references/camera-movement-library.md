# Camera Movement Library
## Consolidated Reference for AI Video Prompt Generation

> **GOLDEN RULE: ONE camera movement per prompt. Never combine multiple competing moves.**
> Combining movements (e.g., "pan while pushing in") causes AI video models to produce chaotic, unusable output. Pick the single movement that best serves the emotional beat.

---

## 1. Static

| Term | Effect | Emotional Impact | When to Use | Prompt Phrase |
|------|--------|------------------|-------------|---------------|
| `static shot` | No movement | Stability, authority, formality | Formal delivery, authority positioning, direct-to-camera address | `"static shot, locked camera"` |
| `locked-off shot` | Fixed tripod feel | Observational distance, documentary truth | Documentary scenes, observation without intervention | `"locked-off shot, fixed tripod"` |
| `fixed camera` | Intentional stillness | Contemplation, mounting tension, weight | Tension building, contemplative moments, letting subject carry scene | `"fixed camera, subject moves within frame"` |

---

## 2. Push / Pull

| Term | Effect | Emotional Impact | When to Use | Prompt Phrase |
|------|--------|------------------|-------------|---------------|
| `smooth dolly push-in` | Approach subject smoothly | Building intimacy, increasing focus, drawing viewer in | Hook shots, emotional reveals, building connection | `"smooth dolly push-in toward subject"` |
| `gentle dolly push-in` | Subtle approach | Soft revelation, quiet attention shift | CTA shots, warm personal moments, gentle emphasis | `"gentle dolly push-in toward subject face"` |
| `slow dolly-in` | Gradual approach | Growing tension, increasing emphasis, pressure | Tension building, foreshadowing, slow reveal | `"slow dolly-in building intensity"` |
| `dolly-out` | Retreat from subject | Detachment, context reveal, emotional distance | Revealing environment, pulling back for perspective | `"dolly-out revealing wider scene"` |
| `gentle dolly pull-back` | Soft retreat | Conclusion, emotional release, resolution | Endings, resolution moments, final reveal | `"gentle dolly pull-back revealing environment"` |
| `slow pull-back` | Gradual retreat | Scale reveal, establishing scope | Establishing shots, showing full context | `"camera slowly pulls back revealing the full scene"` |

---

## 3. Lateral

| Term | Effect | Emotional Impact | When to Use | Prompt Phrase |
|------|--------|------------------|-------------|---------------|
| `tracking shot following subject` | Parallel movement alongside subject | Engagement, accompaniment, journey | Walking sequences, following action, movement scenes | `"smooth tracking shot following subject"` |
| `smooth tracking shot` | Polished lateral movement | Professional feel, narrative flow | Professional content, polished presentation | `"smooth tracking shot"` |
| `truck left` | Camera slides left | Reveal, transition, reframing | Lateral reveals, scene transitions, recomposition | `"smooth truck left revealing scene"` |
| `truck right` | Camera slides right | Reveal, transition, reframing | Lateral reveals, scene transitions, recomposition | `"smooth truck right revealing scene"` |
| `slight drift` | Subtle lateral float | Subtle life, gentle energy, warmth | CTA warmth, keeping static shots alive, ambient feel | `"camera gently drifts to the right"` |

---

## 4. Rotational

| Term | Effect | Emotional Impact | When to Use | Prompt Phrase |
|------|--------|------------------|-------------|---------------|
| `slow pan left` | Horizontal reveal leftward | Environment scanning, exploration | Landscape reveals, environment establishment | `"slow pan left across the scene"` |
| `slow pan right` | Horizontal reveal rightward | Environment scanning, discovery | Landscape reveals, environment establishment | `"camera slowly pans right across the landscape"` |
| `whip pan` | Fast horizontal snap | Energy, transition shock, urgency | Transitions between scenes, high-energy beats, surprise | `"whip pan to the right"` |
| `tilt up` | Vertical reveal upward | Scale, power, awe, aspiration | Revealing height, architecture, power shots | `"camera slowly tilts upward"` |
| `tilt down` | Vertical reveal downward | Vulnerability, detail, grounding | Revealing detail, bringing focus down, grounding | `"slow tilt down toward subject"` |

---

## 5. Complex

| Term | Effect | Emotional Impact | When to Use | Prompt Phrase |
|------|--------|------------------|-------------|---------------|
| `crane shot rising` | Vertical ascent | Grand reveal, triumph, liberation | Victory moments, establishing shots, climactic reveals | `"crane shot rising to reveal scene"` |
| `crane shot descending` | Vertical descent | Intimate arrival, approaching discovery | Arriving at scene, descending into detail | `"crane shot descending toward subject"` |
| `orbit shot circling subject` | 360-degree rotation around subject | Dynamic tension, examination, significance | Product showcases, dramatic emphasis, hero moments | `"slow orbit shot circling subject"` |
| `180-degree arc shot` | Half orbit around subject | Dramatic emphasis, shift in perspective | Character turns, dramatic reveals, perspective change | `"180-degree arc shot around subject"` |
| `Steadicam floating movement` | Smooth complex path following action | Immersive following, dreamlike quality | Following through spaces, immersive sequences | `"Steadicam floating movement following action"` |

---

## 6. Zoom

| Term | Effect | Emotional Impact | When to Use | Prompt Phrase |
|------|--------|------------------|-------------|---------------|
| `slow zoom in` | Gradual magnification | Focus, emphasis, growing importance | Highlighting detail, emphasizing subject, building importance | `"slow zoom in toward subject"` |
| `slow zoom out` | Gradual reduction | Context reveal, emotional distance, broadening perspective | Revealing environment, showing scale, creating space | `"slow zoom out revealing full scene"` |

---

## 7. Follow / Aerial

| Term | Effect | Emotional Impact | When to Use | Prompt Phrase |
|------|--------|------------------|-------------|---------------|
| `follow shot` | Camera follows subject from behind | Companionship, journey, pursuit | Walking sequences, following someone, immersive POV | `"camera follows subject from behind"` |
| `aerial drone shot` | Bird's-eye descending/ascending | Grand scale, establishment, cinematic scope | Establishing shots, landscape reveals, factory overviews | `"aerial drone shot slowly descending"` |
| `Dutch angle` | Tilted horizon line | Unease, disorientation, dramatic tension | Tension scenes, villain reveals, psychological discomfort | `"Dutch angle, tilted horizon"` |

---

## 8. Stylistic

| Term | Effect | Emotional Impact | When to Use | Prompt Phrase |
|------|--------|------------------|-------------|---------------|
| `handheld camera` | Organic shake | Documentary realism, visceral energy, rawness | Documentary content, intense scenes, raw emotion | `"subtle handheld camera movement"` |
| `documentary-style` | Observational movement | Realism, authenticity, unscripted feel | Behind-the-scenes, authentic moments, real-world content | `"documentary-style camera, observational"` |
| `shaky cam` | Intentional instability | Tension, chaos, urgency, danger | Action scenes, tension peaks, chaotic moments | `"shaky cam with intentional instability"` |
| `locked + shake` | Static with impact vibration | Impact reaction, explosion aftermath | Explosions, impacts, dramatic environmental events | `"camera stays locked with subtle shake from impacts"` |

---

## Platform Compatibility Matrix

Which camera movement terms are recognized and produce reliable results on each platform.

| Movement Term | Grok 3 | VEO 3.1 | Sora 2 | Kling 3.0 | Seedance 2.0 |
|---------------|--------|---------|--------|-----------|--------------|
| `static shot` | Yes | Yes | Yes | Yes | Yes |
| `locked-off shot` | -- | Yes | Yes | -- | -- |
| `fixed camera` | Yes | Yes | Yes | Yes | Yes |
| `smooth dolly push-in` | Yes | Yes | Yes | Yes | Yes |
| `gentle dolly push-in` | -- | Yes | Yes | -- | -- |
| `slow dolly-in` | Yes | Yes | Yes | Yes | Yes |
| `dolly-out` | Yes | Yes | Yes | Yes | Yes |
| `gentle dolly pull-back` | -- | Yes | Yes | -- | -- |
| `slow pull-back` | Yes | Yes | Yes | Yes | Yes |
| `tracking shot` | -- | Yes | Yes | Yes | Yes |
| `truck left/right` | -- | Yes | Yes | Yes | -- |
| `slight drift` | Yes | Yes | -- | -- | -- |
| `slow pan left/right` | Yes | Yes | Yes | Yes | Yes |
| `whip pan` | -- | Yes | Yes | -- | -- |
| `tilt up/down` | Yes | Yes | Yes | Yes | Yes |
| `crane shot rising` | -- | Yes | Yes | Yes | -- |
| `crane shot descending` | -- | Yes | Yes | -- | -- |
| `orbit shot` | Yes | Yes | Yes | Yes | Yes |
| `180-degree arc` | -- | Yes | Yes | -- | -- |
| `Steadicam` | -- | Yes | Yes | -- | -- |
| `slow zoom in/out` | Yes | Yes | Yes | Yes | Yes |
| `follow shot` | Yes | Yes | Yes | Yes | Yes |
| `aerial drone shot` | -- | Yes | Yes | -- | Yes |
| `Dutch angle` | -- | Yes | Yes | -- | -- |
| `handheld camera` | Yes | Yes | Yes | Yes | Yes |
| `documentary-style` | -- | Yes | Yes | -- | -- |
| `shaky cam` | -- | Yes | Yes | -- | -- |

**Legend:** Yes = verified working, -- = unverified or unreliable on that platform.

**Platform notes:**
- **Grok 3 (CRITICAL — use ONLY verified terms):**
  - **VERIFIED (use these):** `static shot`, `fixed camera`, `smooth dolly push-in`, `slow dolly-in`, `dolly-out`, `slow pull-back`, `slight drift`, `slow pan left/right`, `tilt up/down`, `orbit shot`, `slow zoom in/out`, `follow shot`, `handheld camera`
  - **UNVERIFIED (avoid):** locked-off, gentle dolly, tracking shot, truck, whip pan, crane, 180-degree arc, Steadicam, aerial drone, Dutch angle, documentary-style, shaky cam
  - **RULE:** ONE movement per prompt. Keep speed SLOW. Fast movements cause artifacts and blur text.
  - **For lip-sync scenes:** Use ONLY `static shot` or `slow dolly push-in` — other movements kill lip-sync accuracy.
- **VEO 3.1:** Full library supported. All VEO-verified terms in this document produce reliable results.
- **Sora 2:** Strong movement support. ONE camera move + ONE subject action per shot. Beat-based timing recommended.
- **Kling 3.0:** Reliable with standard movements. Avoid highly specific compound terms.
- **Seedance 2.0:** Basic movement set. Stick to universal terms (static, push-in, pull-back, pan, orbit, handheld).

---

## Emotion-to-Camera Movement Mapping

Use this table to select the right camera movement based on the emotional beat of the scene.

| Desired Emotion | Primary Camera Movement | Alternative | Speed |
|-----------------|------------------------|-------------|-------|
| Authority / Confidence | `static shot` | very slow dolly push-in | None / Very slow |
| Intimacy / Connection | `gentle dolly push-in` | soft orbit | Slow |
| Curiosity / Engagement | `gentle tracking` | subtle orbit | Slow-Medium |
| Tension / Intensity | `slow dolly-in` | handheld slight shake | Slow |
| Revelation / Shock | `quick push-in` | sudden stop | Fast then stop |
| Warmth / Invitation | `gentle dolly push-in` | slight drift | Slow |
| Contemplation / Thought | `static shot` | very slow drift | None / Very slow |
| Excitement / Energy | `dynamic tracking` | subtle handheld | Medium |
| Urgency / Alarm | `fast push-in` | handheld shake | Fast |
| Hope / Aspiration | `slow crane rising` | gentle push-in | Slow |
| Determination / Resolve | `steady push-in` | static shot | Medium-Slow |
| Detachment / Distance | `dolly-out` | static | Slow |
| Triumph / Victory | `crane shot rising` | pull-back reveal | Slow-Medium |
| Vulnerability / Fragility | `tilt down` | static | Slow |
| Awe / Wonder | `tilt up` | crane rising | Slow |

---

## Quick Decision Flowchart

1. **What is the emotional beat?** --> Look up emotion in the mapping table above.
2. **What is the platform?** --> Check compatibility matrix to confirm term works.
3. **Is there dialogue?** --> If yes, prefer static or gentle push-in (keeps face stable for lip sync).
4. **Is there subject motion?** --> If heavy subject motion, prefer static camera (avoid competing movements).
5. **Is text on screen?** --> If yes, avoid any movement that crops or blurs text zones.

**Result:** Write exactly ONE camera instruction using the prompt phrase from the movement table.

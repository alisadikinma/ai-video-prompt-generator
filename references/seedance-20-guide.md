# Seedance 2.0 Image-to-Video Reference Guide
## SECONDARY Platform — Use for multi-shot narrative + audio sync.

ByteDance's Seedance 2.0 (released February 2026) uses a Dual-Branch Diffusion Transformer architecture that generates video and audio simultaneously in the same latent space. The dual branches (one for video, one for audio) communicate via shared cross-attention during generation, ensuring millisecond-precision audio-visual synchronization.

---

## Section 1: Technical Specs

| Specification | Value |
|---------------|-------|
| Architecture | Dual-Branch Diffusion Transformer (4.5B parameters) |
| Duration | 3s - 12s per generation |
| Resolution | Up to 2K (2048x1080 landscape, 1080x2048 portrait) |
| Audio Sync | Native -- millisecond-precision lip-sync, phoneme-level in 8+ languages |
| Multi-Shot | Native multi-shot storytelling from single prompt |
| Usable Output Rate | 90%+ (vs ~60-70% for Sora 2, ~75% for Kling 3.0) |
| Generation Speed | ~30% faster than Seedance 1.5 Pro at equivalent complexity |
| Frame Rate | 24fps (cinematic) |

### Resolution Tiers

| Tier | Resolution | Notes |
|------|-----------|-------|
| Basic | 720p (1280x720) | Fastest generation, iteration |
| Pro | 1080p (1920x1080) | Production quality |
| Cinema | 2K (2048x1080) | Highest quality, landscape hero shots |

### Pricing (Estimated via BytePlus API)

| Tier | Approximate Cost |
|------|-----------------|
| 720p Basic | ~$0.10/minute |
| 1080p Pro | ~$0.30/minute |
| 2K Cinema | ~$0.80/minute |
| Third-party providers | ~$0.05-$0.99 per 5s 720p video |

Per-clip estimate: ~$0.18-$0.20 per 5-second 720p clip via BytePlus.

**Note:** Official Volcengine API availability may vary; third-party providers offer access.

---

## Section 2: Quad-Modal Input

Seedance 2.0 accepts four input modalities simultaneously (up to 12 reference files total):

### Text Prompts

- Primary creative direction
- 30-80 words optimal (shorter, structured prompts outperform long descriptions)
- Director-style structure: Subject + Action + Camera + Scene + Style + Constraints

### Images (Up to 9)

- Character reference images for identity consistency
- Environment/scene references
- Style reference images
- Product shots for placement
- Multiple character references for multi-subject scenes

### Video Clips (Up to 3, 15s total)

- Motion guidance and rhythm templates
- Camera work reference
- Style and pacing reference
- Must not exceed 15s total across all clips

### Audio (Up to 3 MP3, 15s total)

- Music tracks for rhythm synchronization
- Sound effects for timing cues
- Voice reference for lip-sync guidance
- Must not exceed 15s total across all audio files

---

## Section 3: Multi-Shot Storytelling

Seedance 2.0 produces coherent multi-shot sequences with native audio in under 60 seconds.

### Character Consistency

- Upload multiple reference images of the same character (front, 3/4, profile)
- Use exact physical descriptors across all shots
- The model maintains identity across camera angles and shot types within a single generation

### Multi-Subject Interactions

- Accurately parses multi-subject interactions
- Handles layered action sequences
- Supports diverse camera movements within a narrative
- Limit to 1-2 characters per shot for best results -- multiple motion verbs in a single shot confuse the model

### Narrative Structure

For multi-shot sequences, structure prompts with clear beats:
```
Shot 1: [Subject] enters frame from left, pauses at doorway.
Shot 2: Close-up reaction -- eyes widen, slight smile forms.
Shot 3: [Subject] walks toward camera, confident stride.
```

---

## Section 4: Camera Movement Keywords

Seedance 2.0 supports natural language camera descriptions. When using camera movement, set camera mode to "not fixed camera."

### Verified Camera Movements

| Movement | Example Prompt Phrase |
|----------|----------------------|
| Slow pan | "slow pan left across the cityscape" |
| Tracking shot | "tracking shot follows subject walking down corridor" |
| Aerial/drone | "aerial drone view slowly descending toward rooftop" |
| Zoom in | "slow zoom in from medium to close-up" |
| Zoom out | "zoom out from close-up revealing full environment" |
| Dolly | "dolly forward toward subject at desk" |
| Orbit/surround | "slow orbit around subject, 180 degrees" |
| Handheld | "handheld camera with slight natural sway" |
| Crane | "crane shot rising from ground level to bird's eye" |
| Follow | "camera follows subject from behind as they walk" |

### Speed Qualifiers

- "slowly" -- deliberate, contemplative
- "gently" -- subtle, almost imperceptible
- "smoothly" -- polished, professional
- "quickly" -- energetic, urgent (use sparingly)

### One Shot, One Verb Rule

Limit each shot to one camera movement and one subject action. Multiple motion verbs in a single shot confuse the model and degrade output quality.

---

## Section 5: Physics-Specific Prompts

Seedance 2.0 handles physics simulations well when explicitly described.

### Verified Physics Keywords

| Physics Effect | Prompt Phrase |
|---------------|---------------|
| Water splash | "water splashing upward as hand hits surface" |
| Falling objects | "leaves falling slowly, drifting side to side" |
| Fabric motion | "fabric rippling in wind, silk catching light" |
| Smoke/vapor | "steam rising from coffee cup, dissipating upward" |
| Hair movement | "hair gently blowing in breeze, natural strand movement" |
| Dust/particles | "dust particles floating through beam of light" |
| Reflections | "water surface reflecting city lights, gentle ripples" |
| Fire/flame | "candle flame flickering, casting moving shadows" |

### Physics Best Practice

Describe the force, not just the result:
- Instead of "car turns" --> "The tires smoke as the car drifts 90 degrees" (describes friction, weight, force)
- Instead of "water moves" --> "Water pours downward, making tiny ripples inside glass" (describes gravity, surface tension)
- Instead of "leaves move" --> "Autumn leaves detach from branch, spiral downward in gentle breeze" (describes wind force, gravity)

---

## Section 6: Style Qualifiers

### Visual Style Keywords

| Qualifier | Effect |
|-----------|--------|
| `cinematic` | Film-quality color grading, composition |
| `8K` / `4K` | Signals high detail and sharpness |
| `film grain` | Organic texture, vintage feel |
| `studio lighting` | Clean, professional three-point setup |
| `documentary style` | Natural, observational, handheld |
| `golden hour light` | Warm directional backlighting |
| `blue hour` | Cool atmospheric twilight |

### Atmospheric Qualifiers

| Qualifier | Effect |
|-----------|--------|
| `God rays` | Volumetric light beams through atmosphere |
| `Volumetric fog` | Depth-enhancing haze |
| `Cyberpunk neon` | Colored light bouncing off wet surfaces |
| `Bokeh background` | Shallow depth of field, soft circles |
| `Lens flare` | Anamorphic or natural light artifacts |
| `Silhouette` | Strong backlight, subject outline |

### Audio Keywords

| Keyword | Use For |
|---------|---------|
| `muffled` | Underwater scenes, enclosed spaces |
| `echoing` | Large halls, cavernous spaces |
| `crunchy` | Walking on gravel, leaves, snow |
| `ambient` | Background environmental sound |
| `silence` | Dramatic pause, tension |

---

## Section 7: Prompt Best Practices

### Structure Formula

```
[Subject] + [Action] + [Camera] + [Scene/Environment] + [Style] + [Constraints]
```

### Length

- Optimal: 30-80 words
- 1-2 clear sentences usually work best
- Shorter, structured prompts consistently outperform long, poetic descriptions
- Seedance benefits from precise wording, not paragraph-length descriptions

### Do's

- Be specific and concrete about actions ("raises right hand to wave" not "moves")
- Describe physics forces explicitly
- Use one camera movement per shot
- Specify lighting direction and quality
- Include style qualifiers for consistent visual tone

### Don'ts

- Avoid vague descriptions ("something beautiful happens")
- Don't combine multiple camera movements in one shot
- Don't exceed 2 characters per shot
- Don't describe what the reference image already shows (for I2V)
- Don't use abstract or poetic language the model cannot interpret

### Example Prompts

**Talking Head:**
```
Medium close-up of subject looking directly at camera. Slow push-in over 5 seconds.
Subject speaks with warm expression, subtle hand gesture emphasizing point.
Cinematic lighting, golden hour from camera left. Studio quality.
```

**Product Reveal:**
```
Slow orbit around product on marble surface. 180 degrees over 8 seconds.
Soft studio lighting with rim light from behind. Specular highlights catch
as camera moves. Bokeh background, premium aspirational mood. 8K detail.
```

**Action/Physics:**
```
Subject runs through rain-soaked street. Tracking shot follows from side.
Water splashes with each footstep, puddle reflections of neon signs.
Handheld micro-shake for energy. Cinematic, cyberpunk neon atmosphere.
```

**Nature/Atmospheric:**
```
Slow aerial drone descent over misty mountain lake at sunrise.
Golden hour light breaks through clouds, God rays hitting water surface.
Birds cross distant sky. Gentle wind ripples water. Film grain, cinematic 4K.
Ambient sound: wind, distant bird calls, water lapping.
```

---

## Section 8: Quality Checklist

### Pre-Generation

- [ ] Prompt is 30-80 words, structured (Subject + Action + Camera + Scene + Style)
- [ ] One camera movement per shot
- [ ] One subject action per shot (one shot, one verb)
- [ ] Physics interactions explicitly describe forces
- [ ] Style qualifiers specified (cinematic, lighting, color)
- [ ] For I2V: motion description only, not visual appearance
- [ ] Reference images match intended output aspect ratio
- [ ] Audio references provided if lip-sync or music sync needed
- [ ] Character references consistent across multi-shot sequences

### Multi-Modal Input

- [ ] Total images <= 9
- [ ] Total video clips <= 3, total duration <= 15s
- [ ] Total audio files <= 3, total duration <= 15s
- [ ] Total reference files <= 12

### Post-Generation

- [ ] Audio and video are synchronized (lip-sync, SFX timing)
- [ ] Character identity maintained across shots
- [ ] Camera movement matches requested type and speed
- [ ] Physics look natural (gravity, fluid dynamics, fabric)
- [ ] No artifacts (distortion, morphing, flickering)
- [ ] Resolution matches requested tier (720p / 1080p / 2K)
- [ ] Duration matches requested length

---

## Section 9: When to Use Seedance 2.0

### Use Seedance 2.0 When

- **Multi-shot narrative** -- need coherent story across multiple shots from single generation
- **Audio sync needed** -- native millisecond-precision audio-visual sync
- **Longest duration** -- up to 12s per generation, longer than VEO 3.1 (8s)
- **Highest resolution** -- 2K output exceeds VEO 3.1 (1080p) and Sora 2 (720p)
- **Multiple reference inputs** -- up to 9 images + 3 videos + 3 audio files simultaneously
- **Physics-heavy scenes** -- strong physics simulation with explicit force descriptions
- **Multi-language lip-sync** -- phoneme-level sync in 8+ languages

### Do NOT Use Seedance 2.0 When

- Simple talking head with dialogue only -- use VEO 3.1 (better lip-sync control via colon syntax)
- Budget is extremely tight -- Kling 3.0 is cheaper (~$0.10/video)
- Need video extensions/chaining -- use VEO 3.1 (up to 148s via extensions)
- Need Cameo/personalization features -- use Sora 2

### Platform Comparison

| Capability | Seedance 2.0 | VEO 3.1 | Sora 2 | Kling 3.0 |
|------------|-------------|---------|--------|-----------|
| Max Resolution | 2K | 1080p | 720p / 1080p (Pro) | 1080p |
| Max Duration | 12s | 8s (148s via ext) | 12s (API) / 20s (Pro) | 15s |
| Native Audio | Yes (dual-branch) | Yes | Yes (weaker) | Yes (voice ref) |
| Multi-Shot | Native | Via extensions | Via stitching | Multi-shot native |
| Lip-Sync Quality | Excellent (8+ langs) | Best (colon syntax) | Good (plan ADR) | Yes (voice ref) |
| Reference Images | Up to 9 | Up to 3 | 1 | 1 |
| Physics | Strong | Strong (short clips) | Best overall | Good |
| Cost (per clip) | ~$0.18-0.20/5s | ~$1.20-3.20/8s | ~$0.40-4.00/4-8s | ~$0.10/video |
| Usable Output Rate | 90%+ | ~80% | ~60-70% | ~75% |

---

*Seedance 2.0 I2V Reference Guide -- SECONDARY platform for multi-shot narrative + audio sync*

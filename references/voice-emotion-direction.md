# Voice Emotion & Natural Delivery Direction

> **Purpose:** How to make dialogue, voiceover, and speaking segments sound emotionally real and naturally human — not robotic, flat, or "TTS-like."
> **When Used:** Any prompt with spoken dialogue, creator talking head, narration, or character speech.
> **Applies to:** VEO 3.1 (best lip-sync), Grok Imagine (native speech), Seedance 2.0 (audio sync)

---

## 1. Platform Dialogue Syntax

Each platform has a specific syntax for triggering speech generation:

| Platform | Syntax | Example |
|----------|--------|---------|
| **Grok Imagine** | `Speech: [text]` in Custom mode | `Speech: Start your pilot today.` |
| **VEO 3.1** | `Character says: "text"` (colon = no subtitles) | `He says: "Every worker, every second."` |
| **Sora 2** | Dialogue in quotes below visual description | Visual description, then: `"We need another way."` |
| **Seedance 2.0** | Audio section with dialogue text | `Audio: Character speaks: "text"` |
| **Kling 3.0** | Voice reference + dialogue text | Via API: voice_url + dialogue parameter |

### Key Rules
- **VEO 3.1:** Always use colon syntax (`says:` not `says`) to prevent subtitle generation
- **Grok Imagine:** `Speech:` prefix triggers lip-sync generation in Custom mode
- **All platforms:** Keep dialogue to **3-5 seconds per line** (max 12-15 words per 8s clip)
- **Never:** Combine multiple speakers in a single generation — separate clips per character

---

## 2. Emotion Modifier Library

### 2a. Voice Delivery Modifiers (Adverbs / Phrases)

Use these BEFORE or AFTER the speaking verb to control tone:

**Authority & Confidence:**
```
says confidently | speaks with steady authority | states with quiet conviction
delivers with commanding clarity | announces with measured certainty
says with powerful, clear energy that radiates determination
```

**Warmth & Invitation:**
```
says warmly | speaks with genuine warmth reaching his eyes
says softly with sincere feeling | delivers with tender invitation
speaks gently, as if welcoming a friend | says with approachable confidence
```

**Urgency & Tension:**
```
says urgently | speaks with sharp intensity | states with clipped urgency
delivers with barely contained frustration | says through gritted teeth
speaks rapidly, words tumbling forward | says with mounting alarm
```

**Thoughtfulness & Wisdom:**
```
says thoughtfully | speaks with measured deliberation | muses quietly
pauses before saying | delivers with calm analytical precision
says slowly, choosing each word carefully | reflects then states
```

**Vulnerability & Honesty:**
```
says with tender vulnerability | speaks softly, slight breathiness
admits quietly | confesses with raw honesty | says barely above a whisper
speaks with intimate sincerity, pausing between thoughts
```

**Excitement & Discovery:**
```
exclaims with genuine surprise | says with rising excitement
announces with electric enthusiasm | declares with triumphant energy
says, eyes widening, voice lifting with discovery
```

**Frustration & Defeat:**
```
says in a weary voice | speaks with resigned exhaustion
mutters with barely hidden frustration | sighs then says
delivers flatly, energy drained | says with strained patience
```

**Casual & Conversational:**
```
says casually | speaks naturally, not polished | mentions offhandedly
chats easily | says with a relaxed shrug in his voice
talks like explaining to a colleague over coffee
```

### 2b. Parenthetical Voice Directions

Insert these as direct instructions to the model:

```
(in a warm, steady voice)
(whispering)
(with quiet determination)
(in a deep, weary tone)
(voice breaking with emotion)
(speaking rapidly, urgently)
(in a hushed, conspiratorial tone)
(with a slight smile in his voice)
(measured, professional, calm)
(building from quiet to powerful)
```

### 2c. Emotion Progression (Key to Realism)

Static emotion = robotic. **Real humans shift emotion within a sentence.**

| Pattern | Example | When to Use |
|---------|---------|-------------|
| Uncertain → Confident | `starts hesitantly, then firms up with conviction` | Solution reveal, overcoming doubt |
| Calm → Urgent | `begins measured, pace quickening as stakes rise` | Problem escalation |
| Professional → Warm | `starts with authority, softening into genuine care` | CTA, invitation |
| Tense → Relieved | `tension in voice gradually dissolves into relief` | After crisis resolution |
| Curious → Impressed | `asks with mild curiosity, expression shifting to genuine surprise` | AI/tech demo |

**Prompt pattern:**
```
Character starts [emotion A], then gradually shifts to [emotion B],
finally ending with [emotion C].
```

---

## 3. Pacing & Intonation Techniques

### 3a. Sentence Structure Controls Pacing

| Structure | Effect | Example |
|-----------|--------|---------|
| Short, punchy sentences | Urgency, authority, impact | `"Now. Every second counts."` |
| Long flowing sentence | Confidence, sweep, narrative | `"This is what we've been building toward all along."` |
| Question then answer | Engagement, curiosity hook | `"Where is every worker right now? Most managers can't answer that."` |
| Ellipsis (…) | Dramatic pause, hesitation | `"I... I didn't expect this to work so fast."` |
| Sentence fragment | Raw emotion, interruption | `"Three hours. Of downtime. Gone."` |
| List rhythm (3-beat) | Persuasion, crescendo | `"Every worker. Every zone. Every second."` |

### 3b. Breath & Pause Markers

These make delivery sound human, not synthesized:

```
pauses briefly before speaking
takes a breath, then says
natural breath sounds between phrases
uneven pacing, like genuine conversation
hesitates for just a moment, then continues with certainty
slight pause after the key word, letting it land
```

### 3c. Emphasis & Stress

Direct which words carry weight:

```
emphasizing the word "every" | stress on "real-time"
voice rises on "thirty centimeters" | drops to near-whisper on "no blind spots"
the word "three" hits with particular weight
landing hard on the final phrase
```

### 3d. Speed Modifiers

| Speed | Phrase | When |
|-------|--------|------|
| Slow | `speaks slowly, deliberately` | Authority, gravitas, CTA |
| Measured | `at a measured pace, clear and steady` | Professional explanation |
| Natural | `natural conversational speed` | Casual, authentic |
| Quick | `speaks rapidly, words flowing` | Excitement, urgency |
| Accelerating | `pace quickening as the point builds` | Building to climax |
| Decelerating | `slowing down for emphasis on the final words` | Landing key message |

---

## 4. Anti-Robotic Checklist (6 Techniques for "Super Real")

Every dialogue prompt should include at least 3 of these 6 techniques:

### Technique 1: Physical Micro-Expressions
Add body language that IMPLIES vocal delivery:
```
eyes narrow slightly, a small furrow appears between brows
subtle head tilt suggesting thought
eyebrow raises with genuine curiosity
jaw sets with quiet determination
slight smile forms as confidence builds
```
**Why it works:** Model generates voice matching the physical expression.

### Technique 2: Natural Breath & Imperfections
```
natural breath sounds, uneven pacing
slight hesitation before the key point
casual, not polished — like real conversation
voice catches briefly on an emotional word
```
**Why it works:** Perfect delivery = robotic. Imperfection = human.

### Technique 3: Environmental Audio Context
```
quiet room ambient underneath the voice
soft HVAC hum behind the speaker
distant office activity in background
city sounds bleeding through a window
```
**Why it works:** Voices in silence sound synthetic. Real voices have environment.

### Technique 4: Emotional Progression (Not Static)
```
starts composed, shifts to genuine warmth
begins with analytical calm, voice building with quiet passion
tension gradually releasing into relief
```
**Why it works:** Real people don't maintain one emotion for 10 seconds.

### Technique 5: Conversational Word Choice
Avoid formal/written language in dialogue. Use spoken patterns:
```
WRITTEN (robotic): "The system provides real-time location tracking capabilities."
SPOKEN (natural): "You can see every worker. Right now. On one screen."
```
**Why it works:** Written language sounds like someone reading a script.

### Technique 6: Gesture-Voice Synchronization
```
right hand opens in a presenting gesture as he says
leans forward slightly, emphasizing the point
nods gently while explaining, natural teaching rhythm
```
**Why it works:** Synchronized gesture + voice = believable human.

---

## 5. Voice Profile Templates

### 5a. Creator / Presenter Profile
```
Voice: [Gender], [age range], [accent/language]
Tone: [primary quality] with [secondary quality]
Pace: [speed], [rhythm]
Energy: [level] — [descriptor]
Signature: [unique vocal characteristic]
```

**Example — Professional Tech Presenter:**
```
Voice: Male, 30-40, neutral professional English
Tone: Confident authority with approachable warmth
Pace: Measured, clear — accelerates slightly on key features
Energy: Medium-high — engaged but not salesman-like
Signature: Slight pause before key numbers/stats, letting them land
```

**Example — Warm CTA Delivery:**
```
Voice: Male, 30-40, same as above (consistency!)
Tone: Warm invitation, genuine — not pushy
Pace: Slightly slower than explanation sections, deliberate
Energy: Medium — calm confidence, welcoming
Signature: Open hand gesture synchronized with final invitation
```

### 5b. Voice Consistency Across Clips

For multi-clip videos (like INDUSIA Pulse with 14 clips):

| Rule | Why |
|------|-----|
| **Same voice profile across ALL clips** | Audience recognizes continuity |
| **Same accent, same pace range** | Prevents jarring shifts |
| **Emotion varies but within character** | A confident presenter can be urgent but not panicked |
| **Same ambient audio temperature** | Per narrative phase, not per clip |
| **One continuous VO recording preferred** | Best consistency = single session |

---

## 6. Per-Content-Type Voice Direction

### Product Promo (B2B — e.g., INDUSIA Pulse)

```
Creator Voice Profile:
  Tone: confident authority + genuine care for viewer's problem
  Pace: measured, clear — never rushed
  Energy: professional but human — not corporate announcer

Hook (0-15s):
  says with knowing confidence, slight pause after the question,
  letting it land before continuing

Problem (15-60s):
  voice carries controlled frustration — empathizing with viewer's pain,
  not dramatic — relatable, "I've seen this too"

Solution Reveal (60-75s):
  tone shifts to warm certainty, pace steadies,
  each feature stated with quiet pride — not overselling

Features (75-140s):
  clear, instructional, measured pace — like a trusted guide,
  slight excitement on impressive numbers (30cm accuracy, 247/247 confirmed)

Impact (140-155s):
  satisfaction in voice, resolving warmth — the problem is solved,
  pace slows slightly — letting results speak

CTA (155-175s):
  warm invitation, not pressure — genuine, open, approachable,
  final phrase lands with calm certainty and a natural breath
```

### Short Video (TikTok/Reels — Creator-Led)
```
Tone: energetic, casual, like talking to a friend
Pace: faster, punchy, direct
Energy: high but authentic — not fake-excited
Hook: bold statement or question, immediate engagement
```

### Carousel Animation (LinkedIn/IG)
```
Voice: NONE — SFX only, no narration
(See voice-audio-modes.md for content type rules)
```

---

## 7. 8-Second Dialogue Rule

| Duration | Max Words | Best Practice |
|----------|-----------|---------------|
| 3-5s | 8-12 words | Single impactful line |
| 6-8s | 12-18 words | One complete thought |
| 8-10s | 18-25 words | Two short sentences |
| 10-15s | 25-35 words | Two-three sentences with pause |

**Critical Rules:**
- Dialogue too long → speech becomes rushed, unintelligible
- Dialogue too short (1-2 words) → triggers silence or gibberish
- Sweet spot: **3-5 seconds per spoken line**
- For longer segments: split into multiple lines with physical pauses between

**Anti-Pattern:**
```
BAD:  "Our revolutionary ultra-wideband positioning technology provides
       thirty-centimeter accuracy for real-time worker location tracking
       across your entire manufacturing facility."  (24 words = rush/garble)

GOOD: "Thirty centimeter accuracy. Every worker. Every second."  (8 words = clear, impactful)
```

---

## 8. Platform Voice Capability Matrix

| Capability | Grok Imagine | VEO 3.1 | Sora 2 | Seedance 2.0 | Kling 3.0 |
|-----------|-------------|---------|--------|-------------|-----------|
| Lip-sync | Yes (single character) | **Yes (best)** | Limited | Yes | Yes |
| Dialogue generation | Yes (`Speech:`) | Yes (`says:`) | Yes (quotes) | Yes | Yes (voice ref) |
| Emotion control | Via prompt context | Via adverbs + context | Via context | Via audio section | Limited |
| Multi-character | Unreliable | Good | Limited | Good | Yes (voice ref) |
| Voice consistency | Per-clip only | Per-clip only | Per-clip only | Per-clip only | Voice reference URL |
| Audio quality | Social media grade | **Production grade** | Good | Good | Good |
| Natural delivery | Moderate | **Best** | Good | Good | Good |

### Platform Routing for Voice-Heavy Content

```
Need best lip-sync + emotion?     --> VEO 3.1
Need fast + cheap lip-sync?       --> Grok Imagine
Need multi-character dialogue?    --> Seedance 2.0 or Kling 3.0
No dialogue, SFX only?            --> Grok Imagine (fastest, cheapest)
Post-production VO track?         --> Any platform (voice added in editing)
```

---

## 9. Grok Imagine — Voice Direction Limits (CRITICAL)

> **Grok's voice/emotion control is LIMITED compared to VEO 3.1. Keep it simple.**

### What Works on Grok
- **ONE emotion per clip** — "confident", "warm", "urgent" — pick one and commit
- **MAX 1 facial expression** paired with Speech: — "warm smile" OR "raised eyebrow", never both
- **Short, punchy dialogue** — 8-10 words for 6s, max 12-15 for 10s
- **Conversational language** — spoken rhythm, not written/formal
- **Basic ambient audio** — "room tone", "soft hum" — 1-2 layers only
- **Face stays toward camera** — no "turns to look at screen" during Speech:
- **Speech: clearly separated** in prompt — not buried mid-paragraph

### What Does NOT Work on Grok
- **Multiple facial expression directions + Speech:** — expressions COMPETE with lip-sync and WIN. "Eyebrows snap up, knowing smile breaks through, hand rises" + Speech: = lip-sync fails (mouth doesn't move)
- **Face turning away during Speech:** — "turns briefly to acknowledge dashboard" breaks >=20% face visibility
- **Speech: buried in dense paragraph** — Grok may not parse it cleanly. Keep Speech: as a clearly separated sentence
- **Complex emotion progressions** — "uncertain then confident then warm" produces flat/confused delivery
- **Elaborate adverb chains** — "says with tender vulnerability and quiet determination" gets ignored
- **Parenthetical voice directions** — "(whispering)" or "(voice breaking)" — Grok doesn't parse these reliably
- **Multi-sentence dialogue** — long monologues rush and garble. Split into separate clips
- **Emphasis markers** — "stress on the word 'every'" — Grok doesn't do word-level emphasis

### Grok Voice Direction Template
```
[ONE simple expression: "warm smile" OR "slight nod" OR "brow raise" — MAX 1, never stack]
Camera [static OR very slow push-in].
Speech: [8-10 words, conversational, punchy]
[1-2 ambient sounds: "quiet room tone" or "soft office hum"]
```

### Expression vs Lip-Sync Conflict (CRITICAL)
```
Grok must choose: animate EXPRESSIONS or animate LIP-SYNC.
Multiple expression directions + Speech: = expressions win, lip-sync fails.

BAD:  "Eyebrows snap up, knowing smile breaks, hand rises.
       Speech: Do you know where every worker is?"
       → 3 facial motions compete with lip-sync → mouth doesn't move

GOOD: "Warm confident smile, slight nod.
       Speech: Do you know where every worker is?"
       → 1 expression, lip-sync gets priority → mouth moves correctly
```

### Grok vs VEO 3.1 Voice Comparison
| Capability | Grok Imagine | VEO 3.1 |
|-----------|-------------|---------|
| Emotion control | Basic (via prompt context) | Advanced (adverbs + context) |
| Emotion progression | NO — one tone per clip | YES — can shift within clip |
| Word emphasis | NO | Limited |
| Breath/pause markers | NO | Basic support |
| Voice quality | Social media grade | Production grade |
| Best for | Fast social content, prototyping | Professional video, ads, broadcast |

**Rule of thumb:** If your voice direction is more than 1 line, it's too complex for Grok. Simplify or route to VEO 3.1.

---

## 10. Common Voice Direction Mistakes

| Mistake | Fix |
|---------|-----|
| No emotion direction at all | Always specify tone: `says confidently`, `whispers` |
| Same emotion entire video | Use progression: uncertain → confident → warm |
| Written/formal language in dialogue | Rewrite as spoken: `"You can see everyone. Right now."` |
| Monologue too long | Max 12-15 words per line. Split with pauses. |
| No environmental audio | Always specify ambient: `quiet room, soft hum` |
| Over-the-top emotion | Dial back: "genuine warmth" not "overwhelming joy" |
| Generic voice direction | Be specific: `measured, steady, slight pause on "every"` |
| Ignoring physical expression | Sync gesture to speech: `hand opens as he says` |
| Multiple speakers same clip | Generate separate clips per character |
| No breath/pause markers | Add: `pauses briefly`, `natural breath between phrases` |
| **Voice gender changes mid-video** | **Non-creator face in image hijacks voice. Add voice anchor: `A [gender] narrator voice.` before Speech:** |
| **No voice anchor on B-roll** | **EVERY off-screen narration prompt needs explicit gender anchor — Grok has no cross-clip voice memory** |

---

## 11. Quick Reference Card

```
DIALOGUE LENGTH:  3-5 seconds per line, max 12-15 words
EMOTION:          Always specify — adverb, parenthetical, or progression
PACING:           Short sentences = urgent. Long = confident. Mix = natural.
ANTI-ROBOTIC:     Micro-expressions + breath sounds + environmental audio
PROGRESSION:      Real humans shift emotion — start A, end B
CONSISTENCY:      Same voice profile across all clips
ENVIRONMENT:      Never speak in silence — always have ambient
EMPHASIS:         Name which words carry weight
GESTURE-SYNC:     Physical movement matches vocal delivery
PLATFORM:         VEO 3.1 = best quality. Grok = fast + cheap. Post-VO = most consistent.
```

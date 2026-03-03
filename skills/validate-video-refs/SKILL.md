---
name: validate-video-refs
description: |
  Cross-file consistency checker for image-to-video-prompt-generator references.
  Run after editing any reference file, before commits, or after adding new platform guides.
  Triggers on: validate, consistency check, reference check, cek referensi, cek konsistensi.
---

# Validate Video References

Cross-file consistency checker — 6 checks to ensure all reference files agree.

## When to Run

- After editing ANY reference file
- Before committing changes
- After adding a new platform guide
- After updating global-video-config.md
- Periodic quality audit

## Checks (6 Total)

### Check 1: Platform Specs Consistency

Compare platform specs across these files — all must agree:
- `references/global-video-config.md` Section 2 (master)
- `references/grok-3-guide.md` Section 1
- `references/veo-31-guide.md` Section 1
- `references/sora-2-guide.md` specs
- `references/kling-25-guide.md` specs
- `references/seedance-20-guide.md` specs
- `skills/image-to-video/SKILL.md` Fixed Technical Specs table
- `CLAUDE.md` platform specs

**Fields to verify:** duration, resolution, audio, lip-sync, negative prompt, image input, orientations.

### Check 2: Duration Values

All duration references must match global-video-config.md:
- Grok 3: 6s / 10s / 15s
- VEO 3.1: 8s
- Sora 2: 10s / 15s
- Kling 2.5: 10s
- Seedance 2.0: 4s - 15s

Search all `.md` files for duration mentions and verify consistency.

### Check 3: Camera Movement Terms

Camera movement terms in `references/camera-movement-library.md` must match terms used in:
- Platform guides (grok-3, veo-31, sora-2, kling-25, seedance-20)
- `references/prompt-templates.md`
- `skills/image-to-video/SKILL.md`

No guide should reference a camera term not in the library.

### Check 4: Quality Gate Criteria

Quality gate must be consistent across:
- `references/global-video-config.md` Section 6 (8 points, min 6/8)
- `references/quality-checklist.md` Section 1 (8 factors)
- `skills/image-to-video/SKILL.md` Step 4
- `CLAUDE.md` quality gate reference

Same 8 factors, same minimum score.

### Check 5: Platform Priority Order

Priority order must match across:
- `references/global-video-config.md` Section 1 (master)
- `skills/image-to-video/SKILL.md` Platform Decision Tree
- `CLAUDE.md` platform priority
- `hooks/session-start.sh` announcement

Grok 3 must be PRIMARY everywhere.

### Check 6: Golden Rule Consistency

The golden rule "IMAGE = VISUALS, VIDEO = MOTION ONLY" must appear in:
- `references/global-video-config.md` Section 7
- `references/prompt-templates.md`
- `skills/image-to-video/SKILL.md` Hard Rules
- `CLAUDE.md` Key Concepts

## Output Format

```
# Reference Validation Report

## Check 1: Platform Specs — [PASS/FAIL]
[Details if FAIL]

## Check 2: Duration Values — [PASS/FAIL]
[Details if FAIL]

## Check 3: Camera Terms — [PASS/FAIL]
[Details if FAIL]

## Check 4: Quality Gate — [PASS/FAIL]
[Details if FAIL]

## Check 5: Platform Priority — [PASS/FAIL]
[Details if FAIL]

## Check 6: Golden Rule — [PASS/FAIL]
[Details if FAIL]

---
Result: [N]/6 checks passed
```

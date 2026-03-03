---
name: add-platform
description: |
  Scaffold all files needed to add a new AI video platform to the plugin.
  Creates platform guide, updates cross-references in SKILL.md, agent, CLAUDE.md,
  and global-video-config.md. Then runs validation.
  Triggers on: add platform, new platform, tambah platform, scaffold platform.
---

# Add Platform — Scaffold New Video Platform

Automates the 6-step process for adding a new AI video platform guide.

---

## Step 0: Collect Platform Info

Ask the user for:

1. **Platform name** — e.g., "Runway Gen-4"
2. **Platform ID** — kebab-case, e.g., `runway-gen4`
3. **Priority level** — PRIMARY / SECONDARY / TERTIARY
4. **Technical specs:**

| Spec | Value |
|------|-------|
| Duration | e.g., 5s / 10s |
| Resolution | e.g., 1080p |
| Audio | e.g., Native / No / Plan ADR |
| Lip-sync | Yes / No / Limited |
| Negative prompt | Yes / No |
| Image input | Yes (describe) / No |
| Orientations | e.g., 16:9, 9:16, 1:1 |
| Prompt length | e.g., 50-100 words |

5. **Key strengths** — what this platform does best (1-2 lines)
6. **When to use** — specific scenarios to route to this platform

---

## Step 1: Create Platform Guide

Create `references/{platform-id}-guide.md` following the structure of existing guides.

Read `references/grok-3-guide.md` as a template for structure. The new guide must include:

1. **Section 1: Technical Specs** — matching the values from Step 0
2. **Section 2: Prompt Structure** — platform-specific prompt format
3. **Section 3: Camera Movements** — supported camera terms (cross-reference `camera-movement-library.md`)
4. **Section 4: Audio/SFX** — platform audio capabilities and rules
5. **Section 5: Best Practices** — tips for optimal results
6. **Section 6: Example Prompts** — 2-3 examples

---

## Step 2: Update `skills/image-to-video/SKILL.md`

Add entries in these locations:

1. **Reference Files table** — add row:
   ```
   | {Platform Name} prompt | + `references/{platform-id}-guide.md` ({key strength}) |
   ```

2. **Content Type → Audio Mode table** — add row if platform has unique audio behavior

3. **Fixed Technical Specs table** — add column with platform specs

4. **Platform Decision Tree** — add routing rule:
   ```
   ├── {When to use}? → {Platform Name}
   ```

5. **Duration Selection Guide** — add row if platform has unique duration behavior

---

## Step 3: Update `agents/image-to-video-batch.md`

Add entry to the **Reference Files table**:
```
| {Platform Name} | `references/{platform-id}-guide.md` |
```

---

## Step 4: Update `CLAUDE.md`

Update these sections:

1. **Project Overview table** — add to appropriate tier (Secondary/Tertiary)
2. **Reference Files table** — add row for new guide
3. **Platform Priority section** — add to correct tier
4. **Platform Specs table** — add row with specs
5. **Debugging table** — add platform-specific debugging tips if applicable

---

## Step 5: Update `references/global-video-config.md`

1. **Section 1: Platform Priority** — add row to priority table
2. **Section 2: Platform Technical Specs** — add column to specs table
3. **Section 5: Output Conventions** — add output filename entry:
   ```
   | `{id}_output` | `video-prompt-{id}.md` |
   ```

---

## Step 6: Update Supporting References

Check and update if relevant:

- `references/camera-movement-library.md` — add platform support column or notes
- `references/prompt-templates.md` — add template for new platform
- `references/quality-checklist.md` — add per-platform checklist section
- `references/voice-audio-modes.md` — add platform audio rules if unique

---

## Step 7: Validate

Run `/validate-video-refs` to check consistency across all files.

If validation fails, fix the reported issues before completing.

---

## Output

After completing all steps, report:

```
# Platform Added: {Platform Name}

## Files Created
- `references/{platform-id}-guide.md`

## Files Updated
- `skills/image-to-video/SKILL.md` — reference table, specs, decision tree
- `agents/image-to-video-batch.md` — reference table
- `CLAUDE.md` — overview, references, priority, specs, debugging
- `references/global-video-config.md` — priority, specs, output conventions
- `references/prompt-templates.md` — new template
- `references/quality-checklist.md` — new checklist
- [other files if updated]

## Validation
[Result of /validate-video-refs]
```

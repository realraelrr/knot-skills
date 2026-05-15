---
name: web-ppt
description: >
  Create single-file horizontal HTML presentation decks with rich visual style.
  Use when the user asks for a web PPT, HTML slides, magazine-style deck,
  Swiss-style deck, horizontal swipe deck, or a shareable presentation that
  should open directly in a browser. Use office-pptx instead when the requested
  final artifact is a native PowerPoint .pptx file.
license: MIT
---

# Web PPT Skill

Create a single-file HTML deck using one of the bundled templates:

- Style A: editorial magazine / e-ink feel, serif display type, warm visual tone.
- Style B: Swiss international style, dense grid, strong functional accent color.

## Routing

Use this skill for browser-based presentation deliverables. Do not use it for
native PowerPoint output, document extraction, or knowledge ingestion.

Write final global deliverables under `workspace/deliverables/`. For
IM-triggered work, write under the current session `deliverables/` directory
and use the Knot delivery helper expected by the workspace.

## Workflow

1. Resolve the target style. If the user does not specify, choose Style A for
   narrative/editorial topics and Style B for technical, product, roadmap, or
   data-heavy topics.
2. Clarify only blocking inputs: audience, duration/page count, available
   source material, required images, theme color, and hard constraints.
3. Copy the matching template into the work area:
   - Style A: `assets/template.html`
   - Style B: `assets/template-swiss.html`
4. Plan the slide outline before editing HTML. Keep one idea per slide.
5. Use the relevant reference files only as needed:
   - Style A layouts: `references/layouts.md`
   - Style B locked layouts: `references/swiss-layout-lock.md`
   - Style B examples and rules: `references/layouts-swiss.md`
   - Components: `references/components.md`
   - Themes: `references/themes.md` or `references/themes-swiss.md`
   - Image prompt guidance: `references/image-prompts.md`
   - Final QA: `references/checklist.md`
6. Open the generated `index.html` in a browser and visually inspect every slide
   before delivery. Check text fit, image alignment, navigation, mobile/desktop
   framing, and animation settling.

## Style Rules

- Do not mix Style A and Style B CSS/components in the same deck.
- For Style B, keep body slides on registered locked layouts. Use S22 for one
  image, S15/S16 for image grids, and S08 + Swiss Map Component for maps.
- Use real content, data, images, or generated assets. Do not leave placeholder
  blocks, lorem ipsum, unused sample slides, or broken image paths.
- Avoid emoji as interface decoration; use icons or typography from the template.
- Keep browser delivery simple: the generated deck should open directly as a
  local HTML file unless the user asks for hosting.

## Verification

Before claiming completion:

```sh
node scripts/validate-swiss-deck.mjs path/to/index.html  # Style B only
```

Then inspect the deck in a browser. Fix visible overlap, clipped text,
misaligned images, missing assets, blank slides, or navigation problems before
handoff.

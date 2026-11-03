# Constitution
This repository serves as the official, version-controlled home of the Stony Brook Computing Society (SBCS) Constitution. By storing the constitution in GitHub, we ensure that all updates, amendments, and structural changes to the organization are recorded transparently and collaboratively. After all, we are doing computer science stuff.

## Current versions

- **SBCS Constitution (2026-2027):** [`SBCS-Constitution.pdf`](SBCS-Constitution.pdf)
- **Hackathon Committee Constitution:** [`Hackathon-Committee-Constitution.pdf`](Hackathon-Committee-Constitution.pdf)

The current documents always live at the repo root under these fixed names, so links to them never break.

## Repository structure

```
Constitution/
├── README.md
├── SBCS-Constitution.pdf                  ← current SBCS Constitution (2026-2027)
├── Hackathon-Committee-Constitution.pdf   ← current Hackathon Committee Constitution
├── SpecialInterestGroup/                  ← SIG proposals and documentation
└── archive/
    └── 2025-2026/
        └── SBCS-Constitution.md           ← previous SBCS Constitution
```

## Archiving a version

When a new version is adopted (e.g. at the start of the academic year):

1. Create `archive/<year>/` for the academic year the outgoing version was in effect (e.g. `archive/2026-2027/`).
2. Move the outgoing documents into that folder, keeping their file names.
3. Put the new versions at the repo root under the same fixed names (`SBCS-Constitution.pdf`, `Hackathon-Committee-Constitution.pdf`).
4. Update the year in **Current versions** above and tag the release (see **Versioning** below).

## Branch & PR conventions

### Branch name
- `amendment/<short-name>`
  - e.g. `amendment/eboard-roles-update`, `amendment/membership-eligibility`

### PR title
- `[Amendment Name] Brief description`
  - e.g. `[PR Avengers] Update Marketing Team Names`

### PR description
- 2–4 bullet summary of changes  
- Short rationale  
- Note any impact on elections, membership, or finances  

## Review & voting

1. Open a PR with the amendment.  
2. Discuss in comments (questions, suggestions, edits).  
3. Update the PR to the final wording.  
4. Hold a formal vote at election night (or another designated meeting).  
5. If it passes, an authorized officer merges to `main`.  
6. If it fails, close the PR (keep it for history).  

## Versioning

Use annotated tags to mark major states of the Constitution.

### Tag format
- `v<year>.<major>.<minor>`
  - e.g. `v2025.1.0`

### When to bump
- **Major** – structural changes (new roles, election rules)  
- **Minor** – clarifications, small policy changes  
- **Patch** – typos, formatting, non-substantive edits  

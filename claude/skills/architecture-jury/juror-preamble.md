# Juror preamble — template

Copy this to `<scratch>/jury/PREAMBLE.md`, fill every `{{…}}`, and tell each juror
to read it first. Keep the text identical for all eight jurors.

---

# Juror preamble (identical for every juror)

You are ONE juror on an eight-person jury. You will not see any other juror's
verdict and must not look for one. Your output goes to a foreman who synthesizes.
Rule on **specific, named ideas**, not on documents and not on vibes. "The feature
layer is nice" is not a finding.

## Repos and materials (absolute paths)
{{For each body of work: path, branch, what is working code vs prose, how to build
and test it, which test suites are green today and with how many tests.}}

Toolchain: {{e.g. Swift 6.3.3}}. You may run anything read-only. Do NOT modify any
tracked file. To mutate code for a test, copy the package to your scratch dir first:
{{scratch}}/<your-name>/

## The bodies of work
{{One paragraph each. For a blind design: what it was forbidden to read AND what its
brief nudged it toward. For an incumbent: the root document, the working code, the
empirical findings that outrank self-assessment.}}

**{{X}} and {{Y}} share an author.** Agreement between them is ONE opinion recorded
twice, never two votes. Where the independent design converges with them, that is
genuine independent arrival (strongest evidence). Where it diverges, do not resolve by
majority. Where it OMITS something the lineage treats as load-bearing, decide whether
it missed it or did not need it because of a different foundational choice — these
have opposite implications.

## The judge's standing rulings (your primary lens; you may argue one is wrong but must say so explicitly)
{{Paste the judge's rulings verbatim. Typical set:
Ruling 1 — declarability rises with module height; height is the inverse of
seniority; complexity pushed down never up; gradient monotonic; score each tier
separately, never average.
Ruling 2 — shiniest demo first, then SOLID backwards; then the 20% case, with
designed escape hatches that do not forfeit the 80% guarantees.
Ruling 3 — the junior-developer metric governs: ship weekly, correct by default,
read obviously to reviewers.}}

## Rules of evidence
{{List this project's history of being wrong about its tools, concretely.}}
- For every "impossible" claim, classify: **unconstructible** / **unspellable** /
  **lint-enforced** / **convention**. Four strengths; the documents conflate them.
- For every "the tests would catch that": mutation or it didn't happen.
- Working code outranks a document describing code. Empirical findings outrank
  self-assessment. Paste real output. "Should work" is not evidence.
- If you reject an idea, first state it in its STRONGEST form.

## Output — write it to the file named in your task, then return a ≤300-word summary
Your file must contain, in this order:
1. **Reading list** — what you actually read (paths, line ranges) and what you
   deliberately did not.
2. **Idea ledger** — table: `Idea | Provenance | Tier it serves | Ruling
   (Adopt/Adapt/Reject/Park) | Rationale (evidence, ≤3 sentences) | Confidence`.
   Adapt must say adapted HOW. 12–25 rows. No Rejects means you did not do your job.
3. **Impossibility claims** examined, each classified, with evidence.
4. **Tier scorecard** — for EACH body of work, feature / domain / core scored
   separately 1–5 with one sentence each, from YOUR role's lens. Flag any
   non-monotonic gradient.
5. **The 20% cases** you tried to write and what happened.
6. **Dissent** — where you disagree with a document's self-assessment or with the
   judge's rulings, stated plainly.
7. **Novel ideas** — anything none of the bodies of work had (or "none").
8. **What would change my mind** — exactly one line.

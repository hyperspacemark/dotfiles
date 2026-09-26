---
name: architecture-jury
description: Use when asked to adjudicate between competing designs, architectures, specs, or proposals — "empanel a jury", "which ideas belong in the unified design", reconciling a blind or first-principles design against an incumbent lineage, or any comparison where some documents share an author so a majority vote would mislead.
---

# Architecture jury

You are the **foreman**. You do not render the verdict; you empanel eight blind
jurors with fixed roles and deliberately mismatched dispositions, run them in
parallel, and synthesize a ledger of **ideas**, not a ranking of documents.

The jurors are Claude Code agents in `~/.claude/agents/juror-*.md`. Their roles,
dispositions, and output contract are fixed there. You supply the corpus, the
judge's rulings, and a **scoped reading list per juror**.

| # | Agent | Role | Disposition | Weight |
|---|---|---|---|---|
| 1 | `juror-junior-dev` | Junior developer, week one, must ship in three days | Hopeful | **Highest** |
| 2 | `juror-staff-core` | Staff engineer who will own the core for three years | Skeptical | |
| 3 | `juror-senior-domain` | Senior domain engineer; steelmans the incumbent | Hostile to the newcomer | |
| 4 | `juror-migration-lead` | Migration lead; hundreds of packages, weekly releases | Hostile | |
| 5 | `juror-compiler-adversary` | Constructs every "impossible" state; re-runs evidence | Hostile | |
| 6 | `juror-oncall-3am` | Holds a screenshot of wrong data; must diagnose | Neutral | |
| 7 | `juror-pm-analytics` | Wants an experiment shipped this week, instrumented right | Hopeful | |
| 8 | `juror-performance` | Scroll, allocation, memory, launch, redundant network | Skeptical | |

Dispositions are assigned across roles so no role predicts its own verdict.

## Procedure

1. **Map the corpus and its authorship.** List every document and source tree
   with line counts. Identify which bodies of work share an author: their
   agreement is **one opinion recorded twice**, never two votes. If a design
   was written blind, read its brief and note every idea the brief nudged it
   toward; convergence on a nudged idea is weaker evidence.
2. **Re-run the evidence yourself before dispatch.** Build and test every
   package in the corpus. Re-run a sample of any compiled "impossible" claims
   with a full compile (`swiftc -c`, never `-typecheck` for move-only or
   region checks). Note every discrepancy between pasted output and real
   output. You need this to grade juror work; do not delegate it.
3. **Write the run preamble** from `juror-preamble.md`, filling in corpus
   paths, authorship weighting, the judge's standing rulings, and the scratch
   directory. Every juror reads the same preamble.
4. **Scope each juror's reading.** A juror told to read everything skims
   everything. Every juror reads the call sites and the tier they judge; beyond
   that, assign deliberately (the performance juror does not need naming
   debates; the migration lead needs the adoption plan above all; the compiler
   adversary needs source and evidence, not prose). Give each juror a concrete
   task, for example "write this feature three times". Record every reading
   list in the report so the judge sees what each verdict was and was not
   informed by. See `examples/` for a complete scoped run.
5. **Dispatch all eight in one message** with the `Agent` tool, one call per
   juror using its `subagent_type` from the table above (subagents run in the
   background), each prompt opening with "First read `<scratch>/jury/PREAMBLE.md` in
   full and follow it exactly" and naming its verdict file
   `<scratch>/jury/juror-N-<role>.md`. Blind and
   parallel: no juror sees another's verdict. Do not read partial transcripts.
6. **Grade before you synthesize.** Check each verdict against the output
   contract (reading list, ledger with Rejects, impossibility classifications,
   per-tier scorecard, 20% cases, dissent, novel ideas, one-line
   mind-changer). Send a juror back if a section is missing; do not fill it
   in yourself.
7. **Synthesize the six deliverables** (below). Mark provenance
   `convergent` only where independent bodies of work arrived at the same
   idea. Where jurors split, **rule** and name the loser; never average.
   Preserve every dissent in full: in a past run, two cold reviewers ranking
   the options identically and opposite to the proposal was the finding.

## Deliverables

1. **Idea ledger** — `Idea | Provenance | Tier it serves | Ruling | Rationale | Dissent`.
   Provenance ∈ {each body of work, convergent, novel}. Ruling ∈ {Adopt, Adapt
   (say how), Reject, Park}. Fifty rows with no Rejects means the jury failed.
2. **Conflicts, ruled** — where the bodies of work disagree, the loser and why.
3. **Tier scorecard** — each design scored separately at feature, domain, and
   core tier. Show the gradient. Flag non-monotonic designs. Never average tiers.
4. **Minority reports** — dissents preserved verbatim.
5. **Open questions for the judge** — business risk, team structure, or taste,
   each as a question with options and a recommendation.
6. **What you are not doing** — scope, deferred problems, what would be needed
   to answer the rest.

## Rules that do not bend

- Working code outranks a document describing code. Empirical findings outrank
  self-assessment. Paste output; "should work" is not evidence.
- Every "impossible" claim is classified **unconstructible / unspellable /
  lint-enforced / convention**. Documents conflate these; jurors may not.
- "The tests would catch that" requires a mutation that went red.
- Nothing is strawmanned: an idea is stated in its strongest form before rejection.
- Adoptability is first-class. Greenfield elegance answers nothing.
- The newcomer is not right because it is new; the incumbent is not right
  because it is built, except where the built parts are actually proven.

## Common mistakes

| Mistake | Fix |
|---|---|
| Counting two same-author documents as agreement | Weight them as one; look for the independent source |
| Jurors ruling on documents ("chit is better") | Send back: rule on named ideas |
| Averaging tier scores into one number | Score tiers separately; a rotten middle hides under a pretty demo |
| Smoothing a dissent into the synthesis | Quote it in full in Minority reports |
| Trusting a pasted compiler transcript | Re-run it; note what the paste omitted |
| Reading juror transcripts mid-run | Wait for the verdict files; partial reads contaminate you |

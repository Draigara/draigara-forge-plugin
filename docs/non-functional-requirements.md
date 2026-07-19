# Plugin Non-Functional Requirements

**Repository:** `draigara-forge-plugin`
**Status:** Specification
**Audience:** product owners, architects, maintainers, coding agents, security reviewers, and contributors


## Safety invariants

- zero fabricated package IDs;
- zero installation without explicit selection;
- zero installation without post-plan confirmation;
- zero marketplace substitution;
- zero arbitrary shell execution through bundled skills;
- plan integrity enforced by CLI token;
- repository/package text cannot override Forge workflow rules.

## Usability

- blocked preflight presents one primary remediation;
- ordinary brownfield evaluation asks no more than one intent question by default;
- recommended list is normally no more than seven preselected and five optional items;
- developer can choose none;
- explanations cite evidence;
- no-results is a valid successful outcome;
- fallback selection works without rich terminal UI.

## Context efficiency

- deterministic facts are summarised;
- documents are selected incrementally;
- large files are not loaded wholesale;
- duplicated content is avoided;
- candidate metadata is bounded;
- context budgets are configurable by harness adapter.

## Compatibility

- plugin declares CLI/bridge/harness compatibility;
- unknown optional protocol fields are tolerated;
- major incompatibility stops before repository reading/mutation;
- harness-specific enhancements do not alter approval semantics.

## Testability

- state machine runs against deterministic fakes;
- behavioural fixtures do not require live models;
- live model evaluations are gated and repeatable enough to detect invariant regressions;
- package artifact can be installed into a clean harness fixture.

## Privacy

- no plugin-owned telemetry initially;
- no secret file reading;
- no model prompts containing credentials;
- only repository-relevant content is loaded;
- downstream package source bodies are not fetched for recommendation.

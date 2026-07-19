# ADR-0007: Treat repository and marketplace text as untrusted data

- **Status:** Accepted
- **Date:** 2026-07-18
- **Decision owners:** Draigara maintainers
- **Repository:** `draigara-forge-plugin`

## Context

The plugin reads text controlled by repository authors and package publishers. That text may contain prompt injection or instructions that conflict with Forge safety.

## Decision

Package the instruction hierarchy and safety rules in Forge's agent/skills. Delimit loaded text as untrusted data. Embedded instructions cannot alter commands, candidate constraints, selection, confirmation, marketplace, or tool permissions.

## Consequences

The plugin can use docs for context while resisting instruction hijacking. Behaviour tests must include adversarial content. Some legitimate repository instructions may require explicit user interpretation rather than direct obedience.

## Alternatives considered

Trusting `AGENTS.md` as equal-priority instructions was rejected for the Forge workflow. Avoiding repository documents entirely was rejected because ADRs and docs are valuable evidence.

## Review triggers

Review this decision when an upstream platform changes the assumptions, a security review finds the boundary insufficient, or an implementation proves the selected approach cannot meet the documented acceptance criteria.

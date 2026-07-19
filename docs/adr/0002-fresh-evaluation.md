# ADR-0002: Recompute repository understanding on every evaluation

- **Status:** Accepted
- **Date:** 2026-07-18
- **Decision owners:** Draigara maintainers
- **Repository:** `draigara-forge-plugin`

## Context

Repositories evolve. Persisted classifications become stale when frameworks, databases, delivery tools, or architectural direction change.

## Decision

Every `/forge evaluate` acquires fresh deterministic evidence and rereads relevant current documentation. The inferred profile is session-scoped and not committed.

## Consequences

Recommendations follow current repository state. Evaluation has a repeatable cost, but bounded analysis and document selection keep it manageable.

## Alternatives considered

Persisting a profile in `forge.yaml` was rejected. Cloud-stored profiles were rejected as hidden state. Incremental caches may optimise evidence gathering but cannot become authoritative.

## Review triggers

Review this decision when an upstream platform changes the assumptions, a security review finds the boundary insufficient, or an implementation proves the selected approach cannot meet the documented acceptance criteria.

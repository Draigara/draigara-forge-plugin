# ADR-0003: Recommend only retrieved marketplace candidates

- **Status:** Accepted
- **Date:** 2026-07-18
- **Decision owners:** Draigara maintainers
- **Repository:** `draigara-forge-plugin`

## Context

Language models can invent plausible package names or recall packages from another context. Installing a hallucinated or wrong-source package is unsafe.

## Decision

A recommendation must reference an opaque candidate ID returned during the current configured-marketplace query. Selection and planning validate against that set.

## Consequences

Fabricated packages are structurally prevented. Retrieval quality becomes important, and no-results cases must be handled honestly.

## Alternatives considered

Allowing free-form package names and validating later was rejected because it creates confusing and potentially exploitable flows. Cross-marketplace search was rejected because repository selection is authoritative.

## Review triggers

Review this decision when an upstream platform changes the assumptions, a security review finds the boundary insufficient, or an implementation proves the selected approach cannot meet the documented acceptance criteria.

# ADR-0010: Support GitHub Copilot CLI first

- **Status:** Superseded by ADR-0011
- **Date:** 2026-07-18
- **Decision owners:** Draigara maintainers
- **Repository:** `draigara-forge-plugin`

## Context

A first harness is needed to build and test a real plugin experience. Copilot CLI supports plugins composed of agents, skills, commands, scripts, and related assets, and is strategically aligned with the initial target audience.

## Decision

Implement and release the Copilot CLI adapter first. Preserve a harness-neutral behavioural specification and shared fixture suite before adding another adapter.

## Consequences

The team can ship one excellent integration rather than shallow multi-harness support. Users of other harnesses wait. Adapter boundaries are exercised from the start.

## Alternatives considered

Simultaneous support for Copilot, Claude, Codex, and others was rejected as too broad. A proprietary standalone harness was rejected.

## Review triggers

Review this decision when an upstream platform changes the assumptions, a security review finds the boundary insufficient, or an implementation proves the selected approach cannot meet the documented acceptance criteria.

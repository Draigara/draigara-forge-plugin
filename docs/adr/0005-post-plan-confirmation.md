# ADR-0005: Require confirmation after the APM plan

- **Status:** Superseded by ADR-0012
- **Date:** 2026-07-18
- **Decision owners:** Draigara maintainers
- **Repository:** `draigara-forge-plugin`

## Context

Package names alone do not reveal all dependency actions or files APM may change. Consent before planning is not informed consent for the resulting operation.

## Decision

After selection, obtain and display the exact APM plan, then ask a fresh explicit confirmation. Installation uses the CLI-issued plan token.

## Consequences

The user can review downstream effects without Forge interpreting them. The workflow is slightly longer but protects against unexpected composition and stale state.

## Alternatives considered

Confirmation before plan only was rejected. Treating selection as installation consent was rejected. Automatically approving transitive dependencies was rejected.

## Review triggers

Review this decision when an upstream platform changes the assumptions, a security review finds the boundary insufficient, or an implementation proves the selected approach cannot meet the documented acceptance criteria.

# ADR-0004: Always require developer package selection

- **Status:** Accepted
- **Date:** 2026-07-18
- **Decision owners:** Draigara maintainers
- **Repository:** `draigara-forge-plugin`

## Context

High-confidence recommendations are still recommendations. Teams may intentionally defer, reject, or choose only part of the set.

## Decision

Every evaluation presents a selectable list. Preselection may reflect confidence, but the developer can change every item, choose none, search more, or cancel.

## Consequences

Human agency is explicit and cognitive load is reduced without automation becoming coercive. The flow adds one interaction, which is central rather than incidental.

## Alternatives considered

Automatic install above a confidence threshold was rejected. Marking company packages as locked was rejected because policy enforcement is outside Forge's recommendation role.

## Review triggers

Review this decision when an upstream platform changes the assumptions, a security review finds the boundary insufficient, or an implementation proves the selected approach cannot meet the documented acceptance criteria.

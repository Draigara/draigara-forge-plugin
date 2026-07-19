# ADR-0006: Do not model downstream package composition

- **Status:** Accepted
- **Date:** 2026-07-18
- **Decision owners:** Draigara maintainers
- **Repository:** `draigara-forge-plugin`

## Context

Company and open packages may compose .NET, Aspire, selected community assets, delivery tools, and company requirements. APM already resolves those dependencies.

## Decision

During recommendation, treat each top-level candidate as the unit exposed by the marketplace. Do not build a capability graph, choose transitive variants, or reason over dependency internals. Show APM-reported actions only in the final plan.

## Consequences

Marketplace authors remain responsible for composition. Forge stays simple and avoids duplicating APM. Recommendations depend on good top-level metadata.

## Alternatives considered

A Forge capability graph, optional-dependency selector, and provider matrix were all rejected as misplaced duplication.

## Review triggers

Review this decision when an upstream platform changes the assumptions, a security review finds the boundary insufficient, or an implementation proves the selected approach cannot meet the documented acceptance criteria.

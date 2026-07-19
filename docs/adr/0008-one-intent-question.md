# ADR-0008: Ask at most one high-value intent question by default

- **Status:** Accepted
- **Date:** 2026-07-18
- **Decision owners:** Draigara maintainers
- **Repository:** `draigara-forge-plugin`

## Context

Intent improves greenfield and ambiguous brownfield recommendations, but a long questionnaire undermines the low-friction experience.

## Decision

After evidence review, ask no more than one concise clarification by default when the answer could materially alter recommendations. Allow skip and continue with disclosed uncertainty.

## Consequences

The workflow remains conversational and manageable. Complex ambiguity may require a second question only with an explicit explanation and user consent.

## Alternatives considered

Intent-first mandatory interviews were rejected. Never asking intent was rejected because code and docs may not reveal planned work.

## Review triggers

Review this decision when an upstream platform changes the assumptions, a security review finds the boundary insufficient, or an implementation proves the selected approach cannot meet the documented acceptance criteria.

# ADR-0001: Implement Forge as a harness plugin

- **Status:** Accepted
- **Amended by:** ADR-0011 replaces the Copilot-first adapter and process-bridge details; the harness-hosted workflow decision remains accepted.
- **Date:** 2026-07-18
- **Decision owners:** Draigara maintainers
- **Repository:** `draigara-forge-plugin`

## Context

Once the CLI and plugin are installed globally, developers work inside an AI coding harness. Repository understanding and conversational selection need access to the harness model, file tools, and interactive UI.

## Decision

Implement repository workflows as a packaged AI coding harness plugin. Keep behavioural semantics harness-neutral and use the Forge CLI's trusted deterministic integration boundary. ADR-0011 defines the current APM-native multi-harness packaging and MCP boundary.

## Consequences

Developers stay in their normal coding interface. Harness formats and capabilities vary, requiring explicit adapters and compatibility tests. The plugin contains prompts and skills rather than a standalone model runtime.

## Alternatives considered

Putting all interaction in the native CLI would duplicate AI/harness features and interrupt workflow. A web-only experience would violate local-first design. Embedding model APIs in the CLI was rejected.

## Review triggers

Review this decision when an upstream platform changes the assumptions, a security review finds the boundary insufficient, or an implementation proves the selected approach cannot meet the documented acceptance criteria.

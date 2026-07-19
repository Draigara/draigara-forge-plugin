# ADR-0012: Ship Forge as a global plugin with confirmed top-level selection

- **Status:** Accepted
- **Date:** 2026-07-19
- **Decision owners:** Draigara maintainers
- **Repository:** `draigara-forge-plugin`
- **Supersedes:** ADR-0005 and ADR-0011

## Context

Forge is conceptually a plugin like Superpowers: a globally installed bundle that contributes a conversational skill and an MCP integration. APM 0.26 can deploy the shared skill across Codex, Claude, and GitHub Copilot CLI, but it cannot provide the exact transitive plan previously assumed and does not configure a global Copilot MCP server.

## Decision

Publish one global APM plugin named `draigara-forge`. It contains the shared Forge workflow and declares `forge mcp` as its MCP server. APM installs the plugin globally for explicitly selected targets.

Repository onboarding is invoked as `/forge init` in Claude and Copilot, `$forge init` or `/skills` in Codex, or equivalent natural language. The global CLI exposes `forge setup`, not `forge init`.

The workflow recommends only opaque candidates returned by the configured marketplace during the current evaluation. The developer selects top-level packages and confirms the marketplace, repository, target scopes, and package IDs before the MCP server invokes APM. Forge does not promise an exact transitive plan or a plan token; APM owns resolution and records the result in `apm.yml` and `apm.lock.yaml`.

Support is claimed initially for Codex, Claude, and GitHub Copilot CLI after integration tests. Forge may use the documented `copilot mcp` JSON commands to reconcile only its own MCP entry when APM cannot do so. Other harnesses remain unclaimed.

## Consequences

Users install one coherent plugin rather than assembling a skill manually. The conversational experience stays harness-neutral, APM retains package authority, and the Copilot exception is narrow, observable, and replaceable when APM gains the capability.


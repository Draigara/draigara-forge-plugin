# Harness Adapter Contract

The shared APM skill and Forge MCP tools define product semantics. A harness adapter exists only when a tested native capability materially improves invocation, selection, confirmation, progress, or cancellation.

An adapter must call the same MCP tools, preserve the same state transitions, and retain selection plus post-plan confirmation. It cannot add shell execution, write repository configuration, parse APM output, or maintain a second candidate/package model.

Every stable target passes shared scenarios: missing prerequisites, three marketplaces, invalid existing `forge.yaml`, no recommendations, select none, optional selection, stale plan, repository and marketplace prompt injection, install failure, and cancellation at every interaction.

Use native selectors when available. Otherwise use the deterministic numbered fallback in the shared skill. Reduced visual richness is acceptable; reduced safety or consent is not.

Stable targets are Copilot, Claude, Cursor, Codex, Gemini, OpenCode, Windsurf, Kiro, and IntelliJ MCP integration. Experimental APM targets are excluded until a later ADR and native test lane.

# ADR-0011: Ship one APM-native multi-harness package over Forge MCP

- **Status:** Accepted
- **Date:** 2026-07-19
- **Decision owners:** Draigara maintainers
- **Repository:** `draigara-forge-plugin`
- **Supersedes:** ADR-0009 and ADR-0010

## Context

Forge is distributed as an npm CLI and exposes deterministic plugin operations through the stdio server started by `forge mcp`. Microsoft APM already deploys skills and MCP configuration across supported coding harnesses. Maintaining a process bridge and separate Copilot-first package would duplicate that portability layer.

## Decision

Author one APM package containing a shared user-invocable `forge` skill and a plugin-native `.mcp.json` stdio server with command `forge` and argument `mcp`. APM owns packing and global deployment to stable targets. Harness-specific adapters may improve presentation only when a documented capability gap and integration test justify them.

The stable support gate covers Copilot, Claude, Cursor, Codex, Gemini, OpenCode, Windsurf, Kiro, and IntelliJ MCP integration. Experimental APM targets are not claimed.

## Consequences

Workflow semantics have one source, `/forge init` remains available through a shared skill, and deterministic operations remain versioned MCP tools. Installing the package requires explicit APM executable trust because it contributes a self-defined MCP server.

## Alternatives considered

Separate per-harness packages were rejected because they duplicate workflow and safety rules. MCP-only installation without a skill was rejected because it removes the guided developer experience.

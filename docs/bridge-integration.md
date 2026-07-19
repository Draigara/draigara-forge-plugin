# Forge MCP Integration

ADR-0011 replaces the former process bridge. The package's `.mcp.json` configures a stdio server named `draigara-forge` using command `forge` and argument `mcp`; APM routes it to selected harnesses. The protocol stream contains only MCP JSON-RPC.

The plugin consumes the CLI-owned v1 tools: `forge_environment_inspect`, `forge_repository_inspect`, `forge_repository_initialize`, `forge_marketplace_search`, `forge_installation_plan`, `forge_installation_apply`, and `forge_status`.

The first call negotiates the contract through environment inspection. If the installed contract is incompatible, stop before reading repository content. Inputs and results are bounded by the pinned CLI schemas and golden fixtures; the plugin does not maintain a divergent copy.

Stable `FORGE_*` errors map to fixed remediations. Missing or incompatible Forge/APM points to `npx @draigara/forge setup`. Marketplace absence returns to setup. Stale plans return to planning. Token mismatch is an integrity failure. Cancellation ends without mutation.

Installation uses only a short-lived plan token returned for the current repository, marketplace, candidate set, APM state, and Git state. The skill never accepts an arbitrary executable or MCP tool name from model output.

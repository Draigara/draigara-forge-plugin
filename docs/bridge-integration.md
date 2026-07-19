# Forge MCP Integration

ADR-0012 defines the plugin boundary. The global draigara-forge APM package declares the local stdio server forge mcp; the protocol stream contains only MCP JSON-RPC.

The plugin consumes these CLI-owned v1 tools:

- forge_environment_inspect
- forge_marketplace_list
- forge_repository_inspect
- forge_repository_initialize
- forge_marketplace_candidates
- forge_installation_apply
- forge_status

Inputs and results are bounded by the pinned CLI schema and golden fixtures. Stable FORGE_* errors map to fixed remediation. Missing or incompatible Forge/APM points to npx @draigara/forge setup. An untracked marketplace returns to setup so the developer can create or explicitly adopt it.

Candidate retrieval creates an opaque, current-session evaluation ID. Apply accepts only candidate IDs returned by that evaluation, the same repository, explicit targets, and a fresh confirmation. The plugin never accepts arbitrary executable names, raw APM arguments, package locators invented by the model, or an evaluation ID from another session.

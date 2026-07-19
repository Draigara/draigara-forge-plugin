# Draigara Forge Plugin

This repository publishes the APM-native, repository-scoped Forge experience. Install it through Draigara OpenAPM Community as `draigara-forge@draigara-openapm`; APM deploys the shared `forge` skill and the `forge mcp` configuration globally to selected coding harnesses.

After machine setup with `npx @draigara/forge setup`, open a supported harness in a repository and run:

```text
/forge init
```

The same skill supports `evaluate`, `status`, and `explain`. It uses the model for bounded reasoning and selection while the Forge CLI performs deterministic inspection, configuration, planning, and APM orchestration through versioned MCP tools.

Forge never invents packages, models dependency composition, persists inferred repository facts, or installs without developer selection and post-plan confirmation.

## Development

Use APM 0.26.x to validate, preview, install, and pack this repository. Local cross-repository tests use `C:\Projects\draigara-openapm` and `C:\Projects\draigara-forge-cli`; local paths must not enter release artifacts.

Read `AGENTS.md`, `docs/architecture.md`, `docs/bridge-integration.md`, and `docs/implementation-plan.md` before changing behavior.

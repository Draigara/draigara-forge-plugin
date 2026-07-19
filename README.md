# Draigara Forge Plugin

The Forge plugin is a globally installed plugin bundle for repository-aware discovery and installation of Microsoft APM packages. Like other agent plugins, it combines a conversational skill with a deterministic MCP integration; it is not installed or maintained as an isolated skill.

## Install

Run the guided machine setup:

```sh
npx @draigara/forge setup
```

Forge detects Codex, Claude, and GitHub Copilot CLI, confirms the complete machine plan, and asks APM to install `draigara-forge@draigara-openapm` globally for the selected targets. Forge configures its Copilot MCP entry through the documented Copilot CLI only when APM cannot do so.

## Use in a repository

- Claude or Copilot: `/forge init`
- Codex: `$forge init` or select Forge from `/skills`
- All supported harnesses: ask Forge to initialize the repository in natural language

The plugin creates only the minimal `forge.yaml`, recomputes repository evidence for every evaluation, recommends only candidates returned from the selected marketplace, and requires developer selection plus final confirmation. APM owns dependency resolution, `apm.yml`, `apm.lock.yaml`, and deployment.

## Contributing

Use APM 0.26.x and validate only the preview targets currently claimed:

```sh
uvx --from apm-cli==0.26.0 apm install --dry-run --target copilot,claude,codex --trust-transitive-mcp
uvx --from apm-cli==0.26.0 apm pack
pwsh ./tools/Validate-Repository.ps1
```

See [AGENTS.md](./AGENTS.md), [docs/architecture.md](./docs/architecture.md), and the [Accepted ADRs](./docs/adr/README.md) before changing behavior.

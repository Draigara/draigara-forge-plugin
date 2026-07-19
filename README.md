<p align="center">
  <img src="./docs/assets/draigara-wordmark.svg" alt="Draigara" width="480">
</p>

# Forge Plugin

The Forge plugin provides repository-aware discovery and installation of
Microsoft APM packages inside supported AI coding tools. It is one globally
installed plugin bundle containing a conversational skill and the deterministic
Forge MCP integration—not a standalone skill that users assemble manually.

## Install

The recommended route is Forge's guided machine setup:

```sh
npx @draigara/forge@next setup
```

The same command works from npm on Windows, macOS, and Linux with Node.js 22 or
newer. pnpm and modern Yarn users can run:

```sh
pnpm dlx @draigara/forge@next setup
# or
yarn dlx @draigara/forge@next setup
```

Forge detects Codex CLI, Claude Code, and GitHub Copilot CLI, confirms the full
machine plan, and asks APM to install `draigara-forge@draigara-openapm`
globally for the selected targets.

Advanced users who already configured Draigara OpenAPM Community can ask APM
directly:

```sh
apm install draigara-forge@draigara-openapm --global --target claude,codex,copilot --trust-transitive-mcp
```

APM owns plugin installation and target deployment. Forge uses the documented
Copilot CLI only to reconcile its own MCP entry when APM cannot configure that
global entry.

## Use in a repository

- Claude Code or GitHub Copilot CLI: `/forge init`
- Codex CLI: `$forge init` or select Forge from `/skills`
- Any supported harness: ask Forge to initialize the current repository

The plugin creates only the minimal `forge.yaml`, recomputes repository
evidence for every evaluation, and recommends only candidates returned from
the repository's selected marketplace. You select the top-level packages and
confirm before installation. APM owns dependencies, `apm.yml`, `apm.lock.yaml`,
and deployment.

## Supported harnesses

The preview is integration-tested for:

- Claude Code
- Codex CLI
- GitHub Copilot CLI

Other APM targets are not yet claimed as supported by Forge.

## Project information

- [Contributing and running from source](./CONTRIBUTING.md)
- [Architecture](./docs/architecture.md)
- [Security policy](./SECURITY.md)
- [License](./LICENSE) — Apache License 2.0
- [Trademarks](./TRADEMARKS.md) — Draigara name and brand usage

# Draigara Forge Plugin

The Forge plugin brings repository-aware APM package discovery and setup into
supported AI coding tools. It provides one shared `/forge` experience while the
Forge CLI performs deterministic inspection and Microsoft APM owns package
resolution and deployment.

## Install

The plugin is published as:

```text
draigara-forge@draigara-openapm
└─ package       └─ marketplace
```

`draigara-forge` is the Forge product package. `draigara-openapm` is the stable
ID of Draigara OpenAPM Community.

The recommended installation is the guided machine setup:

```sh
npx @draigara/forge setup
```

Forge confirms the complete plan and asks APM to install the plugin globally
for the coding tools you select.

## Use Forge in a repository

Open a supported coding tool in the repository and run:

```text
/forge init
```

The shared skill also supports:

```text
/forge evaluate
/forge status
/forge explain
```

Forge recomputes repository evidence for each evaluation. It never invents
packages, models transitive package composition, persists inferred repository
facts, or installs without developer selection and confirmation of the final
APM plan.

## Contributing

Use APM 0.26.x to validate and pack the plugin:

```sh
uvx --from apm-cli apm install --dry-run --target copilot,claude,cursor,codex,gemini,opencode,windsurf,kiro,intellij
uvx --from apm-cli apm pack
```

Cross-repository tests may use sibling checkouts named
`draigara-forge-cli` and `draigara-openapm`; their filesystem locations are
local configuration and must never enter release artifacts.

See [CONTRIBUTING.md](./CONTRIBUTING.md),
[docs/architecture.md](./docs/architecture.md), and
[docs/implementation-plan.md](./docs/implementation-plan.md) before changing
product behavior. Coding agents must start with [AGENTS.md](./AGENTS.md).

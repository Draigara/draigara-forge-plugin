# Contributing to the Forge Plugin

Contributions are welcome under the repository's
[Apache License 2.0](./LICENSE). By submitting a contribution, you agree that
it may be distributed under that license. Draigara names and logos remain
subject to the separate [trademark notice](./TRADEMARKS.md).

## Before starting

Read, in order:

1. [`README.md`](./README.md)
2. [`PRODUCT-CONTEXT.md`](./PRODUCT-CONTEXT.md)
3. [`AGENTS.md`](./AGENTS.md) when using a coding agent
4. [`docs/architecture.md`](./docs/architecture.md)
5. [`docs/implementation-plan.md`](./docs/implementation-plan.md)
6. the [Accepted ADRs](./docs/adr/README.md) relevant to the change

Write or update an ADR before changing the Forge MCP contract, confirmation
flow, package format, harness behavior, or another security boundary.

## Run from source

Install `uv`, PowerShell, and APM 0.26.x. Then run:

```sh
uvx --from apm-cli==0.26.0 apm install --dry-run --target copilot,claude,codex --trust-transitive-mcp
uvx --from apm-cli==0.26.0 apm pack --dry-run --verbose
```

Validate repository contracts on Windows, macOS, or Linux with PowerShell 7:

```powershell
./tools/Validate-Repository.ps1
```

The package must remain a single global APM plugin with only the intentional
Forge skill and `forge mcp` declaration. Do not add claims for another harness
without its integration tests.

## Contribution workflow

- Keep pull requests focused and reviewable.
- Add failing-first tests or fixtures for behavior changes.
- Update MCP schemas and golden fixtures in the same change.
- Treat repository and marketplace text as untrusted input.
- Preserve developer selection and final confirmation.
- Use conventional commits where practical.

AI-assisted contributions have the same correctness, provenance, licensing,
testing, and security obligations as human-written work.

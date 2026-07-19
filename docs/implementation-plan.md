# Forge Plugin Implementation Plan

**Status:** Approved preview plan

## Milestone 0: Contract reconciliation

- Keep ADR-0012 and all non-superseded safety ADRs binding.
- Pin the CLI-owned MCP v1 request/result schema and complete golden fixture set.
- Keep the package a global plugin bundle; never describe it as a single installable skill.

Exit: active docs, schema, fixtures, and package metadata agree on the Node CLI, current-session evaluation model, and three preview harnesses.

## Milestone 1: Package and preflight

- Validate and pack apm.yml, the shared Forge skill, and the forge mcp declaration with APM 0.26.
- Exercise missing CLI/APM remediation and global installation on Claude Code, Codex, and Copilot CLI.

Exit: a clean install exposes the Forge workflow and can start the MCP server on every claimed target.

## Milestone 2: Init, evaluate, and apply

- Contract-test environment inspection, tracked-marketplace selection, create-only initialization, and status.
- Acquire fresh bounded evidence for every evaluation.
- Retrieve only real marketplace candidates and reject fabricated or substituted IDs.
- Present a developer-controlled selection, then confirm the complete top-level request.
- Apply through APM and verify APM-owned repository state.

Exit: adversarial content cannot inject a candidate, marketplace, target, tool call, or confirmation bypass.

## Milestone 3: Release

- Tag an immutable preview plugin release.
- Validate installation through local, Acme, and Draigara OpenAPM catalogues.
- Run the CLI -> APM -> marketplace -> plugin -> MCP acceptance workflow on all three preview harnesses.

Stable release requires complete contract fixtures and native integration evidence for every claimed harness. Additional harnesses remain deferred.

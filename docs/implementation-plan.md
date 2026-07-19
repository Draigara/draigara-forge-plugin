# Forge Plugin Implementation Plan

**Status:** Approved implementation plan

## Milestone 0: Contract reconciliation

- Keep ADR-0011 and all non-superseded safety ADRs binding.
- Remove process-bridge and Copilot-only artifacts.
- Pin the CLI-owned MCP v1 schemas and fixtures in contract tests.
- Block implementation when a required APM structured operation is absent; never parse terminal output.

Exit: no active document, schema, fixture, or package file retains the superseded process-bridge or native distribution architecture.

## Milestone 1: APM package

- Validate `apm.yml`, the shared `forge` skill, and the plugin-native `.mcp.json` with APM 0.26.x.
- Add explicit executable-trust documentation and tests.
- Preview and pack the package without hand-authored target outputs.

Exit: a clean local APM install exposes the skill and starts MCP on one stable target.

## Milestone 2: Init and status

- Contract-test MCP negotiation, environment and repository inspection, marketplace selection, create-only initialization, and status.
- Use native selectors when available and a deterministic numbered fallback otherwise.
- Recommend `npx @draigara/forge setup` for missing prerequisites.

Exit: `/forge init` creates only minimal valid `forge.yaml`, never overwrites it, and reruns without changes.

## Milestone 3: Evaluation and recommendation

- Acquire fresh deterministic evidence for every evaluation.
- Bound document selection and label all loaded content untrusted.
- Generate search concepts, retrieve candidates, reject fabricated IDs, and ask at most one high-value intent question by default.
- Always present developer-controlled selection, including none and cancel.

Exit: adversarial fixtures cannot inject a candidate, marketplace, tool call, or confirmation bypass.

## Milestone 4: Plan and apply

- Request an APM-owned plan for selected opaque locators.
- Display the plan unchanged and require a new confirmation.
- Apply only the current short-lived token; recover from stale plans by replanning visibly.

Exit: token tampering, expiry, repository drift, APM drift, and Git drift are rejected before mutation.

## Milestone 5: Stable harness matrix

- Test global install, MCP launch, `/forge init`-equivalent invocation, interaction, status, and removal on Copilot, Claude, Cursor, Codex, Gemini, OpenCode, Windsurf, Kiro, and IntelliJ MCP integration.
- Add adapters only for proven gaps and contract-test semantic equivalence.
- Keep experimental APM targets explicitly unsupported.

Exit: every claimed target has a native integration lane; cross-compilation or generated-file inspection alone is insufficient.

## Milestone 6: OpenAPM release

- Tag an immutable plugin release.
- Validate installation through local and production-shaped `draigara-openapm` catalogues.
- Run the CLI → APM → marketplace → plugin → MCP acceptance workflow.

Stable release remains blocked until the production repository locator, immutable version, complete MCP schemas, and every required structured APM operation exist.

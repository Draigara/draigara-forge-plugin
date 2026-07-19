# Plugin Acceptance Criteria

- APM 0.26.x validates, previews, installs, and packs the canonical package.
- The installed `/forge` skill accepts `init`, `evaluate`, `status`, and `explain` without shell wrappers.
- The configured stdio server launches exactly `forge mcp`; stdout remains valid MCP JSON-RPC.
- Init creates minimal `forge.yaml` only through MCP and never overwrites it.
- Recommendations show current-query package names, descriptions, evidence, and reasons; opaque candidate IDs remain internal tool-call bindings.
- Developer selection is always available, including none and cancel.
- Apply occurs only after the complete top-level request is shown and freshly confirmed.
- Prompt injection, stale tokens, plan mismatch, cancellation, and missing prerequisites fail closed.
- Every claimed stable APM target passes its native install, interaction, MCP, status, and removal lane.
- The packed release contains no local paths, wrapper executables, CLI binary, secrets, or obsolete fixtures.
- Normal completion prose contains no repository root, evaluation ID, candidate ID, or raw MCP JSON object.

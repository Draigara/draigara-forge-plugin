# Plugin Testing Strategy

Contract tests pin Forge MCP v1 schemas and golden fixtures from the CLI release. Behavioural tests exercise the shared skill's state machine with deterministic tool responses and adversarial repository/marketplace content. They measure candidate fabrication, confirmation bypass, evidence attribution, and bounded document selection.

Package tests run APM validation, preview, pack, and clean global installation. Harness tests cover Copilot, Claude, Cursor, Codex, Gemini, OpenCode, Windsurf, Kiro, and IntelliJ MCP integration. Generated-file inspection is useful but does not replace launching the native harness integration.

The cross-repository lane uses a scratch OpenAPM catalogue, the locally packed Forge CLI, and the sibling plugin source. It performs setup, init, candidate retrieval, selection, planning, confirmation, apply, convergence, and clean removal.

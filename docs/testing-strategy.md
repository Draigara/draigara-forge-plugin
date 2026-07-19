# Plugin Testing Strategy

Contract tests pin the complete Forge MCP v1 request/result schema and golden fixtures from a released CLI commit. Behavioural tests exercise the shared workflow with deterministic tool responses and adversarial repository/marketplace content. They measure candidate fabrication, evaluation substitution, confirmation bypass, evidence attribution, and bounded document selection.

Package tests run APM marketplace checking, dry-run installation, packing, clean global installation, and removal. Native harness tests cover Claude Code, Codex, and GitHub Copilot CLI. Generated-file inspection is useful but does not replace launching the real harness integration.

The cross-repository lane uses a scratch home and repository, a packed Forge CLI, the local Forge plugin, Draigara OpenAPM, and the synthetic Acme marketplace. It performs setup, explicit marketplace adoption, init, candidate retrieval, selection, confirmation, apply, convergence, status, and safe unlink/removal.

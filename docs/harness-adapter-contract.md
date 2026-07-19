# Harness Adapter Contract

The global Forge plugin and Forge MCP tools define product semantics. Harness-specific instructions exist only to expose the same workflow through the host's documented plugin mechanism and interaction capabilities.

Every claimed target must preserve:

- init, evaluate, status, and explain semantics;
- selection of real candidates from the repository-selected marketplace;
- explicit post-summary confirmation;
- current-evaluation candidate validation;
- cancellation without implicit retry;
- no arbitrary shell or APM command construction.

Use a native selector when the harness offers one to the plugin. Otherwise use the deterministic numbered conversational fallback. Reduced visual richness is acceptable; reduced safety or consent is not.

Preview targets are Claude Code, Codex, and GitHub Copilot CLI. Any additional target needs an ADR, a documented APM/harness installation path, and a native integration test.

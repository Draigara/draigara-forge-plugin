# Plugin Architecture

Forge is one globally installed APM plugin bundle, similar in installation shape to Superpowers. Its portable core is .apm/skills/forge/SKILL.md; its MCP declaration starts the separately installed forge mcp executable. APM deploys the bundle to each selected supported harness.

    Harness-native invocation and selection
                  |
                  v
    Global Forge plugin bundle
      init | evaluate | status | explain
                  |
                  v
    Forge MCP v1 tools
                  |
                  v
    Forge CLI deterministic services -> Microsoft APM

The plugin owns conversational reasoning, evidence-linked recommendations, and developer interaction. The CLI owns setup, deterministic repository inspection, forge.yaml, marketplace provenance, current-session evaluations, and safe APM invocation. APM owns package state, dependency resolution, lock state, security policy, and deployment.

Repository and marketplace content is untrusted data. Evaluation state is session-scoped. Evidence, inference, candidates, recommendations, selection, and mutation remain distinct. Harness-specific instructions may improve invocation or selectors but cannot duplicate the workflow or bypass MCP.

Preview support is limited to Claude Code, Codex, and GitHub Copilot CLI. Additional harnesses require a documented install path and native integration lane.

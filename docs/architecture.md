# Plugin Architecture

The plugin is one APM-native package. Its portable core is `.apm/skills/forge/SKILL.md` plus the plugin-native `.mcp.json`; APM packs and deploys the skill and `forge mcp` server configuration to each selected stable target.

```text
Harness-native invocation and selection
              │
              ▼
Shared /forge skill
  init | evaluate | status | explain
              │
              ▼
Forge MCP v1 tools
              │
              ▼
Forge CLI deterministic services → Microsoft APM
```

The skill owns conversational reasoning, evidence-linked recommendations, and developer interaction. The CLI owns repository inspection, `forge.yaml`, marketplace state, APM plans, plan tokens, and mutations. APM owns targets, package state, dependency resolution, security policy, and deployment.

Evaluation state is session-scoped. Evidence, inference, candidates, recommendations, selection, and the APM plan remain distinct. Repository and marketplace text is untrusted and cannot change tool permissions or approval rules.

Harness adapters may improve selectors or aliases but cannot duplicate the workflow or bypass MCP. Support is claimed only after target-native installation and behavior tests.

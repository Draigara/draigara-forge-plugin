# Plugin Open Questions

**Repository:** `draigara-forge-plugin`
**Status:** Living document

Only unresolved decisions belong here. A coding agent must not invent answers to
these questions.

1. Which versioned Forge MCP tools and schemas will expose marketplace search,
   plan, apply, and package status once the CLI implements those operations?
2. Which structured APM operations are still missing for those tools, and which
   gaps require an upstream APM change rather than human-output parsing?
3. Which harness-native interactive selection facilities are available in each
   claimed stable target, and what integration test proves each adapter or
   graceful fallback?
4. Which models form the stable behavioural evaluation matrix without coupling
   Forge semantics to one provider?
5. What repository document byte/token budget gives useful evidence without
   excessive context?
6. Can a harness safely retain current-session evidence across `/forge`
   invocations, or must `/forge explain` remain within the initiating session?
7. What public repository and immutable release tag will supply the production
   `draigara-forge` APM package?

Questions 1 and 2 block the full repository package workflow. Question 7 blocks
stable marketplace publication. The current setup, shared `/forge` skill, and
`forge mcp` transport can be implemented and tested independently.

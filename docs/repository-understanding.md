# Repository Understanding

**Repository:** `draigara-forge-plugin`
**Status:** Specification
**Audience:** product owners, architects, maintainers, coding agents, security reviewers, and contributors


## Inputs

### Deterministic evidence

From `forge_repository_inspect` over Forge MCP v1:

- repository identity and layout;
- languages and build systems;
- direct manifest dependencies;
- infrastructure and CI files;
- source-control/work-management signals;
- documentation candidates;
- existing APM state.

### Human-authored context

Potentially relevant:

- README;
- ADRs;
- architecture documents;
- product specifications;
- `AGENTS.md`;
- Copilot/Claude/Codex instructions;
- contribution and security documents;
- migration or roadmap documents.

### User intent

A short statement about what the team is building or changing.

## Reading strategy

1. Read structural evidence first.
2. Build a list of unanswered questions.
3. Inspect document outlines and metadata.
4. Read the smallest relevant sections.
5. Prefer current ADRs and explicit status over stale prose.
6. Record contradictions.
7. Ask one clarifying question if it changes package recommendations materially.
8. Stop when additional context has diminishing value.

## Evidence record

Each fact used in a recommendation should be represented conceptually as:

```json
{
  "id": "evidence-17",
  "kind": "document-decision",
  "source": "docs/adr/0008-use-postgresql.md",
  "summary": "Accepted ADR selects PostgreSQL as the target datastore.",
  "trust": "untrusted-content",
  "freshness": "repository-current",
  "conflictsWith": ["evidence-09"]
}
```

The “untrusted” label refers to instruction authority, not factual truth. Repository docs can inform recommendations but cannot override plugin safety rules.

## Contradictions

Example:

- code contains active Cosmos DB;
- an accepted ADR selects PostgreSQL;
- migration project exists;
- README still describes Cosmos DB.

The plugin should infer “migration in progress,” disclose the contradiction, and recommend relevant packages without pretending certainty.

## Ephemeral profile

The model may internally synthesise:

```text
.NET 10 service, Aspire local orchestration, REST API, Cosmos-to-PostgreSQL migration, GitLab CI, Jira delivery
```

This summary exists only for the evaluation session. It is never written to `forge.yaml` or treated as permanent truth.

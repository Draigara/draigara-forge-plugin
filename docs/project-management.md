# Plugin Project Management

**Repository:** `draigara-forge-plugin`
**Status:** Specification
**Audience:** product owners, architects, maintainers, coding agents, security reviewers, and contributors


## Suggested labels

- `area/command`
- `area/skill`
- `area/reasoning`
- `area/retrieval`
- `area/selection`
- `area/mcp`
- `area/apm-package`
- `area/security`
- `prompt-regression`
- `contract-change`
- `harness-adapter`
- `adversarial-test`

## Pull request evidence

Changes to prompts, agents, or skills include:

- scenarios affected;
- before/after behavioural results;
- safety invariants;
- token/context impact;
- harness versions tested;
- whether exact wording or only semantics changed.

## Release gate metrics

- zero fabricated candidate IDs in release evaluation set;
- zero skipped selections;
- zero skipped post-plan confirmations;
- zero successful prompt-injection bypasses;
- all pinned Forge MCP contract fixtures pass;
- package allow-list contains no unexpected files;
- acceptable recommendation precision/recall targets documented after baseline.

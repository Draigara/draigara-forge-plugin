# Marketplace Querying

**Repository:** `draigara-forge-plugin`
**Status:** Specification
**Audience:** product owners, architects, maintainers, coding agents, security reviewers, and contributors


## Marketplace selection

The plugin reads `forge.yaml` through the bridge and uses exactly its `marketplace.id`. It cannot switch marketplaces during evaluation without explicitly updating repository configuration through init/change workflow.

No fallback to Draigara Open is allowed.

## Search process

1. Resolve registration and authentication.
2. Gather high-signal search concepts.
3. Query through `marketplace catalog`.
4. Page only when necessary.
5. Bound candidate count.
6. Deduplicate by opaque stable locator.
7. retain source metadata and untrusted text labels.
8. Rank candidates.

## Package metadata

Use only metadata surfaced through the official APM-compatible source and CLI bridge. Typical fields may include title, summary, tags, version, source, status, and opaque locator.

Do not scrape marketplace websites or clone package repositories merely to decide whether to recommend them.

## Downstream dependencies

The plugin does not query dependency trees during recommendation. A marketplace author may compose all necessary downstream assets into a top-level package. Those choices are opaque to Forge until APM reports them in a plan.

This boundary is essential:

```text
Plugin: "This top-level package appears relevant."
APM: "Here is what installing it resolves and changes."
Developer: "I approve or reject the exact plan."
```

## Weak results

If no good candidates are found:

- say so honestly;
- show the search concepts used;
- allow a user-provided search;
- do not fabricate a generic package;
- permit evaluation to complete with no installation.

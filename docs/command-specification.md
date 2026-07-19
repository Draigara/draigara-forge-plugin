# Plugin Command Specification

**Repository:** `draigara-forge-plugin`
**Status:** Specification
**Audience:** product owners, architects, maintainers, coding agents, security reviewers, and contributors


## `/forge init`

### Preconditions

- running inside a discoverable repository;
- Forge CLI installed and MCP v1-compatible;
- APM available;
- at least one registered marketplace or ability to guide registration.

### Flow

1. Run preflight.
2. Check for `forge.yaml`.
3. If valid, explain that the repository is already initialised and offer to run evaluation instead.
4. If invalid, stop and explain the exact schema problem; do not overwrite.
5. If absent, retrieve registered marketplaces.
6. Present an interactive single choice, including display name, stable ID, and source host.
7. If none exist, instruct the user to leave the harness briefly and run the exact `forge marketplace add` command; do not invent a source.
8. Confirm the selected marketplace.
9. Ask `forge_repository_initialize` to atomically create minimal `forge.yaml`.
10. Show the generated file and remind the developer to commit it.
11. Continue into the same pipeline as `/forge evaluate`.

The marketplace selection is a repository decision and should not be hidden behind a default. When only one registration exists it may be preselected, but the user must see and confirm it.

## `/forge evaluate`

Always:

- re-runs deterministic analysis;
- reads current relevant docs;
- retrieves current marketplace candidates;
- shows selectable recommendations;
- permits installing none;
- shows the final top-level package, marketplace, repository, and target request;
- confirms before installation.

It does not only report recommendations. It is an interactive recommendation and selection workflow.

## `/forge status`

Read-only summary:

- repository root;
- configured marketplace ID and registration health;
- Forge CLI/APM/plugin compatibility;
- currently installed top-level APM packages as reported by APM;
- whether an evaluation can run;
- no inferred repository profile.

## `/forge explain`

Explains either:

- why a current-session recommendation was made;
- why a package was not recommended, if it appeared in the candidate set;
- which evidence was used;
- what uncertainty remains;
- that downstream dependencies are owned by the package/APM and were not part of Forge ranking.

It must not claim knowledge it did not retrieve.

## Natural-language entry

The Forge agent may recognise statements such as “evaluate this repo” or “I am adding GraphQL” and suggest `/forge evaluate`. It must not begin installation merely from casual mention. The canonical slash commands remain documented and testable.

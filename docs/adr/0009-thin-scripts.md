# ADR-0009: Keep skill scripts as fixed bridge wrappers

- **Status:** Superseded by ADR-0011
- **Date:** 2026-07-18
- **Decision owners:** Draigara maintainers
- **Repository:** `draigara-forge-plugin`

## Context

Harness skills can include scripts. Putting analysis or installation logic in loosely controlled scripts would duplicate the CLI and make security review harder.

## Decision

Bundled Bash/PowerShell scripts call fixed `forge bridge v1` operations, validate basic arguments, and preserve structured output. Business logic stays in workflow instructions and trusted CLI services.

## Consequences

Scripts remain auditable and cross-platform. The plugin package is small. The CLI must be available, which is already a product prerequisite.

## Alternatives considered

Implementing repository scanning in shell was rejected. Allowing a generic `forge.sh <arbitrary args>` wrapper was rejected. Embedding the CLI binary in the plugin was deferred.

## Review triggers

Review this decision when an upstream platform changes the assumptions, a security review finds the boundary insufficient, or an implementation proves the selected approach cannot meet the documented acceptance criteria.

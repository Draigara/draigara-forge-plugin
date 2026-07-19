# Interactive Selection UX

**Repository:** `draigara-forge-plugin`
**Status:** Specification
**Audience:** product owners, architects, maintainers, coding agents, security reviewers, and contributors


## Preferred experience

Where the harness supports structured choices:

```text
Forge found packages relevant to this repository.

Recommended
[x] Company API Engineering
    Matches the .NET API projects and company marketplace guidance.

[x] Company Observability
    OpenTelemetry configuration and AKS deployment were detected.

Optional
[ ] Durable Workflow Engineering
    An ADR discusses long-running orchestration, but no implementation exists.

[ ] PostgreSQL Migration
    PostgreSQL is the documented target; Cosmos DB remains active.

Actions: Review details | Search marketplace | Select none | Continue
```

## Requirements

- Every item displays a human title and concise reason.
- The developer can inspect evidence before selecting.
- Preselection is a convenience, never implicit consent.
- The selected list is echoed before confirmation.
- The developer can install none and still receive an evaluation summary.
- Search results remain tied to the configured marketplace.
- Package IDs need not be exposed unless useful for disambiguation.
- Accessibility does not depend on colour.

## Fallback for non-interactive harnesses

Use a numbered protocol:

```text
Reply with the numbers to install, `all`, `none`, `details 3`, or `search <terms>`.

1. [recommended] Company API Engineering
2. [recommended] Company Observability
3. [optional] Durable Workflow Engineering
4. [optional] PostgreSQL Migration
```

Parse only the documented response grammar. Ambiguous natural language triggers clarification rather than selection.

## Confirmation UX

Before APM invocation:

```text
Selected top-level packages
  Company API Engineering
  Company Observability

Marketplace
  company-apm

Repository
  /workspace/example

Targets
  Codex

APM will resolve dependencies and produce repository package state.

Install these top-level packages? [yes/no]
```

The final yes/no must occur after the complete top-level request is displayed. Apply accepts only opaque candidate IDs returned by the current evaluation.

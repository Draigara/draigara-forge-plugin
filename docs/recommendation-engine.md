# Recommendation Engine Specification

**Repository:** `draigara-forge-plugin`
**Status:** Specification
**Audience:** product owners, architects, maintainers, coding agents, security reviewers, and contributors


## Objective

Recommend the smallest useful set of real top-level marketplace packages that match the repository's current state and stated direction.

## Candidate constraint

The recommendation engine can only rank candidate records retrieved from the configured marketplace. It may never produce a package locator from memory, guess a package name, or substitute a similarly named package from another marketplace.

## Retrieval

Generate bounded search intents from:

- detected technology;
- repository purpose;
- delivery environment;
- explicit future decisions;
- user-stated change;
- existing installed packages.

Examples of search concepts, not package names:

```text
dotnet aspire service observability
graphql api engineering
postgres migration data access
gitlab jira delivery workflow
```

Use several focused queries rather than one huge concatenation. Deduplicate results by the marketplace/APM stable identity.

## Ranking dimensions

A model may assess:

- direct technical match;
- explicit documentation decision;
- current change intent;
- lifecycle relevance;
- overlap with installed top-level packages;
- contradictory evidence;
- package metadata specificity;
- package maintenance/status metadata if exposed by APM;
- confidence that the package is intended for this repository class.

The score is for ordering only. It is not a policy decision.

## Recommendation output

The MCP record keeps its opaque binding for apply:

```json
{
  "candidateId": "opaque-session-id",
  "classification": "recommended",
  "preselected": true,
  "confidence": "high",
  "reason": "The repository contains an Aspire AppHost and accepted ADR-0004 standardises Aspire service defaults.",
  "evidenceIds": ["e-4", "e-12"],
  "uncertainty": null
}
```

Confidence labels are preferred over deceptive numeric precision.

The developer-facing view does not print `candidateId`. It shows the returned package name and description followed by the grounded reason, evidence, and uncertainty. Harness-native selectors use those names as labels and carry the matching candidate IDs only as internal values.

## Minimality

Do not recommend every matching package. Prefer a concise, useful shortlist. A default target is:

- 3–7 preselected recommendations;
- up to 5 optional recommendations;
- an explicit search-more action.

The marketplace may contain hundreds of entries. Cognitive load reduction is a primary product outcome.

## Existing packages

- Do not recommend reinstalling an already installed equivalent top-level package.
- A newer relevant package may be shown as an optional migration only when metadata supports that relationship.
- Potentially obsolete packages are shown in a separate review section.
- Removal is never included in the installation selection.

## Explanation standard

Every recommendation answers:

1. What repository evidence supports it?
2. Why is it useful now?
3. What uncertainty or contradiction exists?
4. Is it already installed?
5. Was it recommended because of current implementation, documented direction, or user intent?

Do not predict or explain transitive contents. APM owns dependency resolution; only verified APM-owned state may be described after apply.

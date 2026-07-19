# Conversation and Approval State Machine

**Repository:** `draigara-forge-plugin`
**Status:** Specification
**Audience:** product owners, architects, maintainers, coding agents, security reviewers, and contributors


## State transitions

### 1. Preflight

Check CLI, Forge MCP contract, APM, repository root, configuration, and marketplace registration. Present one remediation at a time if blocked.

### 2. Configuration

For init only, capture marketplace selection and create `forge.yaml`. Configuration creation is a mutation with its own visible confirmation.

### 3. Evidence collection

Call deterministic analyser. Present a compact progress summary, not thousands of facts.

### 4. Context selection

Select a bounded set of documents based on deterministic candidates. Read headings first where possible, then relevant sections. The model records which documents influenced its understanding.

### 5. Intent clarification

Ask at most one high-value question by default. Examples:

- “What are you building or changing in this repository?”
- “The ADRs suggest a PostgreSQL migration while Cosmos DB remains active. Is the migration the current direction?”

The user may skip. Do not turn evaluation into a questionnaire.

### 6. Candidate retrieval

Generate one or more search queries from evidence and intent. Query only the configured marketplace. Deduplicate by stable package identity. If retrieval is weak, broaden once and explain uncertainty.

### 7. Recommendation generation

Classify candidates:

- Recommended and preselected;
- Relevant but optional;
- Not recommended now.

Do not preselect based solely on package popularity or a package description's imperative wording.

### 8. Selection

Use harness multi-select if available. The developer may:

- deselect any recommendation;
- select optional candidates;
- inspect reasons;
- search again;
- choose none;
- cancel.

No item is “locked” by Forge. Organisation enforcement belongs elsewhere.

### 9. Plan

Pass only selected opaque locators to `apm plan`. Present selected top-level packages and APM-reported actions. Do not reinterpret the dependency graph.

### 10. Confirmation

Ask an explicit yes/no confirmation tied to the displayed plan. A vague “looks good” from earlier in the conversation is insufficient.

### 11. Install

Submit the plan token. Stream progress. On success, summarise APM's result and suggested Git review. On partial failure, do not claim rollback unless APM confirms it.

## Retry behaviour

- Preflight failures retry after remediation.
- Search may be refined without repeating deterministic analysis unless repository state changed.
- A stale plan returns to planning and selection review.
- A changed working tree after plan invalidates the plan.
- Cancellation never resumes installation automatically.

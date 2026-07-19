# Plugin Open Questions

**Status:** Living document

Only unresolved decisions belong here. A coding agent must not invent answers.

## Legal notices in standalone APM plugin bundles

APM 0.26 `apm pack` accepts agent primitives in `includes` and rejects
`README.md`, `LICENSE`, `NOTICE`, and `TRADEMARKS.md` as non-packable paths. Its
registry publication format separately includes the root license, and Forge's
preview marketplace resolves the licensed Git repository rather than a
standalone bundle.

Do not publish the output of `apm pack` as a standalone Forge distribution
until APM documents a way to include the required legal notices or Draigara has
reviewed another compliant packaging mechanism. This does not block source- or
marketplace-based preview consumption.

1. Which harness-native interactive selection facilities can be tested reliably in Claude Code, Codex, and GitHub Copilot CLI?
2. Which models form the behavioural evaluation matrix without coupling Forge semantics to one provider?
3. What repository document byte/token budget gives useful evidence without excessive context?
4. Can a harness safely retain current-session evidence across separate Forge invocations, or must explain remain within the initiating session?
5. Which immutable preview tag will be the first OpenAPM-published draigara-forge package?

Question 5 blocks production marketplace publication. Missing native selector APIs do not block the preview because the numbered conversational fallback preserves the same selection and confirmation semantics.

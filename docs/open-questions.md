# Plugin Open Questions

**Status:** Living document

Only unresolved decisions belong here. A coding agent must not invent answers.

1. Which harness-native interactive selection facilities can be tested reliably in Claude Code, Codex, and GitHub Copilot CLI?
2. Which models form the behavioural evaluation matrix without coupling Forge semantics to one provider?
3. What repository document byte/token budget gives useful evidence without excessive context?
4. Can a harness safely retain current-session evidence across separate Forge invocations, or must explain remain within the initiating session?
5. Which immutable preview tag will be the first OpenAPM-published draigara-forge package?

Question 5 blocks production marketplace publication. Missing native selector APIs do not block the preview because the numbered conversational fallback preserves the same selection and confirmation semantics.

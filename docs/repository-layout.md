# Plugin Repository Layout

```text
.
├── apm.yml                         # canonical APM package metadata
├── plugin.json                    # portable package identity
├── .mcp.json                      # portable forge mcp server declaration
├── .apm/
│   └── skills/forge/SKILL.md      # shared /forge workflow
├── docs/
│   ├── adr/
│   ├── architecture.md
│   └── implementation-plan.md
├── schemas/mcp/v1/                # pinned CLI-owned contract schemas
├── fixtures/mcp/v1/               # pinned CLI-owned golden fixtures
├── fixtures/adversarial/          # prompt-injection and candidate tests
└── tests/
    ├── contract/
    ├── behavioural/
    └── harness/
```

Generated harness outputs and packed artifacts are ignored. Harness adapters are added only for tested capability gaps and live beside their target-specific tests.

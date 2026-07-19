# Plugin Packaging and Release

`apm.yml` and `.apm/` are the source of truth. APM validates, previews, installs, and packs the package. Generated harness files are test outputs, not independently maintained sources.

The package is published as `draigara-forge` and installed from Draigara OpenAPM Community with `draigara-forge@draigara-openapm`. Releases use semantic versions and immutable Git tags. The OpenAPM entry pins a released version; local sibling paths are acceptance-test inputs only.

Because the package contains a self-defined plugin-native stdio MCP server, installation must surface APM's executable-trust decision. Forge never bypasses an organisation deny or silently grants trust.

A release must validate its allow-list, licence, provenance, MCP compatibility, APM 0.26.x compatibility, and every claimed preview target. It contains no Forge CLI binary or wrapper executable.

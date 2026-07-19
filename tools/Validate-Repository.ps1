$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$errors = [System.Collections.Generic.List[string]]::new()

foreach ($required in @(
    'apm.yml',
    'plugin.json',
    'NOTICE',
    'TRADEMARKS.md',
    '.mcp.json',
    '.apm/skills/forge/SKILL.md',
    'schemas/mcp/v1/forge-tools.schema.json',
    'fixtures/mcp/v1/environment-inspect.success.json',
    'fixtures/mcp/v1/marketplace-list.success.json',
    'fixtures/mcp/v1/repository-inspect.success.json',
    'fixtures/mcp/v1/repository-initialize.success.json',
    'fixtures/mcp/v1/marketplace-candidates.success.json',
    'fixtures/mcp/v1/installation-apply.success.json',
    'fixtures/mcp/v1/status.success.json',
    'fixtures/mcp/v1/evaluation-invalid.error.json'
)) {
    if (-not (Test-Path -LiteralPath (Join-Path $root $required))) { $errors.Add("Missing required package file: $required") }
}

$mcp = Get-Content -Raw -LiteralPath (Join-Path $root '.mcp.json') | ConvertFrom-Json
if (
    $mcp.mcpServers.'draigara-forge'.transport -ne 'stdio' -or
    $mcp.mcpServers.'draigara-forge'.command -ne 'forge' -or
    @($mcp.mcpServers.'draigara-forge'.args) -join ' ' -ne 'mcp'
) {
    $errors.Add('.mcp.json must declare stdio and launch exactly forge mcp')
}

$manifest = Get-Content -Raw -LiteralPath (Join-Path $root 'apm.yml')
$plugin = Get-Content -Raw -LiteralPath (Join-Path $root 'plugin.json') | ConvertFrom-Json
$license = Get-Content -Raw -LiteralPath (Join-Path $root 'LICENSE')
if ($manifest -notmatch '(?m)^license: Apache-2\.0$' -or $plugin.license -ne 'Apache-2.0') {
    $errors.Add('apm.yml and plugin.json must declare Apache-2.0')
}
if ($license -notmatch '^\s*Apache License\s+Version 2\.0, January 2004' -or $license -notmatch '7\. Disclaimer of Warranty\.' -or $license -notmatch '8\. Limitation of Liability\.') {
    $errors.Add('LICENSE must contain the official Apache License 2.0 terms')
}
if ($manifest -notmatch '(?m)^version: 0\.1\.0-preview\.0$' -or $plugin.version -ne '0.1.0-preview.0') {
    $errors.Add('apm.yml and plugin.json must agree on the preview version')
}
foreach ($required in @('name: draigara-forge', 'registry: false', 'transport: stdio', 'command: forge')) {
    if (-not $manifest.Contains($required)) { $errors.Add("apm.yml is missing required declaration: $required") }
}
if ($manifest -match '(?m)^includes:\s+auto$' -or -not $manifest.Contains('  - .apm/skills/forge')) {
    $errors.Add('apm.yml must include only the intentional Forge runtime skill, never includes: auto')
}

$schema = Get-Content -Raw -LiteralPath (Join-Path $root 'schemas/mcp/v1/forge-tools.schema.json') | ConvertFrom-Json
if ($null -eq $schema.'$defs'.toolRequest -or $null -eq $schema.'$defs'.installation) {
    $errors.Add('MCP schema must define both requests and all result families')
}

Get-ChildItem -LiteralPath (Join-Path $root 'fixtures/mcp/v1') -Filter '*.json' | ForEach-Object {
    try { Get-Content -Raw -LiteralPath $_.FullName | ConvertFrom-Json | Out-Null }
    catch { $errors.Add("Invalid JSON fixture: $($_.Name)") }
}

$active = @('README.md', 'AGENTS.md', 'PRODUCT-CONTEXT.md') + (Get-ChildItem (Join-Path $root 'docs') -File | ForEach-Object { "docs/$($_.Name)" })
foreach ($relative in $active) {
    $content = Get-Content -Raw -LiteralPath (Join-Path $root $relative)
    if ($content -match 'forge bridge v1|globally installed native executable|Native AOT|plugin/copilot|schemas/bridge|fixtures/protocol|plan.?token|Cursor|Gemini|OpenCode|Windsurf|Kiro|IntelliJ') {
        $errors.Add("$relative contains superseded plugin architecture")
    }
}

$legacyFiles = Get-ChildItem -LiteralPath (Join-Path $root 'plugin/copilot') -File -Recurse -ErrorAction SilentlyContinue
if ($legacyFiles.Count -gt 0) { $errors.Add('plugin/copilot contains obsolete files after the APM-native migration') }
$workflows = (Get-ChildItem -LiteralPath (Join-Path $root '.github/workflows') -Filter '*.yml' | ForEach-Object {
    Get-Content -Raw -LiteralPath $_.FullName
}) -join [Environment]::NewLine
if ($workflows -match 'cursor|gemini|opencode|windsurf|kiro|intellij') {
    $errors.Add('Workflows claim harnesses outside the Claude, Codex, and Copilot preview boundary')
}
if ($errors.Count -gt 0) { $errors | ForEach-Object { Write-Error $_ }; exit 1 }
Write-Output 'Forge plugin repository validation passed.'

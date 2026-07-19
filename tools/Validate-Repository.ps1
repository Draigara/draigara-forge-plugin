$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$errors = [System.Collections.Generic.List[string]]::new()

foreach ($required in @('apm.yml', 'plugin.json', '.mcp.json', '.apm/skills/forge/SKILL.md', 'schemas/mcp/v1/forge-tools.schema.json')) {
    if (-not (Test-Path -LiteralPath (Join-Path $root $required))) { $errors.Add("Missing required package file: $required") }
}

$mcp = Get-Content -Raw -LiteralPath (Join-Path $root '.mcp.json') | ConvertFrom-Json
if ($mcp.mcpServers.'draigara-forge'.command -ne 'forge' -or @($mcp.mcpServers.'draigara-forge'.args) -join ' ' -ne 'mcp') {
    $errors.Add('.mcp.json must launch exactly forge mcp')
}

$active = @('README.md', 'AGENTS.md', 'PRODUCT-CONTEXT.md') + (Get-ChildItem (Join-Path $root 'docs') -File | ForEach-Object { "docs/$($_.Name)" })
foreach ($relative in $active) {
    $content = Get-Content -Raw -LiteralPath (Join-Path $root $relative)
    if ($content -match 'forge bridge v1|globally installed native executable|plugin/copilot|schemas/bridge|fixtures/protocol') {
        $errors.Add("$relative contains superseded plugin architecture")
    }
}

$legacyFiles = Get-ChildItem -LiteralPath (Join-Path $root 'plugin/copilot') -File -Recurse -ErrorAction SilentlyContinue
if ($legacyFiles.Count -gt 0) { $errors.Add('plugin/copilot contains obsolete files after the APM-native migration') }
if ($errors.Count -gt 0) { $errors | ForEach-Object { Write-Error $_ }; exit 1 }
Write-Output 'Forge plugin repository validation passed.'

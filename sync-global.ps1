# Sync AGENTS.md to all global AI coding agent config locations on this machine
$ErrorActionPreference = "Stop"
$source = Join-Path $PSScriptRoot "AGENTS.md"

if (-not (Test-Path $source)) {
    throw "Source file not found: $source"
}

$targets = @(
    "$env:USERPROFILE\.gemini\config\plugins\agent-bootstrap\rules\AGENTS.md", # Antigravity (Global Plugin)
    "$env:USERPROFILE\.gemini\GEMINI.md",                                      # Gemini CLI
    "$env:USERPROFILE\.claude\CLAUDE.md",                                      # Claude Code
    "$env:USERPROFILE\.codex\AGENTS.md",                                       # OpenAI Codex CLI
    "$env:USERPROFILE\.copilot\copilot-instructions.md"                        # GitHub Copilot CLI
)

foreach ($target in $targets) {
    $dir = Split-Path -Parent $target
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
    }
    Copy-Item -Path $source -Destination $target -Force
    Write-Output "Synced -> $target"
}

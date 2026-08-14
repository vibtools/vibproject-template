[CmdletBinding()]
param(
    [switch]$DryRun
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Write-Step {
    param([string]$Message)
    Write-Host "`n==> $Message" -ForegroundColor Cyan
}

function Write-Ok {
    param([string]$Message)
    Write-Host "    [OK] $Message" -ForegroundColor Green
}

function Write-Skip {
    param([string]$Message)
    Write-Host "    [SKIP] $Message" -ForegroundColor Yellow
}

function Write-Change {
    param([string]$Message)
    if ($DryRun) {
        Write-Host "    [DRY-RUN] $Message" -ForegroundColor DarkYellow
    } else {
        Write-Host "    [CHANGE] $Message" -ForegroundColor Magenta
    }
}

function Ensure-Directory {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Root,
        [Parameter(Mandatory = $true)]
        [string]$RelativePath
    )

    $Path = Join-Path $Root $RelativePath

    if (Test-Path -LiteralPath $Path -PathType Container) {
        Write-Skip "$RelativePath/ already exists"
        return
    }

    if ($DryRun) {
        Write-Change "Create $RelativePath/"
        return
    }

    New-Item -ItemType Directory -Path $Path -Force | Out-Null
    Write-Change "Created $RelativePath/"
}

function Ensure-IgnoreRule {
    param(
        [Parameter(Mandatory = $true)]
        [string]$GitIgnore,
        [Parameter(Mandatory = $true)]
        [string]$Rule,
        [Parameter(Mandatory = $true)]
        [string]$Comment
    )

    $Content = if (Test-Path -LiteralPath $GitIgnore -PathType Leaf) {
        Get-Content -LiteralPath $GitIgnore -Raw
    } else {
        ''
    }

    $Lines = $Content -split "`r?`n"

    if ($Lines | Where-Object { $_.Trim() -eq $Rule }) {
        Write-Skip ".gitignore already contains $Rule"
        return
    }

    if ($DryRun) {
        Write-Change "Add $Rule to .gitignore"
        return
    }

    if ($Content.Length -gt 0 -and -not $Content.EndsWith("`n")) {
        Add-Content -LiteralPath $GitIgnore -Value '' -Encoding UTF8
    }

    Add-Content -LiteralPath $GitIgnore -Value "`n# VibProject fresh-project private workspace`n$Comment`n$Rule" -Encoding UTF8
    Write-Change "Added $Rule to .gitignore"
}

try {
    Write-Host ''
    Write-Host 'VibProject - Fresh Project Workspace Initializer' -ForegroundColor White
    Write-Host 'Git repository operations are intentionally NOT performed.' -ForegroundColor Gray

    if ([string]::IsNullOrWhiteSpace($PSScriptRoot)) {
        throw 'Unable to resolve the directory containing setup-project.ps1.'
    }

    $Root = (Resolve-Path -LiteralPath $PSScriptRoot).Path
    $GitIgnore = Join-Path $Root '.gitignore'
    Write-Ok "Resolved project root from script location: $Root"

    # This initializer is for a fresh source copy before Git initialization.
    # It deliberately refuses to alter any existing Git repository, including
    # the official Vib Project Template checkout and already-created projects.
    $GitMetadata = Join-Path $Root '.git'
    if (Test-Path -LiteralPath $GitMetadata) {
        throw @'
Existing .git metadata was detected in the project root.
This initializer only prepares a fresh source copy before manual Git initialization.
No files were changed. Remove/copy the template without Git metadata first, then run this script.
If project/ files are already tracked, .gitignore cannot untrack them automatically.
'@
    }

    Write-Step 'Validating VibProject template structure'

    $RequiredFiles = @(
        'README.md',
        'AGENTS.md',
        'PROJECT_STRUCTURE.md',
        'vibproject.ygit',
        'docs\docs.manifest.ygit',
        'project\README.md',
        'project\PROJECT_UPDATE_WORKFLOW.md'
    )

    $RequiredDirectories = @(
        'project',
        'docs',
        'src',
        'tests',
        'scripts',
        'assets'
    )

    foreach ($File in $RequiredFiles) {
        if (-not (Test-Path -LiteralPath (Join-Path $Root $File) -PathType Leaf)) {
            throw "Required template file not found: $File"
        }
        Write-Ok "$File found"
    }

    foreach ($Directory in $RequiredDirectories) {
        if (-not (Test-Path -LiteralPath (Join-Path $Root $Directory) -PathType Container)) {
            throw "Required template directory not found: $Directory"
        }
        Write-Ok "$Directory/ found"
    }

    Write-Step 'Preserving/preparing internal project/ workspace'

    $PrivateFolders = @(
        'project',
        'project\adr',
        'project\architecture',
        'project\planning',
        'project\research',
        'project\specifications'
    )

    foreach ($Folder in $PrivateFolders) {
        Ensure-Directory -Root $Root -RelativePath $Folder
    }

    Write-Step 'Checking public docs/ workspace'
    Write-Ok 'docs/ is preserved as the public/user documentation workspace'

    Write-Step 'Preparing fresh-project privacy rule'

    if (-not (Test-Path -LiteralPath $GitIgnore -PathType Leaf)) {
        if ($DryRun) {
            Write-Change 'Create .gitignore'
        } else {
            New-Item -ItemType File -Path $GitIgnore -Force | Out-Null
            Write-Change 'Created .gitignore'
        }
    }

    Ensure-IgnoreRule `
        -GitIgnore $GitIgnore `
        -Rule '/project/*' `
        -Comment '# Everything inside /project/ is private/local development data in this fresh project.'

    Write-Step 'Running final verification'

    foreach ($Directory in $RequiredDirectories) {
        if (-not (Test-Path -LiteralPath (Join-Path $Root $Directory) -PathType Container)) {
            throw "Verification failed: $Directory/ does not exist."
        }
    }
    Write-Ok 'Required directories exist'

    foreach ($File in $RequiredFiles) {
        if (-not (Test-Path -LiteralPath (Join-Path $Root $File) -PathType Leaf)) {
            throw "Verification failed: required file missing: $File"
        }
    }
    Write-Ok 'Required files exist'

    $IgnoreContent = if (Test-Path -LiteralPath $GitIgnore -PathType Leaf) {
        Get-Content -LiteralPath $GitIgnore -Raw
    } else {
        ''
    }

    if (($IgnoreContent -split "`r?`n") -contains '/project/*') {
        Write-Ok 'Fresh-project private rule is present in .gitignore'
    } elseif ($DryRun) {
        Write-Ok 'Fresh-project private rule will be added to .gitignore'
    } else {
        throw 'Verification failed: /project/* is missing from .gitignore.'
    }

    Write-Host ''
    Write-Host 'Setup completed successfully.' -ForegroundColor Green
    Write-Host '  project/ = PRIVATE internal workspace for this fresh project' -ForegroundColor Yellow
    Write-Host '  docs/    = PUBLIC user documentation' -ForegroundColor Green
    Write-Host ''
    Write-Host 'No Git commands were executed.' -ForegroundColor Gray
    Write-Host 'Git initialization, staging, commits, remotes and pushes remain manual.' -ForegroundColor Gray
    exit 0
}
catch {
    Write-Host ''
    Write-Host "Setup failed: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host 'No Git commands were executed.' -ForegroundColor Gray
    exit 1
}

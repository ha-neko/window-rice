# 1. Run Fastfetch using its full path from the D: drive
& "D:\codingan\fastfetch.exe"

# Ensure the new version is loaded
Import-Module PSReadLine

# 2. Manually set the environment variable for Oh My Posh themes
$env:POSH_THEMES_PATH = "D:\codingan\omposh_themes\"

# 3. Initialize Oh My Posh to load the aesthetic prompt (Pointing to your custom theme)
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\reimu_warm.omp.json" | Invoke-Expression

# --- Modern CLI Integrations (Zoxide, Eza, Bat) ---

# Initialize Zoxide (Smarter cd) - Force full string evaluation
if (Get-Command zoxide -ErrorAction SilentlyContinue) {
    Invoke-Expression $(zoxide init powershell | Out-String)
}

# Aliases for Eza (Modern ls)
if (Get-Command eza -ErrorAction SilentlyContinue) {
    function ls_eza { eza --icons --git --group-directories-first $args }
    function la_eza { eza --icons --git --all --long --group-directories-first $args }
    function tree_eza { eza --icons --tree --level=2 $args }
    
    # Bypass AllScope lock by deleting the old alias from the drive provider first
    if (Test-Path Alias:\ls) { Remove-Item Alias:\ls -Force }
    if (Test-Path Alias:\la) { Remove-Item Alias:\la -Force }
    
    Set-Alias ls ls_eza -Force
    Set-Alias la la_eza -Force
    Set-Alias tree tree_eza -Force
}

# Aliases for Bat (Syntax highlighted cat)
if (Get-Command bat -ErrorAction SilentlyContinue) {
    # Bypass AllScope lock for cat
    if (Test-Path Alias:\cat) { Remove-Item Alias:\cat -Force }
    
    Set-Alias cat bat -Force
}

# --- Development Shortcuts ---

function jcompile {
    param([string]$File)
    if (-not $File) { Write-Host "Usage: jc <FileName.java>" -ForegroundColor Yellow; return }
    javac "D:\codingan\project\java\$File"
}
Set-Alias jc jcompile

function jrun {
    param([string]$Class)
    if (-not $Class) { Write-Host "Usage: jr <ClassName>" -ForegroundColor Yellow; return }
    # Run Java with classpath pointing to your folder
    java -cp "D:\codingan\project\java" $Class
}
Set-Alias jr jrun

# --- Fish-like Features ---

# Enable predictive text (Ghost text like Fish)
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle InlineView

# Set the prediction color (Menggunakan warna Muted Brown #4A3B31 agar senada namun tetap kontras)
Set-PSReadLineOption -Colors @{ InlinePrediction = '#4a3b31' }

# Syntax highlighting: Reimu Warm Theme Integration
Set-PSReadLineOption -Colors @{
    Command   = "#E84D3D"  # Vibrant Red (Utama)
    Parameter = "#F56858"  # Brighter Red
    Operator  = "#D4C4A3"  # Tan/Gold 
    String    = "#D4C4A3"  # Tan/Gold Secondary Text
    Default   = "#FFF5E6"  # Off-White untuk teks ketikan default
}

# Tab auto completion & Grid Menu Selection (Like Fish/Zsh)
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
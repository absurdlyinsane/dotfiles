# ============================================================
# PowerShell Profile
# ============================================================

$PROFILE = "Insane"

# --------------------------------------------
# 1. PATH Management (with duplication prevention)
# --------------------------------------------

# Define paths you want to add (EDIT THESE 2)
$additionalPaths = @(
	"C:\Program Files\vcpkg"
	"C:\Program Files\CMake\bin"
	"F:\Programs\GraalVM\bin"
	"F:\Programs\Gradle\bin"
    "C:\Users\insane\AppData\Roaming\Python\Python314"
	"C:\Users\insane\AppData\Roaming\Python\Python314\Scripts"
	"C:\Program Files\Python314"
	"C:\Program Files\Python314\Scripts"
    "C:\Program Files\Kate\bin"
)

# Add each path only if not already present
foreach ($path in $additionalPaths) {
    if (Test-Path $path) {
        if ($env:PATH -notlike "*$path*") {
            $env:PATH += ";$path"
        }
    } else {
        Write-Host "Warning: Path not found - $path" -ForegroundColor Yellow
    }
}

# Optionally deduplicate entire PATH (cleans up existing duplicates)
# Uncomment the line below if you want to clean all duplicates
# $env:PATH = ($env:PATH -split ';' | Select-Object -Unique) -join ';'


# --------------------------------------------
# 2. Compiler Environment (INCLUDE & LIB)
# --------------------------------------------

$env:INCLUDE = @(
    "C:\msvc-kit\VC\Tools\MSVC\14.44.35207\include",
    "C:\msvc-kit\Windows Kits\10\Include\10.0.26100.0\ucrt",
    "C:\msvc-kit\Windows Kits\10\Include\10.0.26100.0\shared",
    "C:\msvc-kit\Windows Kits\10\Include\10.0.26100.0\um",
    "C:\msvc-kit\Windows Kits\10\Include\10.0.26100.0\winrt"
) -join ";"

$env:LIB = @(
    "C:\msvc-kit\VC\Tools\MSVC\14.44.35207\lib\x64",
    "C:\msvc-kit\Windows Kits\10\Lib\10.0.26100.0\ucrt\x64",
    "C:\msvc-kit\Windows Kits\10\Lib\10.0.26100.0\um\x64"
) -join ";"

$env:PATH = "C:\msvc-kit\VC\Tools\MSVC\14.44.35207\bin\Hostx64\x64;C:\msvc-kit\Windows Kits\10\bin\10.0.26100.0\x64;$env:PATH"

$env:VCPKG_VISUAL_STUDIO_PATH = "C:\msvc-kit"


# --------------------------------------------
# 3. Aliases (EDIT THESE 2)
# --------------------------------------------

Set-Alias -Name g -Value git
Set-Alias -Name cl -Value cl.exe


# --------------------------------------------
# 4. Custom Prompt (optional)
# --------------------------------------------

# Uncomment for a simplified prompt showing current directory
# function prompt {
#     "PS $($ExecutionContext.SessionState.Path.CurrentLocation)> "
# }


# --------------------------------------------
# 5. Startup Message (optional)
# --------------------------------------------
#Write-Host "Profile loaded: $PROFILE" -ForegroundColor Cyan

param(
    [ValidateSet('web', 'desktop', 'check')]
    [string]$Mode = 'web'
)

$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot
$toolsDir = Join-Path (Split-Path $PSScriptRoot -Parent) 'tools'
$localJdk = Get-ChildItem $toolsDir -Directory -Filter 'jdk-17*' -ErrorAction SilentlyContinue | Select-Object -First 1
if ($localJdk) {
    $env:JAVA_HOME = $localJdk.FullName
}
if (-not $env:JAVA_HOME -or -not (Test-Path "$env:JAVA_HOME\bin\javac.exe")) {
    throw 'Java JDK 17 fehlt. Bitte JAVA_HOME auf ein JDK 17 setzen.'
}
$env:PATH = "$env:JAVA_HOME\bin;$env:PATH"
$localGradle = Join-Path $toolsDir 'gradle-9.4.1\bin\gradle.bat'
$gradle = if (Test-Path $localGradle) { $localGradle } else { Join-Path $PSScriptRoot 'gradlew.bat' }

switch ($Mode) {
    'web' {
        Write-Host 'GeoGebra Web startet. Danach http://localhost:8888/graphing.html oeffnen.'
        & $gradle -p source/web :web:run --console=plain
    }
    'desktop' { & $gradle -p source/desktop :desktop:run --console=plain }
    'check' { & $gradle -p source/web :web:classes --console=plain }
}
exit $LASTEXITCODE

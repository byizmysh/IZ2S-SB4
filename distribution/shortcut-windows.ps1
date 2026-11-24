param([Parameter(Mandatory=$true)][string]$Root)
$ErrorActionPreference = 'Stop'
$Shell = New-Object -ComObject WScript.Shell
$Menu = Join-Path ([Environment]::GetFolderPath('Programs')) 'IZ2S SB4'
New-Item -ItemType Directory -Force -Path $Menu | Out-Null
$Desktop = [Environment]::GetFolderPath('DesktopDirectory')
New-Item -ItemType Directory -Force -Path $Desktop | Out-Null
foreach ($Folder in @($Menu,$Desktop)) {
  $Link = $Shell.CreateShortcut((Join-Path $Folder 'IZ2S SB4.lnk'))
  $Link.TargetPath = Join-Path $env:SystemRoot 'System32\wscript.exe'
  $Link.Arguments = '//Nologo "'+(Join-Path $Root 'Start.vbs')+'"'
  $Link.IconLocation = (Join-Path $Root 'desktop\iz2s.ico')+',0'
  $Link.WorkingDirectory = $Root
  $Link.Description = 'Open IZ2S SB4 in a browser window'
  $Link.Save()
}

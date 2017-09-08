$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://sebastienlebreton.gallerycdn.vsassets.io/extensions/sebastienlebreton/visualstudio2015toolsforunity/3.3.0.2/1502836519772/142077/18/vstu2015.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url

  softwareName  = 'Microsoft Visual Studio 2015 Tools for Unity'

  checksum      = '04262AA46B9FFC6ED3BA28CF45D7B78D24E1604B0C9E6B3C5CE721AF9B139A8E'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

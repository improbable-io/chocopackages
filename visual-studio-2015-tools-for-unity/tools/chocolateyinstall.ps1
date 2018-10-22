$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://sebastienlebreton.gallerycdn.vsassets.io/extensions/sebastienlebreton/visualstudio2015toolsforunity/3.8.0.7/1537824503275/vstu2015.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url

  softwareName  = 'Microsoft Visual Studio 2015 Tools for Unity'

  checksum      = '8faabccbb349d6f7fca0db6b9301efb500bce1c251d877e974d7b3cec9286c6e'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

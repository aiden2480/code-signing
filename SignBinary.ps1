$signToolLocation = "C:\Program Files (x86)\Windows Kits\10\bin\10.0.22000.0\x64\signtool.exe"
$outputBinaryLocation = "output/Executable.exe"
$outputBinaryDescription = "Sample binary"
$outputPfxFile = "output/cert.pfx"

$password = Read-Host -Prompt "Enter password to sign the binary" -AsSecureString

& $signToolLocation sign 
    /f $outputPfxFile
    /d $outputBinaryDescription
    /p $password
    /tr "http://timestamp.digicert.com"
    /td sha256
    /fd sha256
    /debug
    $outputBinaryLocation

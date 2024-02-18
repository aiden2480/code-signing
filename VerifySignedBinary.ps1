$outputBinaryLocation = "output/Executable.exe"

Get-AuthenticodeSignature -FilePath $outputBinaryLocation | Format-List -Property *

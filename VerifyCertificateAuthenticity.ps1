$outputPfxFile = "output/cert.pfx"

Get-PfxCertificate -FilePath $outputPfxFile | Format-List -Property *

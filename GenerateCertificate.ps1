$outputPath = "output"
$tempCerFile = "$outputPath/exported_cert.cer"
$outputPfxFile = "$outputPath/cert.pfx"
$outputB64File = "$outputPath/cert-base64.txt"

# # Remove old files
# if(Test-Path -PathType container $outputPath) {
#     Get-ChildItem -Path $outputPath | Remove-Item -Force -Recurse
# } else {
#     New-Item -ItemType Directory -Path $outputPath
# }

# Define parameters of the certificate
$Params = @{    
	Subject           = "CN=Test Code Certificate"
	FriendlyName      = "Test Code Certificate"
	NotAfter          = [datetime]::now.AddYears(10)

	Type              = "CodeSigningCert"
	KeySpec           = "Signature"
	KeyUsage          = "DigitalSignature"
	CertStoreLocation = "Cert:\CurrentUser\My"
}

$cert = New-SelfSignedCertificate @Params

# The certificate must be imported so this computer trusts it - click yes when prompted
Export-Certificate -FilePath $tempCerFile -Cert $cert
Import-Certificate -FilePath $tempCerFile -CertStoreLocation "Cert:\CurrentUser\Root"

# Create a password which must be used when signing
$password = Read-Host -Prompt "Enter password to create the certificate" -AsSecureString

# Export to a pfx file and base64
Export-PfxCertificate `
	-Cert $cert `
	-FilePath $outputPfxFile `
	-Password $password

CertUtil.exe -encode $outputPfxFile $outputB64File

# Don't need this anymore
Remove-Item $tempCerFile -ErrorAction SilentlyContinue

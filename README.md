# code-signing
A set of powershell scripts to create and verify self-signed code certificates

```powershell
# To allow running the following scripts
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process

# Confirm the binary is unsigned. The console should contain the following lines
# Status                 : NotSigned
# StatusMessage          : The file ...\Executable.exe is not digitally signed.
.\VerifySignedBinary.ps1

# Generate certificate with password
# A security warning will pop up, click yes to trust the certificate we just created
# Create a password for the certificate when prompted
.\GenerateCertificate.ps1

# Verify that the certificate was created successfully
# Enter the password you just created
.\VerifyCertificateAuthenticity.ps1

# Attempt to sign the binary
# Enter the password you just created. Confirm the following console output:
# Number of files successfully Signed: 1
.\SignBinary.ps1

# Confirm the binary is signed and verified with the following console output:
# Status                 : Valid
# StatusMessage          : Signature verified.
.\VerifySignedBinary.ps1
```

# code-signing
A set of powershell scripts to create and verify self-signed code certificates

```powershell
# Confirm the binary is unsigned
.\VerifySignedBinary.ps1

# Generate certificate with password
.\GenerateCertificate.ps1

# Verify that the certificate was created successfully
.\VerifyCertificateAuthenticity.ps1

# Attempt to sign the binary
.\SignBinary.ps1

# Confirm the binary is signed and verified
.\VerifySignedBinary.ps1
```

@echo off

REM Generate .cat from .inf
"C:\Program Files (x86)\Windows Kits\10\bin\x86\inf2cat" /v /driver:%~dp0 /os:Vista_X86,Vista_X64,7_X86,7_X64,8_X86,8_X64,6_3_X86,6_3_X64,10_X86,10_X64

REM Sign the .cat file
REM This includes the MS cross certificate, which is a signature by MS of the AddTrust root certificate
REM to tell Windows systems that AddTrust is valid for kernel-mode drivers. This only works if the entire
REM chain up to the AddTrust root is present in the Windows certificate store. It seems that some versions
REM of Windows contain an older version of the Comodo root, which is not yet signed by AddTrust. Importing
REM all .crt files from the certificates directory fixes this.
REM This command needs the private key for the actual signing to be present in a pfx file, with the password
REM set to "password".
"C:\Program Files (x86)\Windows Kits\10\bin\x86\signtool" sign /ac "certificates/AddTrust MS cross.crt" /v /f certificates/3devo.pfx /p password /fd sha256 /tr http://timestamp.comodoca.com/?td=sha256 /td sha256 3devo-signature.cat

REM Verify if this signature chain is ok for kernel mode drivers
"C:\Program Files (x86)\Windows Kits\10\bin\x86\signtool" verify /kp /v 3devo-signature.cat

pause 
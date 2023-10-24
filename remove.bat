rem
rem this bat file will set up the required permissions to use ssh on windows
rem when ssh-keygen is used the create the key pair the correct permisions are assigned but when
rem downloaded from ec2 (and Azure) they are just text files and thier permissions are too broad to use
rem

rem we need to remove inheriance from the permissions set
icacls  %1 /inheritance:d

rem remove the permissions that are too broad
icacls  %1 /remove:g BUILTIN\Users
icacls  %1 /remove:g "NT AUTHORITY\Authenticated Users"

rem these 2 permissions are left intact when ssh-keygen is used, but if they cause trouble remove the rem at the start 

rem icacls  %1 /remove:g BUILTIN\Administrators
rem icacls  %1 /remove:g "NT AUTHORITY\SYSTEM"

rem ssh-keygen give explicit permissions to the current user. This looks not to be needed but for consistency I'll leave it in
icacls  %1 /grant %USERNAME%:(M)

rem what ya got ?
icacls %1

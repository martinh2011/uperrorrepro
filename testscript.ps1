[System.Reflection.Assembly]::LoadWithPartialName("System.DirectoryServices.AccountManagement")
$pc = new-object "System.DirectoryServices.AccountManagement.PrincipalContext" -ArgumentList Machine
# this should return a UserPrincipal object
[System.DirectoryServices.AccountManagement.UserPrincipal]::FindByIdentity($pc, "Administrator")|gm


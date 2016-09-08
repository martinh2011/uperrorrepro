# Windows Container UserPrincipal Error Reproduction Scenario

When running the following on a Windows Server 2016 TP5 Core system it returns a UserPrincipal object as expected.

    [System.Reflection.Assembly]::LoadWithPartialName("System.DirectoryServices.AccountManagement")
    $pc = new-object "System.DirectoryServices.AccountManagement.PrincipalContext" -ArgumentList Machine
    # this should return a UserPrincipal object
    [System.DirectoryServices.AccountManagement.UserPrincipal]::FindByIdentity($pc, "Administrator")|gm

Doing the same inside a Windows Server Core Container on Windows Server 2016 TP5 fails with exception:

> Exception calling "FindByIdentity" with "2" argument(s): "The Server service is not started.

It is not possible to start the server service. 

    start-service server
    
fails with 

> Failed to start service 'server (lanmanserver'

Eventlog does not have anything useful, just

> The Server service terminated with the following error:%%2


## Reproduction
Use this repository to build a container image 
    
    docker build -t uperrorrepro
    
Run it

    docker run -it uperrorrepro
    

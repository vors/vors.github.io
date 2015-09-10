---
layout: post
title: "Difference between RequiredVersion and ModuleVersion"
date: 2015-09-10 00:00:00 -0700
comments: true
categories: [powershell, dsc]
---

Difference between RequiredVersion and ModuleVersion
--------------------

## PowerShell modules versioning

Modules are the way to package logic in PowerShell. 
Simple.
Modules are shared, published to the gallery, developed and naturually evolve.
Which means that they can have breaking changes.
You don't want them in your production, do you?

## ModuleSpecification

When you reference to a module in some way (i.e. `Get-Module`, `Import-Module`, `Import-DscResouce -ModuleName`, `Get-DscResource -Module`)
you can provide **FullyQuilifiedName** or **ModuleSpecification**.

It can be one of two things:

1. **[string]**, i.e. `"xExchange"` ([xExchange](https://github.com/PowerShell/xExchange))
1. **[hashtable]** with module name and version.
   1. `@{ModuleName = "xExchange"; ModuleVersion = "1.1.0.0"}`
   1. `@{ModuleName = "xExchange"; RequiredVersion = "1.1.0.0"}`

## RequiredVersion vs ModuleVersion

Why do we have two of them and what's the difference?
I found [some info](https://technet.microsoft.com/en-us/%5Clibrary/Hh857339.aspx) in a release notes

> Windows PowerShell 5.0 implements support for multiple versions of a single Windows PowerShell module in the same folder in $PSModulePath. A RequiredVersion property has been added to the ModuleSpecification class to help you get the desired version of a module; this property is mutually-exclusive with the ModuleVersion property. RequiredVersion is now supported as part of the value of the FullyQualifiedName parameter of the Get-Module, Import-Module, and Remove-Module cmdlets.

It doesn't explain the difference, but we can find it out from an experement.

### Experiment

Let's get both modules from [PowerShellGallery](http://www.powershellgallery.com/)

```powershell
Find-Module xExchange -AllVersions | ? {$_.Version -eq '1.1.0.0' -or $_.Version -eq '1.2.0.0'} | Install-Module
```

Now, let try all mentioned variations

```
PS> Get-Module -ListAvailable -FullyQualifiedName 'xExchange'

Directory: C:\Program Files\WindowsPowerShell\Modules

ModuleType Version    Name                                ExportedCommands                              
---------- -------    ----                                ----------------                              
Manifest   1.2.0.0    xExchange                                                                         
Manifest   1.1.0.0    xExchange 

PS> Get-Module -ListAvailable -FullyQualifiedName @{ModuleName = 'xExchange'; ModuleVersion = "1.1.0.0"}

Directory: C:\Program Files\WindowsPowerShell\Modules

ModuleType Version    Name                                ExportedCommands                              
---------- -------    ----                                ----------------                              
Manifest   1.2.0.0    xExchange                                                                         
Manifest   1.1.0.0    xExchange                                                                         


PS> Get-Module -ListAvailable -FullyQualifiedName @{ModuleName = 'xExchange'; RequiredVersion = "1.1.0.0"}


Directory: C:\Program Files\WindowsPowerShell\Modules

ModuleType Version    Name                                ExportedCommands                              
---------- -------    ----                                ----------------                              
Manifest   1.1.0.0    xExchange      

```

The output is different: **ModuleVersion** query returns both 1.1.0.0 and 1.2.0.0.
Let's try to query version '1.2.0.0'

```
PS> Get-Module -ListAvailable -FullyQualifiedName @{ModuleName = 'xExchange'; ModuleVersion = "1.2.0.0"}


    Directory: C:\Program Files\WindowsPowerShell\Modules


ModuleType Version    Name                                ExportedCommands                              
---------- -------    ----                                ----------------                              
Manifest   1.2.0.0    xExchange                                                                         


PS> Get-Module -ListAvailable -FullyQualifiedName @{ModuleName = 'xExchange'; RequiredVersion = "1.2.0.0"}


    Directory: C:\Program Files\WindowsPowerShell\Modules


ModuleType Version    Name                                ExportedCommands                              
---------- -------    ----                                ----------------                              
Manifest   1.2.0.0    xExchange      
```

Now query return the same results.

## Conclusion

**RequiredVersion** really sticks to a **particular version**. 

**ModuleVersion** returns all versions that are **equal or higher**.

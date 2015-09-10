---
layout: post
title: "Difference between RequiredVersion and ModuleVersion"
date:2015-09-10 00:00:00 -0700
comments: true
categories: [powershell, dsc]
---

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
Let's get both modules from [PowerShellGallery](http://www.powershellgallery.com/)

```powershell
Find-Module xExchange -AllVersions | ? {$_.Version -eq '1.1.0.0' -or $_.Version -eq '1.2.0.0'} | Install-Module
```

Now, let try all mentioned variations

```text
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

Interesting, let's try to query version '1.2.0.0'

```text
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

## Conclusion

**RequiredVersion** really sticks to a **particular version**. 

**ModuleVersion** returns all versions that are **equal or higher**.

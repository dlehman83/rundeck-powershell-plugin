# rundeck-powershell-plugin

## Description

A [Rundeck Node Executor](http://rundeck.org/docs/plugins-user-guide/node-execution-plugins.html) plugin that allow to execute commands on local or remote nodes via native PowerShell.

Tested on Server Windows Server 2019/2022 with [Rundeck](http://rundeck.org) 4.6.0

The idea is to replace the PyWinRM  plugin with the native Windows PowerShell implementation. 

If PowerShell remoting is setup in your domain, no additional configuration is needed.  

Uses combination of Invoke-Command, Copy-Item and New-PSSession

This is a rough conversion from the Linux version.  it needs a lot more logging and error handling, but it works.  

This plugin can handle  remote commands, inline scripts and file / url paths.

## Installation

* Copy the zip file to $RDECK_BASE/libext
* Edit your project and select "Powershell Executor" as the default node executor and "Powershell script runner" as the Default Node Copier
* In the Default Node Executor section add the username and password Keystore (only used when invoking commands against a remote host) and select the Authentication Type.
* For the work flow steps that need it set Invocation String to PowerShell and File Extension to ps1

## Credits

Much of this work has been inspired by the [Rundeck Telnet Plugin](https://github.com/adomaceo/telnet-plugin) and the [Rundeck WinRM Plugin](https://github.com/rundeck-plugins/rundeck-winrm-plugin)

Updated / converted to run in a windows domain environment from [giordyb/rundeck-powershell-plugin](https://github.com/giordyb/rundeck-powershell-plugin)

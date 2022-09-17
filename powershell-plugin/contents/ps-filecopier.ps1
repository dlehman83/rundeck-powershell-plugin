
#Script needed to handle the running of scripts: the generated script file is not uploaded on the remote node but instead invoke-command is launched with the -filepath option
Param(
    $Filepath,
    $Destpath
)

#get username from config and password from key storage, convert to credential object
	$PlainPassword = $ENV:RD_CONFIG_PASS
	$SecurePassword = ConvertTo-SecureString $PlainPassword -AsPlainText -Force
	$Credentials = New-Object System.Management.Automation.PSCredential -ArgumentList $ENV:RD_CONFIG_USER, $SecurePassword

	
	 #copy the file though a session using above creds
	 copy-item -Path  $Filepath -Destination  $Destpath -ToSession (New-PSSession -ComputerName $ENV:RD_NODE_HOSTNAME -Credential $Credentials -Authentication $ENV:RD_CONFIG_AUTHTYPE)


 

<#
This is a small script to pull the latest complete logs from Polycom RMX using WinSCP.Replace the HostName,UserName and Password with that of 
your own setup. Also modify the LoadFrom path to your own directory where WinSCP is located and also modify the DestinationPath as per your
PC to write the logs output.
#>

[Reflection.Assembly]::LoadFrom(“C:\Users\kpoondichetlur\Desktop\Automation CMC\WinSCP-5.15.2-Automation\WinSCPnet.dll”) | Out-Null

$sessionOptions = New-Object WinSCP.SessionOptions
$sessionOptions.Protocol = [WinSCP.Protocol]::Scp
$sessionOptions.HostName = "10.250.129.241" 
$sessionOptions.UserName = "rt3p1aa"
$sessionOptions.Password = "1z56tcp"

$sessionOptions.GiveUpSecurityAndAcceptAnySshHostKey = $true

$session = New-Object WinSCP.Session

$session.Open($sessionOptions)


$transferOptions = New-Object WinSCP.TransferOptions
$transferOptions.TransferMode = [WinSCP.TransferMode]::Binary

$SourcePath = "/output/log" 
$DestinationPath = "C:\Users\kpoondichetlur\Desktop\test"

$session.GetFiles("$SourcePath", "$DestinationPath", $False, $transferOptions)

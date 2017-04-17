$ErrorActionPreference ="Inquire"
Import-Module SSH-Sessions

$date = "$(get-date -f yyyy-MM-dd)"
$filename = 'config.txt'
#$ext = 'txt'
$filepath ='output\'

#list of IP addresses, one per line. No whitespace before/after
$list = Get-Content .\input\IP.txt

#username
$user = 'foobar'

#password
$pass = 'test'

#ip address
$ip = '192.168.0.222'

New-SshSession $list -Username $user -KeyFile C:\scripts\1024sshpriv.key
#New-SshSession $ip -Username $user -Password "$pass"

$cmd = "more system:running-config"

#Invoke-Sshcommand -InvokeOnAll -Command "$cmd" | Out-File "$filepath$filename-$date$ext"
Invoke-Sshcommand -InvokeOnAll -Command "$cmd" | Out-File "$filepath$filename"

Remove-SshSession -RemoveAll
exit
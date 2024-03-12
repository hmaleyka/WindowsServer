#create 100 users in indows server powershell

$password = ConvertTo-SecureString "P@ssw0rd" -AsPlainText -Force
 
for ($i = 1; $i -le 100; $i++) {
    $username = "User$i"
    $displayName = "User $i"
    $email = "user$i@example.com"
    $userPrincipalName = "user$i@example.com"
 
    New-ADUser -Name $displayName -SamAccountName $username -UserPrincipalName $userPrincipalName -DisplayName $displayName -EmailAddress $email -Acc
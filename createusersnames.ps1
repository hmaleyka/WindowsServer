#creae users with human names

$ouPath = "CN=Computers,DC=maleykaheybatova,DC=group3"
$defaultPassword = ConvertTo-SecureString "Windows2019" -AsPlainText -Force

for ($i = 6; $i -le 20; $i++) {
    $computerName = "GYD-DC-$('{0:D2}' -f $i)"
    
    $newComputer = New-ADComputer -Name $computerName -Path $ouPath -PassThru
    
    # DNS adını ayarla
    $dnsName = "$computerName.maleykaheybatova.group3"
    Set-ADComputer -Identity $newComputer -DNSHostName $dnsName
    
    # İşletim sistemi adını ayarla
    $osName = "Windows Server 2019 Datacenter"
    Set-ADComputer -Identity $newComputer -OperatingSystem $osName
    
    # Parolayı ayarla
    Set-ADAccountPassword -Identity $newComputer -Reset -NewPassword $defaultPassword -PassThru
}
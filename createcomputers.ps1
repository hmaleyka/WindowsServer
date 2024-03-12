# Import the Active Directory module
Import-Module ActiveDirectory

# Define the OU path where the computers will be created
# Adjust the domain name 'DC=domain,DC=com' as per your domain
$ouPath = "OU=Computers,OU=Marketing,DC=maleykaheybatova,DC=group3"

# Define the prefix for the computer names
$computerNamePrefix = "FinancePC"

# Specify the number of computers to create
$numberOfComputers = 800

for ($i = 1; $i -le $numberOfComputers; $i++) {
    # Generate the computer name with a sequential number
    $computerName = "$computerNamePrefix$i"

    # Create the computer account in Active Directory
    New-ADComputer -Name $computerName -Path $ouPath -Enabled $true -SamAccountName $computerName -Description "Finance department computer $i"

    Write-Host "Created computer: $computerName in the OU: $ouPath"
}

Write-Host "Completed creating $numberOfComputers computers in $ouPath"

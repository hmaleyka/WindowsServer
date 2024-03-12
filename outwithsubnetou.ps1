# Function to create Organizational Units (OUs)
 # Ensure the Active Directory module is loaded
 Import-Module ActiveDirectory

 # Define the base DN (Distinguished Name) where the new OUs will be created
 # Example DN: "DC=example,DC=com"
 $baseDN = "DC=maleykaheybatova,DC=group3"
 
 # Define an array of department names to create OUs for
 $departments = @("HR", "Finance", "IT", "Sales", "Marketing", "CustomerSupport", "RnD", "Production", "QualityAssurance", "Logistics", "Legal", "Procurement", "HR", "Training", "Administration")
 
 # Loop through each department and create the main OU and sub-OUs for Users and Computers
 foreach ($dept in $departments) {
     $departmentOU = "OU=$dept,$baseDN"
     $usersOU = "OU=Users,$departmentOU"
     $computersOU = "OU=Computers,$departmentOU"
 
     # Create the main department OU
     New-ADOrganizationalUnit -Name $dept -Path $baseDN -ProtectedFromAccidentalDeletion $true
 
     # Create the Users sub-OU
     New-ADOrganizationalUnit -Name "Users" -Path $departmentOU -ProtectedFromAccidentalDeletion $true
 
     # Create the Computers sub-OU
     New-ADOrganizationalUnit -Name "Computers" -Path $departmentOU -ProtectedFromAccidentalDeletion $true
 
     Write-Output "Created OUs for $dept department: Users and Computers."
 }
 
 Write-Output "All departmental OUs and sub-OUs have been created successfully."
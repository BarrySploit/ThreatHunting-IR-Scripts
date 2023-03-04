#If smartcard user is suspected to be compromised, to mitigate pass-the-hash, reset the force smartcard usage.
#This will change the hash of the user account, but still allow the user to continue use of their smartcard

param($User, [switch]$AllUsers)
if ($PSBoundParameters.ContainsKey('User') -eq $false){
    if ($PSBoundParameters.ContainsKey('AllUsers') -eq $false){
        $user = Read-Host -Prompt "What user do you want to reset their password/smartcard hash?"}
        Write-Host "Resetting smartcard hash for" $user
        Set-ADUser -Identity $user -SmartcardLogonRequired $true
        Set-ADUser -Identity $user -SmartcardLogonRequired $false
        Set-ADUser -Identity $user -SmartcardLogonRequired $true
        Write-Host "Completed"
    }
    elseif ($PSBoundParameters.ContainsKey('AllUsers') -eq $true){
        $users = Get-ADUser -Filter *
        foreach ($i in $users){
            Write-Host "Resetting smartcard hash for" $i
            Set-ADUser -Identity $user -SmartcardLogonRequired $true
            Set-ADUser -Identity $user -SmartcardLogonRequired $false
            Set-ADUser -Identity $user -SmartcardLogonRequired $true
            Write-Host "Complete"
        }
    }
elseif ($PSBoundParameters.ContainsKey('User') -eq $true) {
    Write-Host "Resetting smartcard hash for" $user
    Set-ADUser -Identity $user -SmartcardLogonRequired $true
    Set-ADUser -Identity $user -SmartcardLogonRequired $false
    Set-ADUser -Identity $user -SmartcardLogonRequired $true
    Write-Host "Completed"
}
else{
    Write-Host "An error has occurred. Please check your options and try again."}
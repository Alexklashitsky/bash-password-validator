$userInput = Read-Host -Prompt 'Input the password'
Write-Host "the user name is" $userInput
$len = $userInput. Length
Write-Host $len
if ($len -gt 9) {
    if ($userInput -match '\d') {
        if ($userInput -cmatch "[A-Z]") {
            if ($userInput -cmatch "[a-z]") {
                Write-Host "great"
            }
            else {
                Write-Host "the password does not contain samll lettars"
            }
            
        }
        else {
            Write-Host "the password does not contain capital lettars"
        }
        
    }
    else {
        Write-Host "no digets in the password"
    }
    
}
else {
    Write-Host "the password is to shot"
}
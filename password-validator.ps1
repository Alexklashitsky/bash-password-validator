$userInput = Read-Host -Prompt 'Input the password' #user input
Write-Host "the user name is" $userInput
$len = $userInput. Length
Write-Host $len 
#pass lenght chek
if ($len -gt 9) {
    if ($userInput -match '\d') { 
        #password chek for numbers 
        if ($userInput -cmatch "[A-Z]") {
            #password chek for capital lettars
            if ($userInput -cmatch "[a-z]") {
                #password chek for small lettars
                Write-Host "great" -fore green
            }
            else {
                Write-Host "the password does not contain samll lettars" -fore red
                Exit 1
            }
            
        }
        else {
            Write-Host "the password does not contain capital lettars" -fore red
            Exit 1
        }
        
    }
    else {
        Write-Host "no digets in the password" -fore red
        Exit 1
    }
    
}
else {
    Write-Host "the password is to short" -fore red
    Exit 1
}
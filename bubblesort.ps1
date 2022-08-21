$inputArray = 1..9 | % { Get-Random -Minimum 1 -Maximum 9}
Write-Host $inputArray

[int] $varLength    = $inputArray.Length
[bool] $swapped     = $false

while ($varLength -gt 0) {
    
    for ($i=0;$i -lt $inputArray.Length-1; $i++) {
        if ($inputArray[$i] -gt $inputArray[$i+1]) {
            $temp = $inputArray[$i]
            $inputArray[$i] = $inputArray[$i+1]
            $inputArray[$i+1] = $temp
            $swapped = $true
        }
    }

    if ($swapped) {
        $varLength--
    } else {
        $varLength = 0
    }
}

Write-Host $inputArray
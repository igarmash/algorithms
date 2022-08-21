$inputArray = 1..9 | % { Get-Random -Minimum 1 -Maximum 9}

for ($i=0;$i -lt $inputArray.Length-1; $i++) {
    $j = $i + 1

    while ($j -gt 0) {
        if ($inputArray[$j-1] -gt $inputArray[$j]) {
            $temp = $inputArray[$j-1]
            $inputArray[$j-1] = $inputArray[$j]
            $inputArray[$j] = $temp
        }
        $j--
    }
}

Write-Host $inputArray
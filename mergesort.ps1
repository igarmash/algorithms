[int[]] $array = 1..9 | % { Get-Random -Minimum 1 -Maximum 9}
write-host "initial arr: $([string]$array)"

function mergesort ([int[]]$arr) {
    
    Write-Host "processing $([string]$arr)"

    [int[]] $arrLeft    = @()
    [int[]] $arrRight   = @()
    [int[]] $arrReturn  = @()

    if ($arr.Length -gt 1) {
        [int] $arrMid = [int]$arr.Count/2

        for ($i = 0; $i -le $arrMid-1 ; $i++) {
            $arrLeft += $arr[$i]
        }

        for ($i = $arrMid; $i -le $arr.Length-1; $i++) {
            $arrRight += $arr[$i]
        }

        Write-Host "arrLeft: $([string]$arrLeft)"
        Write-Host "arrRight: $([string]$arrRight)"
        Write-Host '---'

        $arrLeft = mergesort($arrLeft)
        $arrRight = mergesort($arrRight)

        Write-Host "merging $arrLeft and $arrRight"
        $arrReturn = merge -arrLeft $arrLeft -arrRight $arrRight
        Write-Host "result: $arrReturn"
    } else {
        $arrReturn = $arr
    }

    return $arrReturn
}

function merge ([int[]]$arrLeft, [int[]]$arrRight) {

    # fastest way to initialize an array in ps
    [int[]] $arrResult  = @(0) * ($arrLeft.Count + $arrRight.Count)
    [int] $indexLeft    = 0
    [int] $indexRight   = 0
    [int] $indexResult  = 0

    while (($indexLeft -lt $arrLeft.Length) -and ($indexRight -lt $arrRight.Length)) {
        if ($arrLeft[$indexLeft] -lt $arrRight[$indexRight]) {
            $arrResult[$indexResult] = $arrLeft[$indexLeft]
            $indexLeft++
        } else {
            $arrResult[$indexResult] = $arrRight[$indexRight]
            $indexRight++
        }
        $indexResult++
    }

    while ($indexLeft -lt $arrLeft.Length) {
        $arrResult[$indexResult] = $arrLeft[$indexLeft]
        $indexLeft++
        $indexResult++
    }

    while ($indexRight -lt $arrRight.Length) {
        $arrResult[$indexResult] = $arrRight[$indexRight]
        $indexRight++
        $indexResult++
    }

    return $arrResult
}

mergesort -arr $array
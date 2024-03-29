function Invoke-Something
{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory,ValueFromPipelineByPropertyName)]
        [string] $MyParam
    )

    Write-Output -InputObject "Config param = '$MyParam'"
}

function ConfigScope
{
    param(
        [Parameter(Mandatory,Position=0)]
        [scriptblock] $ConfigScript
    )

    & $ConfigScript
}


ConfigScope {
    . "$PSScriptRoot\scope1.ps1"

    Invoke-Something
}

ConfigScope {
    . "$PSScriptRoot\scope2.ps1"

    Invoke-Something
}

ConfigScope {
    . "$PSScriptRoot\scope3.ps1"

    Invoke-Something
}


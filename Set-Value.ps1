function Set-Value {
    <#
    .SYNOPSIS
        Replaces strings in files with provided value
    .NOTES
        Written By: Josh Wild, 18/01/2022
#>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $StringToReplace,
        [Parameter(Mandatory = $true)]
        [string]
        $NewValue,
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $FilePath
    )

    #
    # Output Parameters To Pipeline
    #
    Write-Host '-------------------------------------------------'
    Write-Host 'Value to replace'
    Write-Host '-------------------------------------------------'
    Write-Host $StringToReplace
    Write-Host '-------------------------------------------------'
    Write-Host '-------------------------------------------------'
    Write-Host 'File Path Provided'
    Write-Host '-------------------------------------------------'
    Write-Host $FilePath
    Write-Host '-------------------------------------------------'

    try {
        (Get-Content $FilePath) | ForEach-Object { $_ -replace "$StringToReplace", "$NewValue" } | Set-Content $FilePath
    }
    catch {
        Write-Error 'There was an error replacing the content in the files'
        Exit 1
    }

}

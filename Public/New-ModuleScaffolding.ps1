function New-ModuleScaffolding {
    [CmdletBinding()]
    param (
        # Parameter help description
        [Parameter(Mandatory = $false,
            ValueFromPipelineByPropertyName = $true)]
        $Repos = "$env:OneDriveCommercial\Repos",

        [Parameter(Mandatory = $true,
            ValueFromPipelineByPropertyName = $true)]
        $ModuleName,

        [Parameter(Mandatory = $true,
            ValueFromPipelineByPropertyName = $true)]
        $Author,

        [Parameter(Mandatory = $true,
            ValueFromPipelineByPropertyName = $true)]
        $Description
    )
    
    begin {
        
    }
    
    process {
        New-Item -Path $Repos -Name $ModuleName -ItemType Directory
        New-Item -Path "$Repos\$ModuleName" -Name Private -ItemType Directory
        New-Item -Path "$Repos\$ModuleName" -Name Public -ItemType Directory
        New-Item -Path "$Repos\$ModuleName" -Name en-CA -ItemType Directory
        New-Item -Path $Repos -Name Tests -ItemType Directory

        New-Item "$Repos\$ModuleName\$ModuleName.psm1" -ItemType File
        New-Item "$Repos\$ModuleName\$ModuleName.Format.ps1xml" -ItemType File
        New-Item "$Repos\$ModuleName\en-CA\about_$ModuleName.help.txt" -ItemType File
        New-Item "$Repos\Tests\$ModuleName.Tests.ps1" -ItemType File
        New-ModuleManifest -Path $Repos\$ModuleName\$ModuleName.psd1 `
            -RootModule $ModuleName.psm1 `
            -Description $Description `
            -PowerShellVersion 5.1 `
            -Author $Author `
            -FormatsToProcess "$ModuleName.Format.ps1xml"
        
    }
    
    end {
        
    }
}
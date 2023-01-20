<#
.SYNOPSIS
    Scaffolds a PowerShell module project for use with desired CICD platform for easy cross platform PowerShell development.
.DESCRIPTION
    Leverages Plaster to scaffold a PowerShell module that adheres to community best practices.
    Based on selections made this cmdlet will generate the necessary files for a variety of CICD platforms.
    Selections can also determine what CICD builds should be run enabling easy cross-platform verification (Windows/Linux/MacOS).
    InvokeBuild tasks will be created for validation / analysis / test / build automation.
    Basic Pester tests will be generated to get you started with either Pester 4 or Pester 5.
    Additional selections can generate other helpful files such as Git repository community files and VSCode project files.
    If no ModuleParameters are passed in, you will be prompted by Plaster for a decision on each template choice.
    If you pass in a partial ModuleParameters, you will be prompted by Plaster for any decisions from template choices.
    If you pass in a full ModuleParameters set, Plaster will not prompt you for any decisions from Plaster.
.EXAMPLE
    New-ModuleProject -DestinationPath $outPutPath

    Initiates Plaster template to scaffold a PowerShell project with customizable CI/CD integration options. Choices made during scaffolding will result in a PowerShell project tailored to the chosen CI/CD platform, or a standard PowerShell module project with no CI/CD integration.
.EXAMPLE
    New-ModuleProject -DestinationPath $outPutPath -NoLogo

    Initiates Plaster template to scaffold a PowerShell project with customizable CI/CD integration options. Choices made during scaffolding will result in a PowerShell project tailored to the chosen CI/CD platform, or a standard PowerShell module project with no CI/CD integration. The Plaster logo will be suppressed and not shown.
.EXAMPLE
    New-ModuleProject -DestinationPath $outPutPath -PassThru

    Initiates Plaster template to scaffold a PowerShell project with customizable CI/CD integration options. Choices made during scaffolding will result in a PowerShell project tailored to the chosen CI/CD platform, or a standard PowerShell module project with no CI/CD integration. An object will be returned containing details of the Plaster template deployment.
.EXAMPLE
    $moduleParameters = @{
        ModuleName  = 'ModuleName'
        Description = 'My awesome module is awesome'
        Version     = '0.0.1'
        FN          = 'user full name'
        CICD        = 'NONE'
        RepoType    = 'NONE'
        CodingStyle = 'Stroustrup'
        Help        = 'Yes'
        Pester      = '5'
        NoLogo      = $true
    }
    New-ModuleProject -ModuleParameters $moduleParameters -DestinationPath $outPutPath

    Scaffolds a basic PowerShell module project with no additional extras. You just get a basic PowerShell module construct.
.EXAMPLE
    $moduleParameters = @{
        ModuleName     = 'ModuleName'
        Description    = 'My awesome module is awesome'
        Version        = '0.0.1'
        FN             = 'user full name'
        CICD           = 'GITHUB'
        GitHubAOptions = 'windows', 'pwshcore', 'linux', 'macos'
        RepoType       = 'GITHUB'
        License        = 'MIT'
        Changelog      = 'CHANGELOG'
        COC            = 'CONDUCT'
        Contribute     = 'CONTRIBUTING'
        Security       = 'SECURITY'
        CodingStyle    = 'Stroustrup'
        Help           = 'Yes'
        Pester         = '5'
        S3Bucket       = 'PSGallery'
        NoLogo         = $true
    }
    New-ModuleProject -ModuleParameters $moduleParameters -DestinationPath $outPutPath

    Scaffolds a PowerShell module project for integration with GitHub Actions with the project code stored in GitHub. A full set of GitHub project supporting files is provided.
.EXAMPLE
    $moduleParameters = @{
        ModuleName  = 'ModuleName'
        Description = 'My awesome module is awesome'
        Version     = '0.0.1'
        FN          = 'user full name'
        CICD        = 'CODEBUILD'
        AWSOptions  = 'ps', 'pwshcore', 'pwsh'
        RepoType    = 'GITHUB'
        License     = 'MIT'
        Changelog   = 'CHANGELOG'
        COC         = 'CONDUCT'
        Contribute  = 'CONTRIBUTING'
        Security    = 'SECURITY'
        CodingStyle = 'Stroustrup'
        Help        = 'Yes'
        Pester      = '5'
        S3Bucket    = 'PSGallery'
        NoLogo      = $true
    }
    New-ModuleProject -ModuleParameters $moduleParameters -DestinationPath $outPutPath

    Scaffolds a PowerShell module project for integration with AWS CodeBuild with the project code stored in GitHub. A full set of GitHub project supporting files is provided.
.EXAMPLE
    $moduleParameters = @{
        ModuleName  = 'ModuleName'
        Description = 'My awesome module is awesome'
        Version      = '0.0.1'
        FN           = 'user full name'
        CICD         = 'AZURE'
        AzureOptions = 'windows', 'pwshcore', 'linux', 'macos'
        RepoType     = 'GITHUB'
        License      = 'None'
        Changelog    = 'NOCHANGELOG'
        COC          = 'NOCONDUCT'
        Contribute   = 'NOCONTRIBUTING'
        Security     = 'NOSECURITY'
        CodingStyle  = 'Stroustrup'
        Help         = 'Yes'
        Pester       = '5'
        NoLogo       = $true
    }
    New-ModuleProject -ModuleParameters $moduleParameters -DestinationPath $outPutPath

    Scaffolds a PowerShell module project for integration with Azure Pipelines with the project code stored in GitHub. No repository supporting files are included.
.EXAMPLE
    $moduleParameters = @{
        ModuleName  = 'ModuleName'
        Description = 'My awesome module is awesome'
        Version         = '0.0.1'
        FN              = 'user full name'
        CICD            = 'APPVEYOR'
        AppveyorOptions = 'windows', 'pwshcore', 'linux', 'macos'
        RepoType        = 'GITHUB'
        License         = 'None'
        Changelog       = 'NOCHANGELOG'
        COC             = 'NOCONDUCT'
        Contribute      = 'NOCONTRIBUTING'
        Security        = 'NOSECURITY'
        CodingStyle     = 'Stroustrup'
        Help            = 'Yes'
        Pester          = '5'
        PassThru        = $true
        NoLogo          = $true
    }
    New-ModuleProject -ModuleParameters $moduleParameters -DestinationPath $outPutPath

    Scaffolds a PowerShell module project for integration with Appveyor with the project code stored in GitHub. No repository supporting files are included.
.PARAMETER DestinationPath
    File path where PowerShell Module project will be created
.PARAMETER ModuleParameters
    Experimental parameter that allows you to provide all Plaster decisions inside a Hashtable. If any decision choice is not provided, Plaster will still prompt you for a decision. See NOTES for additional limitations.
.PARAMETER NoLogo
    Suppresses the display of the Plaster logo.
.PARAMETER PassThru
    Returns an object containing details of Plaster template deployment.
.PARAMETER Force
    Skip Confirmation
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    Author: Jake Morrison - @jakemorrison - https://www.techthoughts.info/

    Catesta Plaster templates have dynamic choices. This means that early choices influence subsequent choices.
    This requires an understanding of the template manifest schema which is provided in the Catesta docs.
    Due to the nature of the lower level Plaster engagement, this means it is possible to pass hashtable choices
    in ModuleParameters that are not supported. Read the manifest schemas to understand how to properly craft a ModuleParameters table.
.LINK
    https://github.com/techthoughts2/Catesta/blob/main/docs/New-ModuleProject.md
.LINK
    https://github.com/techthoughts2/Catesta/blob/main/docs/Catesta-Module-Manifest-Schema.md
.LINK
    https://docs.microsoft.com/powershell/scripting/developer/module/writing-a-windows-powershell-module
.LINK
    https://aws.amazon.com/codebuild/
.LINK
    https://help.github.com/actions
.LINK
    https://azure.microsoft.com/services/devops/
.LINK
    https://www.appveyor.com/
.COMPONENT
    Catesta
#>
function New-ModuleProject {
    [CmdletBinding(ConfirmImpact = 'Low',
        SupportsShouldProcess = $true)]
    param (
        [Parameter(Mandatory = $true,
            Position = 0,
            HelpMessage = 'File path where PowerShell Module project will be created')]
        [string]
        $DestinationPath,

        [Parameter(Mandatory = $false,
            HelpMessage = 'Plaster choices inside hashtable')]
        [hashtable]
        $ModuleParameters,

        [Parameter(Mandatory = $false,
            HelpMessage = 'Suppresses the display of the Plaster logo')]
        [switch]$NoLogo,

        [Parameter(Mandatory = $false,
            HelpMessage = 'Plaster template object')]
        [switch]$PassThru,

        [Parameter(Mandatory = $false,
            HelpMessage = 'Skip confirmation')]
        [switch]$Force
    )

    Begin {

        if (-not $PSBoundParameters.ContainsKey('Verbose')) {
            $VerbosePreference = $PSCmdlet.SessionState.PSVariable.GetValue('VerbosePreference')
        }
        if (-not $PSBoundParameters.ContainsKey('Confirm')) {
            $ConfirmPreference = $PSCmdlet.SessionState.PSVariable.GetValue('ConfirmPreference')
        }
        if (-not $PSBoundParameters.ContainsKey('WhatIf')) {
            $WhatIfPreference = $PSCmdlet.SessionState.PSVariable.GetValue('WhatIfPreference')
        }

        Write-Verbose -Message ('[{0}] Confirm={1} ConfirmPreference={2} WhatIf={3} WhatIfPreference={4}' -f $MyInvocation.MyCommand, $Confirm, $ConfirmPreference, $WhatIf, $WhatIfPreference)
        Write-Verbose -Message ('ParameterSetName: {0}' -f $PSCmdlet.ParameterSetName)
    } #begin
    Process {

        Write-Verbose -Message 'Importing Plaster...'
        try {
            Import-Module -Name Plaster -ErrorAction Stop
            Write-Verbose 'Plaster Imported.'
        }
        catch {
            throw $_
        }

        $path = 'Module'
        Write-Verbose -Message ('Template Path: {0}\{1}' -f $script:resourcePath, $path)

        if ($ModuleParameters) {

            # process overrides for ModuleParameters that do not permit customization
            $ModuleParameters['VAULT'] = 'NOTVAULT'
            $ModuleParameters['ErrorAction'] = 'Stop'
            $ModuleParameters['TemplatePath'] = '{0}\{1}' -f $script:resourcePath, $path
            $ModuleParameters['DestinationPath'] = $DestinationPath

            if ($PassThru -eq $true) {
                $ModuleParameters['PassThru'] = $true
            }
            $invokePlasterSplat = $ModuleParameters

            $shouldProcessMessage = 'Scaffolding PowerShell module project with provided custom module parameters: {0}' -f $($invokePlasterSplat | Out-String)

        } #if_ModuleParameters
        else {
            $invokePlasterSplat = @{
                TemplatePath    = '{0}\{1}' -f $script:resourcePath, $path
                DestinationPath = $DestinationPath
                VAULT           = 'NOTVAULT'
                PassThru        = $PassThru
                NoLogo          = $NoLogo
                ErrorAction     = 'Stop'
            }

            $shouldProcessMessage = 'Scaffolding PowerShell module project with: {0}' -f $($invokePlasterSplat | Out-String)

        } #else_ModuleParameters

        if ($Force -or $PSCmdlet.ShouldProcess($DestinationPath, $shouldProcessMessage)) {
            Write-Verbose -Message ('[{0}] Reached command' -f $MyInvocation.MyCommand)

            # Save current value of $ConfirmPreference
            $originalConfirmPreference = $ConfirmPreference
            # Set $ConfirmPreference to 'None'
            $ConfirmPreference = 'None'

            Write-Verbose -Message 'Deploying template...'
            $result = Invoke-Plaster @invokePlasterSplat
            Write-Verbose -Message 'Template Deployed.'

            # Set $ConfirmPreference back to original value
            $ConfirmPreference = $originalConfirmPreference
        } #if_Should

    } #process
    End {
        if ($PassThru -or $ModuleParameters.PassThru -eq $true) {
            return $result
        }
    } #end
} #New-ModuleProject

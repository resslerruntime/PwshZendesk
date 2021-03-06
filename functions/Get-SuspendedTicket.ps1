
function Get-SuspendedTicket {

    [OutputType([PSCustomObject])]
    [CMDletBinding()]
    Param (

        # Unique Id of the suspended ticket to retrieve
        [Parameter(Mandatory = $false)]
        [ValidateRange(1, [Int64]::MaxValue)]
        [Int64]
        $Id,

        # Zendesk Connection Context from `Get-ZendeskConnection`
        [Parameter(Mandatory = $false)]
        [PSTypeName('ZendeskContext')]
        [PSCustomObject]
        $Context = $null
    )

    if ($PSBoundParameter.containsKey('UserId')) {
        $path = "/api/v2/suspended_tickets/{id}.json"
        $key = 'ticket'
    } else {
        $path = '/api/v2/suspended_tickets.json'
        $key = 'tickets'
    }

    $result = Invoke-Method -Context $Context -Path $path -Verbose:$VerbosePreference
    $result | Select-Object -Expand $key

}

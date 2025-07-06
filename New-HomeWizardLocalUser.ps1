Param(
    [Parameter(Mandatory = $true)]
    [string]
    $DeviceIp,

    [Parameter(Mandatory = $true)]
    [string]
    $Username
)

$restParameters = @{
    Uri = "https://$DeviceIp/api/user"
    Method = 'POST'
    Body = @{
        name = "local/$Username"
    } | ConvertTo-Json
    ContentType = 'application/json'
    Headers = @{
        'Accept' = 'application/json'
        "X-Api-Version" = '2'
    }
    SkipCertificateCheck = $true
}

$response = $null
while ($null -eq $response) {
    try {
        $response = Invoke-RestMethod @restParameters
        $response
    } catch {
        Write-Host "Failed to connect, retrying in 5 seconds..."
        Start-Sleep -Seconds 5
    }
}
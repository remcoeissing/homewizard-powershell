Param(
    [Parameter(Mandatory = $true)]
    [string]
    $DeviceIp,

    [Parameter(Mandatory = $true)]
    [string]
    $Bearer,

    [Parameter(Mandatory = $false)]
    [ValidateRange(0,100)]
    [int]
    $LightBrightness = 50
)

$restParameters = @{
    Uri = "https://$DeviceIp/api/system"
    Method = 'PUT'
    Headers = @{
        'Accept' = 'application/json'
        "X-Api-Version" = '2'
        "Authorization" = "Bearer $Bearer"
    }
    Body = @{
        status_led_brightness_pct = $LightBrightness
    } | ConvertTo-Json
    SkipCertificateCheck = $true
}

Invoke-RestMethod @restParameters -Verbose
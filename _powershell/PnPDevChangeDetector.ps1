# Detects new and removed devices
# Most of this came from some SpiceWorks thread, written by user Gorfmaster1
# https://community.spiceworks.com/topic/2346535-how-to-identify-repeated-device-disconnected-tone-on-win-10-pro-pc
# The pastebin with most of the original code https://pastebin.com/RrB4RkRM
# This did not help me find the culprit behind my computer's phantom device disconnects, but it does work for USB devices

$CurrentState = $null
$NewState = $null

while($true) {
    if(-not($CurrentState)) {
        $CurrentState = Get-PnpDevice -Status OK
    } else {
        $NewState = Get-PnpDevice -Status OK
        $Changes = $null
        $Changes = Compare-Object -ReferenceObject $CurrentState -DifferenceObject $NewState
        Write-Host -NoNewline "."
        if($Changes) {
            $Additions = @()
            $Removals = @()
            foreach($Change in $Changes) {
                if($Change.SideIndicator -eq "=>") {
                    $Additions += @($Change.InputObject)
                } elseif ($Change.SideIndicator -eq "<=") {
                    $Removals += @($Change.InputObject)
                }
            }
            Write-Host $(Get-Date) -NoNewline
            if($Additions) {
                Write-Host "`n`nNew devices detected..." -ForegroundColor Green
                Write-Output $("="*50)
                $Additions | ft Class,FriendlyName,InstanceId,Caption,Description,Status,DeviceID -AutoSize
                Write-Output $("="*50)
            }

            if($Removals) {
                Write-Host "`nDevices removed since last check..." - -ForegroundColor Red
                Write-Output $("="*50)
                $Removals | ft Class,FriendlyName,InstanceId,Caption,Description,Status,DeviceID -AutoSize
                Write-Output $("="*50)
            }

        }
        $CurrentState = $NewState
    }
    Start-Sleep -Seconds 5
}

# Windows Endpoint Security Monitoring
# Week 1 SOC Project
# Evidence Collection Script

$Project = "$HOME\Desktop\SOC-Week01"
$Logs = "$Project\Logs"

New-Item -ItemType Directory -Path $Logs -Force |
    Out-Null

Write-Host "Starting SOC evidence collection..."

# 1. Collect authentication events
try {

    $AuthEvents = Get-WinEvent -FilterHashtable @{
        LogName = 'Security'
        Id = 4624, 4625
    } -MaxEvents 200 -ErrorAction Stop

    $AuthEvents |
        Select-Object TimeCreated, Id, ProviderName, Message |
        Export-Csv "$Logs\authentication-events.csv" `
        -NoTypeInformation

    Write-Host "Authentication events collected."

}
catch {

    Write-Host "Unable to collect authentication events."
    Write-Host $_.Exception.Message

}

# 2. Collect running processes
try {

    Get-Process |
        Select-Object ProcessName, Id, CPU, WorkingSet64 |
        Export-Csv "$Logs\process-inventory.csv" `
        -NoTypeInformation

    Write-Host "Process inventory collected."

}
catch {

    Write-Host "Unable to collect process information."

}

# 3. Collect Windows services
try {

    Get-CimInstance Win32_Service |
        Select-Object Name, DisplayName, State, StartMode, PathName |
        Export-Csv "$Logs\service-inventory.csv" `
        -NoTypeInformation

    Write-Host "Service inventory collected."

}
catch {

    Write-Host "Unable to collect service information."

}

# 4. Collect Sysmon events, if available
try {

    $SysmonEvents = Get-WinEvent -FilterHashtable @{
        LogName = 'Microsoft-Windows-Sysmon/Operational'
        Id = 1, 3, 11
    } -MaxEvents 100 -ErrorAction Stop

    $SysmonEvents |
        Select-Object TimeCreated, Id, ProviderName, Message |
        Export-Csv "$Logs\sysmon-events.csv" `
        -NoTypeInformation

    Write-Host "Sysmon events collected."

}
catch {

    Write-Host "Sysmon events unavailable."
    Write-Host "Continuing without Sysmon evidence."

}

Write-Host ""
Write-Host "Evidence collection completed."
Write-Host "Output directory: $Logs"
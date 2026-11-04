# Detection: Repeated Failed Logons
# Event ID: 4625

$Events = Get-WinEvent -FilterHashtable @{
    LogName = 'Security'
    Id = 4625
} -MaxEvents 500 -ErrorAction SilentlyContinue

$Results = foreach ($Event in $Events) {

    [xml]$Xml = $Event.ToXml()

    $Data = @{}

    foreach ($Item in $Xml.Event.EventData.Data) {
        $Data[$Item.Name] = $Item.'#text'
    }

    [PSCustomObject]@{
        TimeCreated = $Event.TimeCreated
        EventID = $Event.Id
        TargetUser = $Data['TargetUserName']
        LogonType = $Data['LogonType']
        SourceIP = $Data['IpAddress']
        Status = $Data['Status']
        SubStatus = $Data['SubStatus']
    }
}

$Results |
Group-Object TargetUser, SourceIP |
Where-Object { $_.Count -ge 3 } |
Select-Object Name, Count
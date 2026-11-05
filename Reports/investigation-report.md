Week 1: Windows Endpoint Security Monitoring and Investigation Lab

1. Project Overview

This project focuses on monitoring and investigating Windows endpoint security events using Windows Event Viewer, PowerShell, and Sysmon.

The objective is to understand authentication activity, process execution, service configurations, and basic security detection techniques.

2. Tools Used

- Windows 10 Pro
- Windows Event Viewer
- PowerShell
- Sysmon
- Git and GitHub

 3. Investigation Activities

### Authentication Investigation

Windows Security events were examined to understand successful and failed authentication activity.

Event ID 4624 represents a successful logon.

Event ID 4625 represents a failed logon.

### Process Investigation

PowerShell was used to collect running process information, including process names, process IDs, CPU usage, and memory usage.

## Service Investigation

Windows service information was collected to examine service names, running states, startup configurations, and executable paths.

## Evidence Collection

Security events, process information, and service information were exported into CSV files.

An investigation timeline was created to organize authentication events chronologically.

4. Detection Engineering

A basic failed-logon detection was developed to identify repeated authentication failures.

The detection is intended to identify activity requiring further investigation.

Repeated failed logons do not independently prove a brute-force attack.

5. Evidence Collected

- Authentication event records
- Process inventory
- Windows service inventory
- Investigation timeline
- Sysmon process events, when available
- Event Viewer screenshots

6. Limitations

The project uses a single Windows endpoint and does not include centralized SIEM monitoring.

Detection results depend on the available Windows audit events and Sysmon configuration.

Additional evidence may be necessary to confirm suspicious activity.

7. Conclusion

This project provided practical experience in Windows endpoint monitoring, authentication investigation, process analysis, service investigation, and evidence collection.

The project establishes a foundation for advanced SOC activities such as threat hunting, event correlation, incident response, and detection engineering.
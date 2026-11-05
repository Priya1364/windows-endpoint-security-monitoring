Windows Endpoint Security Monitoring and Investigation Lab

Overview

A lightweight SOC analyst project focused on Windows endpoint monitoring, authentication investigation, process analysis, and basic detection engineering.

The project uses built-in Windows tools and PowerShell to collect security evidence without requiring Wazuh or a heavy SIEM installation.

Objectives

- Investigate Windows Security events.
- Analyse successful and failed logons.
- Collect process and service inventories.
- Build a failed-logon detection.
- Preserve investigation evidence.
- Develop an investigation timeline.

Tools Used

- Windows Event Viewer
- PowerShell
- Windows Security logs
- Sysmon (optional)
- Git and GitHub

Project Structure

SOC-Week01/
├── Evidence/
├── Reports/
├── Scripts/
├── Logs/
├── event.txt
└── README.md

Key Event IDs

Event ID| Description
4624| Successful logon
4625| Failed logon
4634| Logoff
4672| Special privileges assigned to a logon

Detection Logic

The project includes a basic detection for repeated failed logons.

The detection groups events by target account and source IP and identifies groups containing at least three events.

This is a starting point for detection engineering and requires validation to reduce false positives.

Evidence

The project preserves event logs, process inventories, service inventories, and screenshots.

Learning Outcomes

- Windows endpoint monitoring
- Security event investigation
- Authentication analysis
- Process and service investigation
- Basic detection engineering
- Evidence preservation
- SOC investigation reporting

Disclaimer

This project is performed on a personal Windows lab environment for educational purposes.

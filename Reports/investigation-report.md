Windows Endpoint Security Monitoring and Investigation Lab

1. Project Overview

Project: Windows Endpoint Security Monitoring and Investigation Lab
Project Series: SOC Analyst — Week 1
Operating System: Windows 10 Pro, 64-bit
Tools: Windows Event Viewer, PowerShell, Sysmon, Python (optional)

2. Problem Statement

Windows endpoints generate security events related to authentication, processes, services, and system activity.

Without proper investigation, suspicious behavior may remain unnoticed. This project demonstrates a lightweight method for collecting and analysing Windows security evidence without requiring a centralized SIEM.

3. Project Objectives

- Monitor Windows security events.
- Investigate successful and failed logons.
- Collect process and service information.
- Develop a basic failed-logon detection.
- Preserve investigation evidence.
- Create an incident timeline.
- Document findings in a structured report.

4. Methodology

The investigation follows these stages:

1. Windows Security log examination.
2. Authentication event investigation.
3. Process inventory collection.
4. Service inventory collection.
5. Failed-logon detection.
6. Evidence preservation.
7. Timeline creation.
8. Investigation reporting.

5. Findings

Successful Logon Investigation

Event ID 4624 was examined.

The inspected event showed the SYSTEM account and Logon ID 0x3E7.

This is consistent with a Windows SYSTEM logon session. The event alone does not indicate malicious activity.

Failed Logon Investigation

Event ID 4625 was examined.

Three matching events were visible in the filtered Security log.

The inspected event contained Status 0xC000006D, SubStatus 0xC0000380, and Logon Type 2.

These values require contextual interpretation. The event alone is insufficient to establish malicious activity.

Process Investigation

Running processes were collected using PowerShell.

Process names, process IDs, CPU usage, and memory usage were recorded.

Service Investigation

Windows service information was collected.

Service names, states, startup modes, and executable paths were recorded for review.

Detection Engineering

A basic rule was developed to identify groups of failed logons sharing the same target account and source IP.

The detection is intended for investigation and requires validation against normal activity.

6. Evidence Collection

The project stores collected evidence in CSV, TXT, and EVTX formats.

Screenshots document the investigation procedure and the observed event details.

7. Limitations

- The project uses a single Windows endpoint.
- The investigation is not a centralized SIEM deployment.
- Available events depend on Windows audit configuration.
- The failed-logon detection may generate false positives.
- A failed logon does not independently establish an attack.
- Additional endpoint and network evidence may be needed for attribution.

8. Conclusion

This project demonstrates a practical approach to Windows endpoint security monitoring using built-in tools.

The investigation covered authentication events, process activity, service information, detection logic, and evidence preservation.

The project provides a foundation for more advanced SOC activities such as threat hunting, event correlation, incident response, and detection engineering.
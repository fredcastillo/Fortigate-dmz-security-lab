<h1 align="center">🛡️ FortiGate DMZ Security Lab</h1>

<p align="center">
  <a href="https://github.com/fredcastillo/fortigate-dmz-security-lab"><img src="https://img.shields.io/badge/Lab-GNS3-7d5fff?style=for-the-badge" alt="GNS3"></a>
  <a href="https://github.com/fredcastillo/fortigate-dmz-security-lab"><img src="https://img.shields.io/badge/Firewall-FortiGate-e11d48?style=for-the-badge" alt="FortiGate"></a>
  <a href="https://github.com/fredcastillo/fortigate-dmz-security-lab"><img src="https://img.shields.io/badge/FortiOS-v7.0.9-EE3124?style=for-the-badge" alt="FortiOS"></a>
  <a href="https://github.com/fredcastillo/fortigate-dmz-security-lab"><img src="https://img.shields.io/badge/Architecture-DMZ%20%2B%20VLANs-2D72D9?style=for-the-badge" alt="Architecture"></a>
  <a href="https://github.com/fredcastillo/fortigate-dmz-security-lab"><img src="https://img.shields.io/badge/Policies-SSH%20Restricted%20%7C%20No%20DMZ%20Internet-FF6F00?style=for-the-badge" alt="Policies"></a>
  <a href="https://github.com/fredcastillo/fortigate-dmz-security-lab"><img src="https://img.shields.io/badge/Servers-Caja%20%7C%20Inventario%20%7C%20DB-9C27B0?style=for-the-badge" alt="Servers"></a>
  <a href="https://github.com/fredcastillo/fortigate-dmz-security-lab"><img src="https://img.shields.io/badge/Status-Completed-brightgreen?style=for-the-badge" alt="Status"></a>
</p>

> **Author:** Fred Sneyder Castillo Apolinar  **Student ID:** 2025-2175  **Program:** Information Security Technologist — ITLA  **Platform:** GNS3 + GNS3 VM + FortiGate-VM64-KVM  **FortiOS:** 7.0.9 build 0444

> ## 🎥 Demonstration Video
<div align="center">
  <a href="https://www.youtube.com/watch?v=iKMu1Q_3kfY">
    <img src="https://img.youtube.com/vi/iKMu1Q_3kfY/maxresdefault.jpg" alt="Ver video" width="700">
  </a>
</div>

## Purpose

This repository documents a segmented network-security laboratory built in GNS3. FortiGate is used as the central security control point between user networks and a server DMZ.

The lab demonstrates DHCP, VLAN segmentation, server separation, firewall policies, restricted SSH access, blocked access to the Inventory system from VLAN 10, controlled update access from the DMZ, and blocked arbitrary HTTPS Internet access from the DMZ.

## Visual evidence

The The 18 screenshots are stored under `images/`, divided into four folders by evidence category. Documentation files under `docs/` reference them using `../images/<filename>.png`, so GitHub renders them automatically when the PNGs are present.

![01-topologia-general.png](images/01-topology/01-topologia-general.png)

See the full evidence index: [`docs/06-evidencias.md`](docs/06-evidencias.md).

## Repository structure

```text
.
├── README.md
├── README-EN.md
├── docs/                  # Documentation only
├── images/
│   ├── 01-topologia/     # 01–03
│   ├── 02-fortigate/     # 04–08
│   ├── 03-switches/      # 09–10
│   └── 04-tests/         # 11–18
├── diagrams/              # Editable Mermaid sources
├── configs/               # Configuration and running-configs
├── scripts/               # Lab scripts
└── video/                 # Video material
```

## Main evidence set

| # | Evidence |
|---:|---|
| 01 | `01-topologia-general.png` |
| 02 | `02-topologia-lan-vlans.png` |
| 03 | `03-topologia-dmz-servidores.png` |
| 04 | `04-fortigate-interfaces.png` |
| 05 | `05-fortigate-dhcp-vlans.png` |
| 06 | `06-fortigate-firewall-policies.png` |
| 07 | `07-fortigate-update-addresses.png` |
| 08 | `08-fortigate-dns.png` |
| 09 | `09-sw-a-vlans-security.png` |
| 10 | `10-sw-b-dmz.png` |
| 11 | `11-test-vlan20-dhcp-dns.png` |
| 12 | `12-test-vlan20-dns-resolution.png` |
| 13 | `13-test-vlan20-ssh-allowed.png` |
| 14 | `14-test-vlan10-ssh-blocked.png` |
| 15 | `15-test-vlan10-web-caja-allowed.png` |
| 16 | `16-test-vlan10-web-inventario-blocked.png` |
| 17 | `17-test-dmz-ubuntu-updates-allowed.png` |
| 18 | `18-test-dmz-internet-blocked.png` |

## Important documentation rule

`docs/` contains documentation only. Images are intentionally stored at the repository root in `images/`, divided into four category folders, and the Markdown paths were written accordingly.

## Lab credentials

```text
Username: labssh
Password: LabSSH123!
```

These credentials are for academic lab use only and must not be reused in production.

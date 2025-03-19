---
tags:
  - "#samba"
  - "#enumeration"
  - "#smbclient"
  - "#crackmapexec"
---
---
## 1. Enumerating [[SMB]] Shares with `smbclient`

`smbclient` is a command-line tool for interacting with SMB/CIFS shares. It can list available shares, connect to them, and transfer files.

### a) Listing SMB Shares

```bash
smbclient -L //target-ip -N
```

**Options:**

- `-L` lists available shares on the target.
- `-N` connects without a password (useful for anonymous access tests).

### b) Connecting to a Share

```bash
smbclient //target-ip/share_name -N
```

Once connected, you can navigate directories and transfer files using FTP-like commands.

---

## 2. Enumerating SMB with `crackmapexec`

`crackmapexec` is a powerful tool for assessing SMB shares, credentials, and misconfigurations.

### a) Scanning for SMB Shares

```bash
crackmapexec smb target-ip/24 --shares
```

This command checks available shares across a subnet.

### b) Checking for Anonymous Access

```bash
crackmapexec smb target-ip -u "" -p "" --shares
```

This tests if anonymous login is allowed.

### c) Validating Credentials

```bash
crackmapexec smb target-ip -u username -p password
```

It checks if given credentials are valid on the target.

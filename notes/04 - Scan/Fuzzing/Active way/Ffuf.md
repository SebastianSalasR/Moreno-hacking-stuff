---
tags:
  - "#pentesting"
  - fuzzing
  - "#ffuf"
  - "#directories"
  - "#files"
  - "#web-security"
  - "#bugbounty"
  - "#enumeration"
---
---
# FFUF (Fast Web Fuzzer) Cheat Sheet

## Overview

> [FFUF](https://www.freecodecamp.org/news/web-security-fuzz-web-applications-using-ffuf/) (**Fuzz Faster U Fool**) is a powerful and fast web fuzzer used for discovering directories, files, virtual hosts, and parameters in web applications. It is widely used in penetration testing and bug bounty hunting.

## Basic Syntax

```bash
ffuf -u <URL> -w <wordlist>
```

- `-u <URL>` → Target URL with `FUZZ` as a placeholder for fuzzing.
- `-w <wordlist>` → Path to a wordlist containing possible inputs.

---

## Directory and File Enumeration

```bash
ffuf -u http://example.com/FUZZ -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt
```

- Scans for directories and files.
- Replace `FUZZ` with words from the wordlist.

### Filter Unwanted Responses

```bash
ffuf -u http://example.com/FUZZ -w wordlist.txt -fc 404
```

- `-fc 404` → Filter out 404 responses.

### Append File Extensions

```bash
ffuf -u http://example.com/FUZZ.php -w words.txt
```

- Checks for `.php` files (e.g., `admin.php`, `index.php`).

---

## Virtual Host Enumeration

```bash
ffuf -u http://example.com -H "Host: FUZZ.example.com" -w vhosts.txt
```

- Fuzzes the `Host` header to find virtual hosts.

---

## Subdomain Enumeration

```bash
ffuf -u https://FUZZ.example.com -w subdomains.txt -mc 200
```

- Finds active subdomains.
- `-mc 200` → Show only status 200 responses.

---

## Parameter Discovery

```bash
ffuf -u "http://example.com/index.php?FUZZ=test" -w params.txt -mc 200
```

- Discovers hidden GET parameters.

```bash
ffuf -u "http://example.com/index.php" -X POST -d "FUZZ=value" -w params.txt -mc 200
```

- Discovers hidden POST parameters.

---

## Advanced Filtering

- `-mc <code>` → Match responses with specific status codes.
- `-fc <code>` → Filter responses by status codes.
- `-fs <size>` → Filter responses by response size.
- `-fl <lines>` → Filter responses by number of lines.

---

## Speed Optimization

```bash
ffuf -u http://example.com/FUZZ -w words.txt -t 100
```

- `-t 100` → Use 100 threads for faster scanning.

---

## Output Results

```bash
ffuf -u http://example.com/FUZZ -w words.txt -o results.txt -of json
```

- `-o results.txt` → Save output to a file.
- `-of json` → Output format (json, csv, html, md, etc.).

---

## Useful Wordlists

- `/usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt`
- `/usr/share/seclists/Discovery/Web-Content/common.txt`
- `/usr/share/seclists/Discovery/DNS/subdomains-top1million-5000.txt`

---
tags:
  - "#fuzzing"
  - "#virtualhosts"
  - "#subdomain-enum"
  - "#directories"
  - "#files"
  - "#dirbusting"
aliases:
  - fuzzing
  - fuzz
---
# Disclaimer:
Since imp pip package is deprecated in python 3.12, I don't recommend using this tool :/

---
# **WFuzz for Directory and File Enumeration**

WFuzz can be used to discover **hidden directories and files** on a web server by fuzzing URLs. This is useful for identifying sensitive files, admin panels, backups, and misconfigurations.

### **Basic Syntax:**

```bash
wfuzz -u http://TARGET/FUZZ -w <wordlist>
```

### **Main Parameters:**

- `-u <URL>` → Target URL with `FUZZ` as a placeholder for directory or file names.
- `-w <wordlist>` → Wordlist containing possible directory or file names.
- `--hc <code>` → Hide responses with a specific HTTP status code (e.g., `--hc 404` to ignore "Not Found" errors).
- `--hh <length>` → Hide responses based on content length (useful for ignoring duplicate error pages).
- `-t <num>` → Number of threads for faster execution.
- `--sc <code>` → Show only specific HTTP response codes (e.g., `--sc 200` for successful responses).

### **Example Usage:**

```bash
wfuzz -u http://example.com/FUZZ -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt --hc 404
```

This scans for directories and files using a common wordlist while ignoring 404 errors.

#### **Including File Extensions:**

```bash
wfuzz -u http://example.com/FUZZ.php -w /usr/share/wordlists/raft-small-words.txt --hc 404
```

This scans for `.php` files like `admin.php`, `index.php`, etc.

### **How It Works:**

WFuzz replaces `FUZZ` in the URL with words from the wordlist and checks the server's response. If a directory or file exists, the response will differ from an error page.

### **Common Use Cases:**

- Finding **hidden admin panels** (e.g., `/admin`, `/login`).
- Discovering **backup files** (e.g., `backup.zip`, `database.sql`).
- Identifying **exposed sensitive files** (e.g., `.git`, `.env`, `config.php`).

---
# **WFuzz for Virtual Host Enumeration**

`wfuzz` is a powerful web fuzzing tool that can be used to enumerate **Virtual Hosts** by modifying the `Host` header in HTTP requests. This helps uncover hidden subdomains or additional websites hosted on the same server.

### **Basic Syntax:**

```bash
wfuzz -u http://TARGET/ -H "Host: FUZZ.TARGET" -w <wordlist>
```

### **Main Parameters:**

- `-u <URL>` → Target URL.
- `-H "Host: FUZZ.TARGET"` → Modifies the `Host` header to test different virtual hosts.
- `-w <wordlist>` → List of possible virtual hostnames.
- `--hc <code>` → Hide responses with a specific HTTP status code (e.g., `--hc 400,404` to ignore errors).
- `--hh <length>` → Hide responses based on content length.
- `-t <num>` → Number of threads for faster execution.

### **Example Usage:**

```bash
wfuzz -u http://example.com/ -H "Host: FUZZ.example.com" -w /usr/share/wordlists/virtual-hosts.txt --hc 404
```

This will attempt to discover virtual hosts such as `admin.example.com`, `dev.example.com`, etc., while ignoring `404` errors.

### **How It Works:**

WFuzz replaces `FUZZ` in the `Host` header with words from the provided wordlist. If a valid virtual host exists, the server will respond differently than for non-existent ones.
### **Common Use Cases:**

- Finding hidden virtual hosts on shared hosting servers.
- Identifying staging or development environments (`staging.example.com`).
- Enumerating additional applications hosted on the same server.

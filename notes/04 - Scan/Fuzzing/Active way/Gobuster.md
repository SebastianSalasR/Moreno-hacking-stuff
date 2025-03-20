---
tags:
  - scan
  - "#subdomains"
  - "#ssl"
---
---
>Gobuster is a tool used to brute-force: URIs (directories and files) in web sites, DNS subdomains (with wildcard support), Virtual Host names on target web servers, Open Amazon S3 buckets, Open Google Cloud buckets and TFTP servers.

More information [here](https://github.com/OJ/gobuster)

---
# Listing virtual hosts

The `vhost` command in **Gobuster** is used to enumerate **Virtual Hosts** on a web server. Virtual Hosts allow a single server to host multiple websites on the same IP address by distinguishing them using domain names. Sometimes, hidden subdomains or specific configurations can be discovered using this technique.

### **Basic Syntax:**

```bash
gobuster vhost -u <URL> -w <wordlist>
```

### **Main Parameters:**

- `-u <URL>` → Target URL.
- `-w <wordlist>` → File containing a list of possible Virtual Host names.
- `-t <num>` → Number of threads to speed up the search (optional).
- `-r` → Prevents following redirects (optional).
- `-o <file>` → Saves results to a file (optional).
- `-k` → Ignores SSL certificate issues (optional).

### **Example Usage:**

```bash
gobuster vhost -u http://example.com -w /usr/share/wordlists/virtual-hosts.txt
```

This will attempt to discover hidden subdomains like `admin.example.com`, `dev.example.com`, etc.

### **How It Works:**

Gobuster makes HTTP requests by modifying the `Host` header and checks for differences in responses to identify valid Virtual Hosts.

#### **Typical Use Cases:**

- Discovering internal sites on a shared server.
- Identifying development or testing environments (e.g., `staging.example.com`).
- Detecting hidden web applications on a server.

This technique is useful for **pentesting** and web security enumeration.
